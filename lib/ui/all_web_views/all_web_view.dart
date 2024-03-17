import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PostRedirectScreen extends StatefulWidget {
  final String postUrl;
  const PostRedirectScreen({super.key, required this.postUrl});

  @override
  State<PostRedirectScreen> createState() => _PostRedirectScreenState();
}

class _PostRedirectScreenState extends State<PostRedirectScreen> {
  WebViewController _controller = WebViewController();

  int loadingPercentage = 0;

  initializeWebWiew(BuildContext context) async {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            if (mounted) {
              setState(() {
                loadingPercentage = progress;
              });
            }
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) async {
            if (mounted) {
              setState(() {
                loadingPercentage = 100;
              });
            }
            // if (checkoutUrl != url) {
            //   changePayementStatus();
            // }
          },
          onWebResourceError: (WebResourceError error) {
            // showPaymentErrorInfo();
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..addJavaScriptChannel(
        'Terms and conditions',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse(widget.postUrl));
    //
  }

  @override
  void initState() {
    super.initState();

    initializeWebWiew(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Terms and conditions",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: loadingPercentage < 100
          ? Column(
              children: [
                if (loadingPercentage < 100) const CircularProgressIndicator(),
              ],
            )
          : Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: WebViewWidget(
                controller: _controller,
              ),
            ),
    );
  }
}
