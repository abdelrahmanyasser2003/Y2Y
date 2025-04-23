class SearchModel {
  final String name;

  SearchModel({required this.name});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      name: json['name'],
    );
  }
}
