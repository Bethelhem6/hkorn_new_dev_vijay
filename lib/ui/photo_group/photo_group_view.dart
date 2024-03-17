import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_image.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/spinner.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_helper/ui_helper.dart';

import 'photo_group_viewmodel.dart';

class GroupPhotoView extends StatelessWidget {
  final int? groupId;
  const GroupPhotoView({Key? key, this.groupId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GroupPhotoViewModel>.reactive(
        viewModelBuilder: () => GroupPhotoViewModel(groupId ?? 0),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  iconTheme:
                      const IconThemeData(color: BaseColors.primaryColor),
                  title: Text(
                    'Photos',
                    style: BaseFonts.headline2().copyWith(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff2A2A2A)),
                  )),
              body: model.isBusy
                  ? loadingSpinnerWidget
                  : model.groupPhoto.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icon/group_gallery.png',
                              width: 120,
                              height: 120,
                            ),
                            const SizedBox(height: 40.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.error,
                                    color: Color(0xffE94242)),
                                horizontalSpaceSmall,
                                Text(
                                  'Sorry, no photo was found.',
                                  style: BaseFonts.headline2().copyWith(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xffE94242)),
                                )
                              ],
                            ),
                            const SizedBox(height: 40.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      model.getImageFromGallery();
                                    },
                                    child: const Icon(Icons.add,
                                        color: BaseColors.primaryColor)),
                                horizontalSpaceSmall,
                                Text(
                                  'Add Photos',
                                  style: BaseFonts.headline2().copyWith(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      color: BaseColors.primaryColor),
                                )
                              ],
                            ),
                          ],
                        )
                      : SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, bottom: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        model.getImageFromGallery();
                                      },
                                      child: Container(
                                        width: 150,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            border: Border.all(
                                                color:
                                                    BaseColors.primaryColor)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Icon(Icons.add,
                                                color: BaseColors.primaryColor),
                                            horizontalSpaceSmall,
                                            Text(
                                              'Add Photos',
                                              style: BaseFonts.headline2()
                                                  .copyWith(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: BaseColors
                                                          .primaryColor),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                GridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: model.groupPhoto.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            childAspectRatio: 0.90,
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 15.0,
                                            mainAxisSpacing: 20.0),
                                    itemBuilder: (context, index) => Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Stack(
                                            children: [
                                              BaseImage(
                                                url: model
                                                    .groupPhoto[index].photoUrl,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                              ),
                                            ],
                                          ),
                                        ))
                              ],
                            ),
                          ),
                        ),
            ));
  }
}
