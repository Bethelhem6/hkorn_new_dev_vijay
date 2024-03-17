import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/app/app.router.dart';
import 'package:hkorn_new_dev_vijay/ui/album_group/album_group_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/spinner.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_helper/ui_helper.dart';

class GroupAlbumView extends StatelessWidget {
  final int? groupId;
  const GroupAlbumView({Key? key, this.groupId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GroupAlbumViewModel>.reactive(
        viewModelBuilder: () => GroupAlbumViewModel(groupId ?? 0),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  iconTheme:
                      const IconThemeData(color: BaseColors.primaryColor),
                  title: Text(
                    'Albums',
                    style: BaseFonts.headline2().copyWith(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff2A2A2A)),
                  )),
              body: model.isBusy
                  ? loadingSpinnerWidget
                  : model.groupAlbumPhoto.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icon/group_bookmart.png',
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
                                  'Sorry, no album was found.',
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
                                const Icon(Icons.add,
                                    color: BaseColors.primaryColor),
                                horizontalSpaceSmall,
                                Text(
                                  'Create Album',
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, bottom: 10),
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
                                              color: BaseColors.primaryColor)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Icon(Icons.add,
                                              color: BaseColors.primaryColor),
                                          horizontalSpaceSmall,
                                          Text(
                                            'Crete Album',
                                            style: BaseFonts.headline2()
                                                .copyWith(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w500,
                                                    color: BaseColors
                                                        .primaryColor),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                GridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: model.groupAlbumPhoto.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            childAspectRatio: 0.90,
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 15.0,
                                            mainAxisSpacing: 20.0),
                                    itemBuilder: (context, index) =>
                                        GestureDetector(
                                          onTap: () {
                                            model.navService.navigateTo(
                                                Routes.groupAlbumsDetailView,
                                                arguments:
                                                    GroupDetailsViewArguments(
                                                        albumId: model
                                                            .groupAlbumPhoto[
                                                                index]
                                                            .albumId,
                                                        groupId: groupId ?? 0));
                                          },
                                          child: Card(
                                            color: BaseColors.buttonColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  bottom: 10.0,
                                                  left: 10.0,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        model
                                                            .groupAlbumPhoto[
                                                                index]
                                                            .albumTitle,
                                                        style: BaseFonts
                                                                .headline2()
                                                            .copyWith(
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color:
                                                                    BaseColors
                                                                        .white),
                                                      ),
                                                      Text(
                                                        DateFormat('yyyy-MM-dd').format(
                                                            DateTime.parse(model
                                                                .groupAlbumPhoto[
                                                                    index]
                                                                .albumCreated)),
                                                        style: BaseFonts
                                                                .headline2()
                                                            .copyWith(
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color:
                                                                    BaseColors
                                                                        .white),
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                              Icons
                                                                  .photo_library_sharp,
                                                              color: BaseColors
                                                                  .white,
                                                              size: 20),
                                                          horizontalSpaceSmall,
                                                          Text(
                                                            '${model.groupAlbumPhoto[index].albumImageCount}',
                                                            style: BaseFonts
                                                                    .headline2()
                                                                .copyWith(
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: BaseColors
                                                                        .white),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                )
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
