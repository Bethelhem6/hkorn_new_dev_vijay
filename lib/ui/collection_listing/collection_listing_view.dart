import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/model/gallery.dart';
import 'package:hkorn_new_dev_vijay/ui/collection_listing/collection_listing_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_appbar.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_image.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/spinner.dart';
import 'package:stacked/stacked.dart';

class CollectionListingView extends StatelessWidget {
  final GalleryModel galleryImage;
  final String title;
  const CollectionListingView(
      {Key? key, required this.galleryImage, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CollectionListingViewModel>.reactive(
        viewModelBuilder: () => CollectionListingViewModel(galleryImage, title),
        builder: (context, model, child) => Scaffold(
            appBar: BaseAppbar(
              context: context,
              title: model.title,
            ),
            body: model.isBusy
                ? loadingSpinnerWidget
                : Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.03),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 20,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.50),
                        crossAxisCount: 2,
                      ),
                      itemCount: model.galleryItems?.galleryImages?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            model.openPhoto(
                              model.galleryItems?.galleryImages?[index] ?? '',
                              model.galleryItems?.galleryTitle ?? '',
                            );
                          },
                          child: BaseImage(
                            fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width,
                            url:
                                model.galleryItems?.galleryImages?[index] ?? '',
                          ),
                        );
                      },
                    ),
                  )));
  }
}
