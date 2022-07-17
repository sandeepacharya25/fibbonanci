import 'dart:convert';

import 'package:fibbonanci/controllers/cart_controller.dart';
import 'package:fibbonanci/data/repository/popular_product_repo.dart';
import 'package:fibbonanci/models/popular_product_models.dart';
import 'package:fibbonanci/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<ProductModels> _popularProductList = [];
  List<ProductModels> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    var response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200) {
      print("status cod ereceived");
      _popularProductList = [];
      _popularProductList
          .addAll(Product.fromJson(jsonDecode(response.body)).products);

      _isLoaded = true;
      update(); //this is like setstate
    } else {
      print("No data fetch");
    }
  }

  void setQuantity(bool isIncreament) {
    if (isIncreament) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar(
        "Item count",
        "You can't reduce more !",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      Get.snackbar(
        "Item count",
        "You can't add more !",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModels product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;

    var exist = false;
    exist = _cart.existInCart(product);

    //if exist in cart then add to cart
    //get from storage _inCartItems=3
    print("Exist or not " + exist.toString());
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
    print("The quantity in the cart is " + _inCartItems.toString());
  }

  void addItem(ProductModels product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);

    _cart.items.forEach((key, value) {
      print("The id is " +
          value.id.toString() +
          "The Quantity is " +
          value.quantity.toString());
    });

    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }
}
