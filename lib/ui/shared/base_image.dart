import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/spinner.dart';

class BaseImage extends StatefulWidget {
  final String url;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Function()? onTap;
  final BorderRadius borderRadius;

  const BaseImage(
      {Key? key,
      required this.url,
      this.height,
      this.width,
      this.fit,
      this.onTap,
      this.borderRadius = const BorderRadius.all(Radius.circular(10))})
      : super(key: key);

  @override
  State<BaseImage> createState() => _BaseImageState();
}

class _BaseImageState extends State<BaseImage> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: ExtendedImage.network(
        widget.url,
        width: widget.width,
        height: widget.height,
        fit: BoxFit.contain,
        cache: true,
        loadStateChanged: (ExtendedImageState state) {
          switch (state.extendedImageLoadState) {
            case LoadState.loading:
              return Center(child: loadingSpinnerWidget);

            case LoadState.completed:
              return ClipRRect(
                borderRadius: widget.borderRadius,
                child: Container(
                  decoration: BoxDecoration(
                    // shape: BoxShape.rectangle,
                    borderRadius: widget.borderRadius,
                    image: DecorationImage(
                      fit: widget.fit ?? BoxFit.contain,
                      image: state.imageWidget.image,
                    ),
                  ),
                ),
              );
            case LoadState.failed:
              return Center(
                child: GestureDetector(
                  child: const Icon(Icons.error),
                  onTap: () {
                    state.reLoadImage();
                  },
                ),
              );
          }
        },
      ),
    );
  }
}
