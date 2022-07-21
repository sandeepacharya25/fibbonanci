import 'package:fibbonanci/models/popular_product_models.dart';



class CartModels {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;
  ProductModels? product;

  CartModels({
    this.id,
    this.name,
    this.price,
    this.img,
    this.quantity,
    this.isExist,
    this.time,
    this.product,
  });

  CartModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];

    price = json['price'];

    img = json['img'];
    quantity = json['quantity'];
    isExist = json['isExist'];
    time = json['time'];
    product=ProductModels.fromJson(json['product']);
  }

}
