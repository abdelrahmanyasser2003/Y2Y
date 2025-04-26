class SearchModel {
  final String name;
  

  SearchModel({required this.name, required data});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      data: json,
      name: json['name'],
    );
  }
}
