// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartProductModel {
  String? id;
  String? name;
  String? image;
  String? price;
  int? quantity;

  CartProductModel({
    this.id,
    this.image,
    this.name,
    this.quantity,
    this.price,
  });

  Map<String, dynamic> tojson() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'name': name,
      'quantity': quantity,
      'price': price,
    };
  }

  factory CartProductModel.fromJson(Map<dynamic, dynamic> json) {
    return CartProductModel(
      id: json['id'] != null ? json['id'] as String : null,
      image: json['image'] != null ? json['image'] as String : null,
      name: json['name'] != null ? json['name'] as String : null,
      quantity: json['quantity'] != null ? json['quantity'] as int : null,
      price: json['price'] != null ? json['price'] as String : null,
    );
  }
}
