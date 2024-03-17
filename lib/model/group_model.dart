// ignore_for_file: non_constant_identifier_names

class GroupModel {
  final int groups_id;
  final String groups_title;
  final String created;
  final String slug;
  final String description;
  final String group_image_url;
  final String status;

  Map<String, dynamic> toMap() {
    return {
      'groups_id': groups_id,
      'groups_title': groups_title,
      'created': created,
      'slug': slug,
      'description': description,
      'group_image_url': group_image_url,
      'status': status,
    };
  }

  factory GroupModel.fromMap(Map<String, dynamic> map) {
    return GroupModel(
      groups_id: map['groups_id'] as dynamic,
      groups_title: map['groups_title'] as dynamic,
      created: map['created'] as dynamic,
      slug: map['slug'] as dynamic,
      description: map['description'] as dynamic,
      group_image_url: map['group_image_url'] as dynamic,
      status: map['status'] as dynamic,
    );
  }

  const GroupModel({
    required this.groups_id,
    required this.groups_title,
    required this.created,
    required this.slug,
    required this.description,
    required this.group_image_url,
    required this.status,
  });
}
