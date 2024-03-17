import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class CustomPdfView extends StatefulWidget {
  final String pdfPath;
  const CustomPdfView({Key? key, required this.pdfPath}) : super(key: key);

  @override
  State<CustomPdfView> createState() => _CustomPdfViewState();
}

class _CustomPdfViewState extends State<CustomPdfView> {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  bool isLoading = false;
  String errorMessage = '';
  String remotePDFpath = '';

  Future<File> createFileOfPdfUrl() async {
    setState(() {
      isLoading = true;
    });
    Completer<File> completer = Completer();
    print("Start download file from internet!");
    print(widget.pdfPath.substring(2));
    try {
      final url = widget.pdfPath.substring(2);
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      print("Download files");
      print("${dir.path}/$filename");
      File file = File("${dir.path}/$filename");

      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  @override
  void initState() {
    super.initState();

    createFileOfPdfUrl().then((f) {
      setState(() {
        remotePDFpath = f.path;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FutureBuilder<PDFViewController>(
        future: _controller.future,
        builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
          if (snapshot.hasData) {
            return FloatingActionButton.extended(
              label: Text("Go to ${pages! ~/ 2}"),
              onPressed: () async {
                await snapshot.data!.setPage(pages! ~/ 2);
              },
            );
          }

          return Container();
        },
      ),
      body: SafeArea(
        child: isLoading
            ? SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.90,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : PDFView(
                filePath: remotePDFpath,
                enableSwipe: true,
                swipeHorizontal: false,
                autoSpacing: false,
                pageFling: false,
                onRender: (_pages) {
                  setState(() {
                    pages = _pages;
                    isReady = true;
                  });
                },
                onError: (error) {
                  print(error.toString());
                },
                onPageError: (page, error) {
                  print('$page: ${error.toString()}');
                },
                onViewCreated: (PDFViewController pdfViewController) {
                  _controller.complete(pdfViewController);
                },
                onPageChanged: (int? page, int? total) {
                  print('page change: $page/$total');
                  setState(() {
                    currentPage = page;
                  });
                },
              ),
      ),
    );
  }
}
