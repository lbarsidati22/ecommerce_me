class BanerModel {
  int? id;
  String? url;
  BanerModel({
    required this.id,
    required this.url,
  });
  BanerModel.fromJson({required Map<String, dynamic> data}) {
    id = data['id'];
    url = data['image'];
  }
}
