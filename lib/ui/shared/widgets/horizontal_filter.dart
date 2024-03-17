import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';

class HorizontalScrollableItems extends StatelessWidget {
  final List<String> items;
  final Function onTap;

  const HorizontalScrollableItems(
      {Key? key, required this.items, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onTap(),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: BaseColors.greyColor, width: 0.3),
                  color:
                      index == 0 ? BaseColors.primaryColor : BaseColors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: Text(
                    items[index],
                    style: BaseFonts.subHead(
                        fontSize: 12,
                        color: index == 0
                            ? BaseColors.white
                            : BaseColors.greyColor),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
