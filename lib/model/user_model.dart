class UserModel {
  String? name;
  String? email;
  String? phone;
  String? image;
  UserModel(
    this.email,
    this.name,
    this.image,
    this.phone,
  );
  UserModel.fromJson({required Map<String, dynamic> data}) {
    email = data['email'];
    name = data['name'];
    image = data['image'];
    phone = data['phone'];
  }
}
