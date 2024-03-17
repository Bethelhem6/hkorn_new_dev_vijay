// ignore_for_file: non_constant_identifier_names

class SearchResultModel {
  final String ID;
  final String post_title;
  final String post_content;
  final String post_type;
  final String url;

  Map<String, dynamic> toMap() {
    return {
      'ID': ID,
      'post_title': post_title,
      'post_content': post_content,
      'post_type': post_type,
      'url': url,
    };
  }

  factory SearchResultModel.fromMap(Map<dynamic, dynamic> map) {
    return SearchResultModel(
      ID: map['ID'] as String,
      post_title: map['post_title'] as String,
      post_content: map['post_content'] as String,
      post_type: map['post_type'] as String,
      url: map['url'] as String,
    );
  }

  const SearchResultModel({
    required this.ID,
    required this.post_title,
    required this.post_content,
    required this.post_type,
    required this.url,
  });
}
