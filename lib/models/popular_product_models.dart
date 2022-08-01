// // ignore_for_file: unused_field, unnecessary_this

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

// import 'dart:convert';

// ProductModels welcomeFromJson(String str) => ProductModels.fromJson(json.decode(str));

// String welcomeToJson(ProductModels data) => json.encode(data.toJson());

// class ProductModels {
//     ProductModels({
//         this.totalSize,
//         this.typeId,
//         this.offset,
//         this.products,
//     });

//     int? totalSize;
//     int? typeId;
//     int? offset;
//     List<Product>? products;

//     factory ProductModels.fromJson(Map<String, dynamic> json) => ProductModels(
//         totalSize: json["total_size"],
//         typeId: json["type_id"],
//         offset: json["offset"],
//         products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "total_size": totalSize,
//         "type_id": typeId,
//         "offset": offset,
//         "products": List<dynamic>.from(products!.map((x) => x.toJson())),
//     };
// }

// class Product {
//     Product({
//         this.id,
//         this.name,
//         this.description,
//         this.price,
//         this.stars,
//         this.img,
//         this.location,
//         this.createdAt,
//         this.updatedAt,
//         this.typeId,
//     });

//     int? id;
//     String? name;
//     String? description;
//     int? price;
//     int? stars;
//     String? img;
//     String ?location;
//     DateTime? createdAt;
//     DateTime? updatedAt;
//     int? typeId;

//     factory Product.fromJson(Map<String, dynamic> json) => Product(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"],
//         price: json["price"],
//         stars: json["stars"],
//         img: json["img"],
//         location: json["location"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         typeId: json["type_id"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "description": description,
//         "price": price,
//         "stars": stars,
//         "img": img,
//         "location": location,
//         "created_at": createdAt!.toIso8601String(),
//         "updated_at": updatedAt!.toIso8601String(),
//         "type_id": typeId,
//     };
// }



class Product {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<ProductModels> _products;
  List<ProductModels> get products=>_products;

  Product({required totalSize, required typeId, required offset,required products}){
    this._totalSize=totalSize;
    this._typeId=typeId;
    this._offset=offset;
    this._products=products;
  }

  Product.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    _typeId = json['type_id'];
    _offset = json['offset'];
    if (json['products'] != null) {
      _products = <ProductModels>[];
      json['products'].forEach((v) {
        _products.add(ProductModels.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['total_size'] = this.totalSize;
  //   data['type_id'] = this.typeId;
  //   data['offset'] = this.offset;
  //   if (this.products != null) {
  //     data['products'] = this.products!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class ProductModels {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? createdAt;
  String? updatedAt;
  int? typeId;

  ProductModels(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.stars,
      this.img,
      this.location,
      this.createdAt,
      this.updatedAt,
      this.typeId});

  ProductModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    img = json['img'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    typeId = json['type_id'];
  }
}

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = this.id;
// //     data['name'] = this.name;
// //     data['description'] = this.description;
// //     data['price'] = this.price;
// //     data['stars'] = this.stars;
// //     data['img'] = this.img;
// //     data['location'] = this.location;
// //     data['created_at'] = this.createdAt;
// //     data['updated_at'] = this.updatedAt;
// //     data['type_id'] = this.typeId;
// //     return data;
// //   }
//  }
// //  List<ProductModels> getProductDetail() {
// //   return [
// //     ProductModels(
// //       id: 101,
// //       img:
// //           'https://images.unsplash.com/photo-1599076479757-7effbcd66acb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
// //       name: 'Have a plant at your desk',
// //       price: 150,
// //       stars: 5,
// //       location: "Bhadrapur",
// //       createdAt: "Charali",
// //       updatedAt: "Charali",
// //       typeId: 101,
// //       description:
// //           'Having a plant at your work desk can be really helpful. I don\'t know why though',
// //     ),
// //     ProductModels(
// //       id: 102,
// //         img:
// //             'https://images.unsplash.com/photo-1599021277840-9d3f4f383742?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
// //         name: 'Eat your breakfast on time',
        
// //         price: 200,
// //         stars: 5,
// //       location: "Bhadrapur",
// //       createdAt: "Charali",
// //       updatedAt: "Charali",
// //       typeId: 101,
// //         description:
// //             'You should eat your breakfast before 30 minutes, after you wake up.'),
// //    ProductModels(
// //       img:
// //           'https://images.unsplash.com/photo-1567337710282-00832b415979?ixlib=rb-1.2.1&auto=format&fit=crop&w=3888&q=80',
// //       name: 'Have a plant at your desk',
// //       price: 200,
// //         stars: 5,
// //       location: "Bhadrapur",
// //       createdAt: "Charali",
// //       updatedAt: "Charali",
// //       typeId: 101,
     
// //       description:
// //       'Having a plant at your work desk can be really helpful. I don\'t know why though',
// //     ),
// //     ProductModels(
// //       img:
// //           'https://images.unsplash.com/photo-1599076479757-7effbcd66acb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
// //       name: 'Eat your breakfast on time',
      
        
// //         description: 'Y0u should eat your breakfast before 30 minutes, after you wake up.'
// //     ),
// //   ];
// // }
