class PrudactModel {
  String? name;
  String? image;
  int? price;
  PrudactModel({
    this.name,
    this.image,
    this.price,
  });
  PrudactModel.fromJson({required Map<String, dynamic> data}) {
    name = data['name'];
    price = data['price'].toInt();
    image = data['image'];
  }
}
