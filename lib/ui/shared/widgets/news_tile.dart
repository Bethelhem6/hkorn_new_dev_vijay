import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/const/consts.dart';
import 'package:hkorn_new_dev_vijay/model/gallery.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_image.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/bubble.dart';

class NewsTile extends StatelessWidget {
  final BuildContext context;
  final String url;
  final Function()? onTap;
  final String boxOneText;
  final String boxTwoText;
  final String title;
  final List<Category>? categories;

  const NewsTile(
      {Key? key,
      required this.context,
      required this.url,
      this.boxTwoText = 'Notes',
      this.boxOneText = 'News',
      required this.title,
      required this.onTap,
      this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: sidePadding, vertical: 5),
      child: Stack(
        children: [
          BaseImage(
            fit: BoxFit.cover,
            url: url,
            height: 180,
            onTap: onTap,
          ),
          categories?.isNotEmpty ?? false
              ? Positioned(
                  top: 10,
                  right: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? MediaQuery.of(context).size.width * 0.30
                      : 0,
                  child: SizedBox(
                    height: 30,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories?.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Bubble(
                                title: categories![index].name.toString(),
                                onTap: null,
                              ),
                            )),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
