import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/ui/feed/feed_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_helper/ui_helper.dart';

class GroupFeedView extends StatelessWidget {
  const GroupFeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GroupFeedViewModel>.reactive(
        viewModelBuilder: () => GroupFeedViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: const Color(0xffEEEEEE),
              appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  iconTheme:
                      const IconThemeData(color: BaseColors.primaryColor),
                  title: Text(
                    'Feeds',
                    style: BaseFonts.headline2().copyWith(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff2A2A2A)),
                  )),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 25.0),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 15.0),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  AssetImage('assets/images/Ellipse 4.png'),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: TextFormField(
                                  controller: TextEditingController(),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color(0xffEEEEEE),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 10.0),
                                    isDense: true,
                                    hintText:
                                        'Share Something with the group...',
                                    hintStyle: BaseFonts.subHead(
                                        color: BaseColors.labelColor),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 0.5,
                                          color: BaseColors.labelColor),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 0.6,
                                          color: BaseColors.labelColor),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Icon(Icons.camera_alt_outlined)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 20.0),
                              child: TextFormField(
                                controller: TextEditingController(),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 10.0),
                                  isDense: true,
                                  hintText: 'Search Feeds',
                                  prefixIcon: const Icon(Icons.search_rounded),
                                  hintStyle: BaseFonts.subHead(
                                      color: BaseColors.labelColor),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 0.5,
                                        color: BaseColors.labelColor),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 0.6,
                                        color: BaseColors.labelColor),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Divider(thickness: 0.7),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CircleAvatar(
                                  radius: 20,
                                  backgroundImage:
                                      AssetImage('assets/images/Ellipse 4.png'),
                                ),
                                horizontalSpaceSmall,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                        text: TextSpan(
                                            text: 'YOUNG DJON',
                                            style: BaseFonts.headline2()
                                                .copyWith(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color(
                                                        0xffE7AD5C)),
                                            children: [
                                          TextSpan(
                                              text: ' joined the group\n',
                                              style: BaseFonts.headline2()
                                                  .copyWith(
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: const Color(
                                                          0xff999999))),
                                          TextSpan(
                                              text: 'Subscriber\nGroup',
                                              style: BaseFonts.headline2()
                                                  .copyWith(
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: const Color(
                                                          0xffE7AD5C))),
                                          TextSpan(
                                              text: ' a week ago.',
                                              style: BaseFonts.headline2()
                                                  .copyWith(
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: const Color(
                                                          0xff999999))),
                                        ])),
                                    verticalSpaceRegular,
                                    Row(
                                      children: [
                                        Image.asset('assets/icon/thumbail.png',
                                            width: 22, height: 22),
                                        horizontalSpaceSmall,
                                        Text('(20)',
                                            style: BaseFonts.headline2()
                                                .copyWith(
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color(
                                                        0xff444444))),
                                        horizontalSpaceSmall,
                                        Image.asset('assets/icon/message.png',
                                            width: 22, height: 22),
                                        horizontalSpaceSmall,
                                        Text('(20)',
                                            style: BaseFonts.headline2()
                                                .copyWith(
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color(
                                                        0xff444444)))
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 15.0),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 20,
                                  backgroundImage:
                                      AssetImage('assets/images/Ellipse 4.png'),
                                ),
                                horizontalSpaceSmall,
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.77,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: const Color(0xffEEEEEE)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: TextFormField(
                                          controller: TextEditingController(),
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 10.0,
                                                    horizontal: 15.0),
                                            isDense: true,
                                            hintText: 'write a comment...',
                                            hintStyle: BaseFonts.subHead(
                                                color: BaseColors.labelColor),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: Row(
                                        children: [
                                          const Icon(Icons.camera_alt_outlined,
                                              color: Color(0xff999999)),
                                          horizontalSpaceSmall,
                                          const Icon(
                                              Icons.emoji_emotions_outlined,
                                              color: Color(0xff999999)),
                                        ],
                                      ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Divider(thickness: 0.7),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/images/Ellipse 4.png'),
                              ),
                              horizontalSpaceSmall,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          text: 'YOUNG DJON',
                                          style: BaseFonts.headline2().copyWith(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xffE7AD5C)),
                                          children: [
                                        TextSpan(
                                            text: ' joined the group ',
                                            style: BaseFonts.headline2()
                                                .copyWith(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color(
                                                        0xff999999))),
                                        TextSpan(
                                            text: 'Subscriber\nGroup',
                                            style: BaseFonts.headline2()
                                                .copyWith(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color(
                                                        0xffE7AD5C))),
                                        TextSpan(
                                            text: ' a week ago.',
                                            style: BaseFonts.headline2()
                                                .copyWith(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color(
                                                        0xff999999))),
                                      ])),
                                  verticalSpaceRegular,
                                  Row(
                                    children: [
                                      Image.asset('assets/icon/thumbail.png',
                                          width: 22, height: 22),
                                      horizontalSpaceSmall,
                                      Text('(20)',
                                          style: BaseFonts.headline2().copyWith(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xff444444))),
                                      horizontalSpaceSmall,
                                      Image.asset('assets/icon/message.png',
                                          width: 22, height: 22),
                                      horizontalSpaceSmall,
                                      Text('(20)',
                                          style: BaseFonts.headline2().copyWith(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xff444444)))
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 20,
                                  backgroundImage:
                                      AssetImage('assets/images/Ellipse 4.png'),
                                ),
                                horizontalSpaceSmall,
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: const Color(0xffEEEEEE)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: TextFormField(
                                          controller: TextEditingController(),
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 10.0,
                                                    horizontal: 15.0),
                                            isDense: true,
                                            hintText: 'write a comment...',
                                            hintStyle: BaseFonts.subHead(
                                                color: BaseColors.labelColor),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: Row(
                                        children: [
                                          const Icon(Icons.camera_alt_outlined,
                                              color: Color(0xff999999)),
                                          horizontalSpaceSmall,
                                          const Icon(
                                              Icons.emoji_emotions_outlined,
                                              color: Color(0xff999999)),
                                        ],
                                      ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
