import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/app/app.router.dart';
import 'package:hkorn_new_dev_vijay/ui/group_details/groupdetails_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/spinner.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_helper/ui_helper.dart';

class GroupDetailsView extends StatelessWidget {
  final int groupId;
  const GroupDetailsView({Key? key, required this.groupId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GroupDetailViewModel>.reactive(
        viewModelBuilder: () => GroupDetailViewModel(groupId),
        builder: (context, model, child) => Scaffold(
              body: model.isBusy
                  ? loadingSpinnerWidget
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 240,
                              ),
                              Stack(
                                children: [
                                  Container(
                                    color: Colors.blueAccent,
                                    height: 160,
                                  ),
                                  // Image.asset('assets/images/group_detail_box.png',
                                  //     width: MediaQuery.of(context).size.width,
                                  //     fit: BoxFit.fill),
                                  Positioned(
                                    left: 30,
                                    top: 60,
                                    right: 30,
                                    child: Row(
                                      children: [
                                        const Icon(Icons.arrow_back,
                                            color: Colors.white),
                                        const Spacer(),
                                        Text(
                                          "Group Info",
                                          style: BaseFonts.headline2().copyWith(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                        const Spacer(),
                                        Text(
                                          "Edit",
                                          style: BaseFonts.headline2().copyWith(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Positioned(
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(10.0),
                                              bottomLeft:
                                                  Radius.circular(10.0)),
                                          child: Image.asset(
                                              'assets/images/Mask group.png')),
                                      const Spacer(),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Administratr Group",
                                            style: BaseFonts.headline2()
                                                .copyWith(
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black),
                                          ),
                                          Text(
                                            "${model.groupMemberModel?.membersCount} members",
                                            style: BaseFonts.headline2()
                                                .copyWith(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    model.navService
                                        .navigateTo(Routes.groupFeedView);
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    elevation: 3.0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Image.asset('assets/images/feed.png',
                                              width: 27, height: 27),
                                          horizontalSpaceSmall,
                                          Text(
                                            "Feed",
                                            style: BaseFonts.headline2()
                                                .copyWith(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w500,
                                                    color: const Color(
                                                        0xff2A2A2A)),
                                          ),
                                          const Spacer(),
                                          const Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 20)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    model.navService.navigateTo(
                                        Routes.groupPhotosView,
                                        arguments: GroupDetailViewArguments(
                                            groupId: groupId));
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    elevation: 3.0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                              'assets/images/gallery2.png',
                                              width: 27,
                                              height: 27),
                                          horizontalSpaceSmall,
                                          Text(
                                            "Photos",
                                            style: BaseFonts.headline2()
                                                .copyWith(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w500,
                                                    color: const Color(
                                                        0xff2A2A2A)),
                                          ),
                                          const Spacer(),
                                          const Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 20)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    model.navService.navigateTo(
                                        Routes.groupAlbumsView,
                                        arguments: GroupDetailViewArguments(
                                            groupId: groupId));
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    elevation: 3.0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                              'assets/images/albums.png',
                                              width: 27,
                                              height: 27),
                                          horizontalSpaceSmall,
                                          Text(
                                            "Albums",
                                            style: BaseFonts.headline2()
                                                .copyWith(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w500,
                                                    color: const Color(
                                                        0xff2A2A2A)),
                                          ),
                                          const Spacer(),
                                          const Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 20)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    model.navService.navigateTo(
                                        Routes.groupSendInviteView,
                                        arguments: GroupDetailViewArguments(
                                            groupId: groupId));
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    elevation: 3.0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Image.asset('assets/images/add.png',
                                              width: 27, height: 27),
                                          horizontalSpaceSmall,
                                          Text(
                                            "Send invites",
                                            style: BaseFonts.headline2()
                                                .copyWith(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w500,
                                                    color: const Color(
                                                        0xff2A2A2A)),
                                          ),
                                          const Spacer(),
                                          const Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 20)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    model.navService
                                        .navigateTo(Routes.groupManageView);
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    elevation: 3.0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                              'assets/images/setting.png',
                                              width: 27,
                                              height: 27),
                                          horizontalSpaceSmall,
                                          Text(
                                            "Manage",
                                            style: BaseFonts.headline2()
                                                .copyWith(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w500,
                                                    color: const Color(
                                                        0xff2A2A2A)),
                                          ),
                                          const Spacer(),
                                          const Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 20)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0),
                                  child: Text(
                                    "Members (${model.groupMemberModel?.membersCount})",
                                    style: BaseFonts.headline2().copyWith(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  elevation: 3.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  controller:
                                                      TextEditingController(),
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor:
                                                        const Color(0xffEEEEEE),
                                                    prefixIcon: const Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10.0),
                                                      child: Icon(Icons.search),
                                                    ),
                                                    prefixIconConstraints:
                                                        const BoxConstraints(
                                                            maxWidth: 35,
                                                            maxHeight: 22),
                                                    contentPadding:
                                                        const EdgeInsets
                                                                .symmetric(
                                                            vertical: 8.0,
                                                            horizontal: 15.0),
                                                    isDense: true,
                                                    hintText: 'Search.....',
                                                    hintStyle:
                                                        BaseFonts.subHead(
                                                            fontSize: 12,
                                                            color: BaseColors
                                                                .labelColor),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 0.5,
                                                              color: BaseColors
                                                                  .transparent),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 0.6,
                                                              color: BaseColors
                                                                  .transparent),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 25.0,
                                              ),
                                              GestureDetector(
                                                onTap: () {},
                                                child: const Icon(
                                                  Icons.add,
                                                  color:
                                                      BaseColors.primaryColor,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(bottom: 5),
                                          child: Divider(
                                            thickness: 1.0,
                                            color: Color(0xffDDDDDD),
                                          ),
                                        ),
                                        ListView.builder(
                                          padding: EdgeInsets.zero,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: model.groupMemberModel
                                              ?.groupsData?.length,
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              contentPadding: EdgeInsets.zero,
                                              dense: true,
                                              leading: CircleAvatar(
                                                radius: 20.0,
                                                backgroundImage: NetworkImage(
                                                    model
                                                            .groupMemberModel
                                                            ?.groupsData?[index]
                                                            .profileImage ??
                                                        ''),
                                              ),
                                              title: Text(
                                                "${model.groupMemberModel?.groupsData?[index].userName}",
                                                style: BaseFonts.headline2()
                                                    .copyWith(
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.black),
                                              ),
                                              subtitle: Text(
                                                "Lorem ipsum dolor sit amet consectetur.",
                                                style: BaseFonts.headline2()
                                                    .copyWith(
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xff797979)),
                                              ),
                                              trailing: const Icon(Icons
                                                  .arrow_forward_ios_outlined),
                                            );
                                          },
                                        )
                                      ],
                                    ),
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
