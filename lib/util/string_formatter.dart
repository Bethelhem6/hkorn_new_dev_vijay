import 'package:html/parser.dart';


class StringFormatter {
  String parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    if (document.body == null) {
      return htmlString;
    }
    final String parsedString = parse(document.body!.text).documentElement ==
        null ? htmlString : parse(document.body!.text).documentElement!.text;

    return parsedString;
  }
}