class PrudactModel {
  String? name;
  String? image;
  int? price;
  String? description;
  int? discount;
  int? id;
  PrudactModel({
    this.id,
    this.description,
    this.discount,
    this.name,
    this.image,
    this.price,
  });
  PrudactModel.fromJson({required Map<String, dynamic> data}) {
    name = data['name'];
    price = data['price'].toInt();
    image = data['image'];
    id = data['id'].toInt();
    description = data['description'];
  }
}
