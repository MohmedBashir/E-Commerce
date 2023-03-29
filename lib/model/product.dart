import 'package:e_commerce/helper/extenstions.dart';
import 'package:flutter/material.dart';

class ProductModel {
  String? id;
  String? pic;
  String? name;
  String? description;
  num? price;
  Color? color;
  String? size;

  ProductModel(
      {this.id,
      this.pic,
      this.name,
      this.description,
      this.price,
      this.color,
      this.size});

  Map<String, dynamic> tojson() {
    return <String, dynamic>{
      'id': id,
      'pic': pic,
      'name': name,
      'description': description,
      'price': price,
      'color': color,
      'size': size,
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] != null ? json['id'] as String : null,
      pic: json['pic'] != null ? json['pic'] as String : null,
      name: json['name'] != null ? json['name'] as String : null,
      description:
          json['description'] != null ? json['description'] as String : null,
      price: json['price'] != null ? json['price'] as num : null,
      color: HexColor.fromHex(json['color']),
      size: json['size'] != null ? json['size'] as String : null,
    );
  }
}
