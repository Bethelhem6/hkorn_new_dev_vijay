// To parse this JSON data, do
//
//     final galleryModel = galleryModelFromJson(jsonString);

class GalleryModel {
  GalleryModel({
    this.galleryId,
    this.galleryTitle,
    this.galleryImages,
    this.featureImage,
    this.categories,
  });

  int? galleryId;
  String? galleryTitle;
  List<String>? galleryImages;
  String? featureImage;
  List<Category>? categories;

  factory GalleryModel.fromMap(Map<String, dynamic> json) {
    GalleryModel model = GalleryModel(
      galleryId: json["gallery_id"],
      galleryTitle: json["gallery_title"],
      galleryImages: json["gallery_images"] == null
          ? []
          : List<String>.from(json["gallery_images"]!.map((x) => x)),
      featureImage:
          json["feature_image"] is String ? json["feature_image"] : null,
      categories: json["categories"] == null
          ? []
          : List<Category>.from(
              json["categories"]!.map((x) => Category.fromJson(x))),
    );

    model.featureImage ??=
        model.galleryImages != null && model.galleryImages!.isNotEmpty
            ? model.galleryImages?.last
            : null;
    return model;
  }

  Map<String, dynamic> toMap() => {
        "gallery_id": galleryId,
        "gallery_title": galleryTitle,
        "gallery_images": galleryImages == null
            ? []
            : List<dynamic>.from(galleryImages!.map((x) => x)),
        "feature_image": featureImage,
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    this.name,
  });

  String? name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

enum Name { PHOTO, AGM }

final nameValues = EnumValues({"AGM": Name.AGM, "Photo": Name.PHOTO});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
