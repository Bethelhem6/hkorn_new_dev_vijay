import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as dom;
import 'package:hkorn_new_dev_vijay/ui/notification_page/notification_page_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_appbar.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/spinner.dart';
import 'package:stacked/stacked.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NotificationViewModel>.reactive(
        viewModelBuilder: () => NotificationViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: BaseColors.white,
              appBar: BaseAppbar(
                title: 'Broadcast',
                context: context,
              ),
              body: model.isBusy
                  ? loadingSpinnerWidget
                  : model.popUpDataList.isEmpty
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Text(
                              "No broadcast messages",
                              style: BaseFonts.footNote2(),
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: model.popUpDataList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                elevation: 5.0,
                                child: ExpansionTile(
                                  title: ListTile(
                                    leading: Text('$index',
                                        maxLines: 2,
                                        textAlign: TextAlign.left,
                                        style: BaseFonts.footNote().copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400)),
                                    title: Text(
                                        model.popUpDataList[index].popup_title,
                                        maxLines: 2,
                                        textAlign: TextAlign.left,
                                        style: BaseFonts.footNote().copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                  children: [
                                    Html(
                                        data: parseHtmlContent(model
                                            .popUpDataList[index]
                                            .popup_content))
                                  ],
                                ),
                              ),
                            );
                          }),
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
