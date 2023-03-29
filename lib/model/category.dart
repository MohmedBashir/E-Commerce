class CategoryModel {
  String? name;
  String? image;
  CategoryModel({
    this.name,
    this.image,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'image': image,
    };
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'] != null ? json['name'] as String : null,
      image: json['image'] != null ? json['image'] as String : null,
    );
  }
}
