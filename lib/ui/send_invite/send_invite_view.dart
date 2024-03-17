import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/ui/group_details/groupdetails_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/spinner.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_helper/ui_helper.dart';

class GroupSendInviteView extends StatelessWidget {
  final int? groupId;
  const GroupSendInviteView({Key? key, this.groupId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GroupDetailViewModel>.reactive(
        viewModelBuilder: () => GroupDetailViewModel(groupId ?? 0),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  iconTheme:
                      const IconThemeData(color: BaseColors.primaryColor),
                  title: Text(
                    'Send Invites',
                    style: BaseFonts.headline2().copyWith(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff2A2A2A)),
                  )),
              body: model.isBusy
                  ? loadingSpinnerWidget
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20.0),
                                    child: TextFormField(
                                      controller: TextEditingController(),
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 8.0,
                                                horizontal: 10.0),
                                        isDense: true,
                                        hintText: 'Search...',
                                        prefixIcon:
                                            const Icon(Icons.search_rounded),
                                        hintStyle: BaseFonts.subHead(
                                            color: BaseColors.labelColor),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 0.5,
                                              color: BaseColors.labelColor),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 0.6,
                                              color: BaseColors.labelColor),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: false,
                                      onChanged: (value) {},
                                    ),
                                    Text(
                                      'My Connections',
                                      style: BaseFonts.headline2().copyWith(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xffE7AD5C)),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.error,
                                    color: Color(0xffE94242)),
                                horizontalSpaceSmall,
                                Expanded(
                                  child: Text(
                                    'Select members to invite by clicking the + button next to each other',
                                    style: BaseFonts.headline2().copyWith(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xffE94242)),
                                  ),
                                )
                              ],
                            ),
                            verticalSpaceSmall,
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: model
                                      .groupMemberModel?.groupsData?.length,
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 20.0,
                                          backgroundImage: NetworkImage(model
                                                  .groupMemberModel
                                                  ?.groupsData?[index]
                                                  .profileImage ??
                                              ''),
                                        ),
                                        horizontalSpaceSmall,
                                        Text(
                                          '${model.groupMemberModel?.groupsData?[index].userName}',
                                          style: BaseFonts.headline2().copyWith(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff444444)),
                                        ),
                                        const Spacer(),
                                        Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: BaseColors
                                                        .primaryColor),
                                                shape: BoxShape.circle),
                                            child: const Icon(Icons.add)),
                                      ],
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
            ));
  }
}
