class CategoryModel {
  String? name;
  String? image;
  int? id;
  CategoryModel({
    required this.name,
    required this.image,
    required this.id,
  });
  CategoryModel.fromJson({required Map<String, dynamic> data}) {
    id = data['id'];
    name = data['name'];
    image = data['image'];
  }
}
