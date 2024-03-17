import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:hkorn_new_dev_vijay/model/search_model.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_appbar.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/spinner.dart';

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
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
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
                  child: HtmlWidget(
                    widget.result.post_content,
                  ),
                ),
              ));
  }
}
