import 'package:fibbonanci/data/repository/cart_repo.dart';
import 'package:fibbonanci/models/cart_model.dart';
import 'package:fibbonanci/models/popular_product_models.dart';
import 'package:fibbonanci/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModels> _items = {};

  Map<int, CartModels> get items => _items;

  void addItem(ProductModels product, int quantity) {
    var totalQuantity=0;
    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) {
        totalQuantity=value.quantity!+quantity;
        return CartModels(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          isExist: true,
          time: DateTime.now().toString(),
          quantity: value.quantity! + quantity,
        );
      });

      if(totalQuantity<=0){
        _items.remove(product.id!);
      }
    } else {
      if(quantity>0){
        _items.putIfAbsent(product.id!, () {
        return CartModels(
          id: product.id,
          name: product.name,
          price: product.price,
          img: product.img,
          isExist: true,
          time: DateTime.now().toString(),
          quantity: quantity,
        );
      });
      }
      else{
         Get.snackbar("Item count", "You should at least add an item in the cart",
      backgroundColor: AppColors.mainColor,
      colorText: Colors.white,
      );
      }
    }
  }

  bool existInCart(ProductModels product) {
    if (_items.containsKey(product.id)) {
      return true;
    } else {
      return false;
    }
  }

 int getQuantity(ProductModels product){
    var quantity=0;
    if(_items.containsKey(product.id)){
      _items.forEach((key, value) {
        if(key==product.id){
          quantity=value.quantity!;
        }
       });
    }
    return quantity;
  }

 int get totalItems{
  var totalQuantity=0;
  _items.forEach((key, value) { 
   totalQuantity+= value.quantity!;
  });

  return totalQuantity;
 }
}
