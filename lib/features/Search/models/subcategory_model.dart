class SubcategoryModel {
  final String id;
  final String name;

  SubcategoryModel({required this.id, required this.name});

  factory SubcategoryModel.fromJson(Map<String, dynamic> json) {
    return SubcategoryModel(
      id: json['_id'],
      name: json['name'],
    );
  }
}
