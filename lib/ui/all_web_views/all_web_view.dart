// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as dom;
import 'package:hkorn_new_dev_vijay/model/search_model.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_appbar.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/spinner.dart';
import 'package:url_launcher/url_launcher.dart';

class PostRedirectScreen extends StatefulWidget {
  final SearchResultModel result;
  const PostRedirectScreen({super.key, required this.result});

  @override
  State<PostRedirectScreen> createState() => _PostRedirectScreenState();
}

class _PostRedirectScreenState extends State<PostRedirectScreen> {
  bool isLoading = true;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppbar(
          title: widget.result.post_title,
          context: context,
        ),
        body: isLoading
            ? loadingSpinnerWidget
            : SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: HtmlWidget(widget.result.post_content,
                      onTapUrl: (url) async {
                    if (!await launch(url)) {
                      throw 'Could not launch $url';
                    }
                    return true;
                  }),
                ),
              ));
  }

  String parseHtmlContent(String content) {
    String htmlContent = content;

    dom.Document document = htmlParser.parse(htmlContent);
    String parsedContent = parse(document.body!.nodes);

    return parsedContent;
  }

  String parse(List<dom.Node> nodes) {
    String result = '';
    for (var node in nodes) {
      if (node.nodeType == dom.Node.ELEMENT_NODE) {
        dom.Element element = node as dom.Element;
        switch (element.localName) {
          case 'p':
            result += parseParagraph(element);
            break;
          case 'figure':
            result += parseFigure(element);
            break;
          case 'img':
            result += parseImage(element);
            break;
          default:
            break;
        }
      } else if (node.nodeType == dom.Node.TEXT_NODE) {
        result += (node as dom.Text).data;
      }
    }
    return result;
  }

  String parseParagraph(dom.Element element) {
    return element.text.trim();
  }

  String parseFigure(dom.Element element) {
    // You can customize how you want to handle figures
    return parseChildren(element);
  }

  String parseImage(dom.Element element) {
    // You can customize how you want to handle images
    String imageUrl = element.attributes['src']!;
    return '<Image src="$imageUrl">';
  }

  String parseChildren(dom.Element element) {
    String result = '';
    // element.nodes.forEach((node) {
    result += parse(element.nodes);
    // });
    return result;
  }
}
