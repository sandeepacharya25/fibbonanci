import 'package:fibbonanci/controllers/cart_controller.dart';
import 'package:fibbonanci/controllers/popular_product_controller.dart';
import 'package:fibbonanci/controllers/recommended_product_controller.dart';
import 'package:fibbonanci/data/api/api_client.dart';
import 'package:fibbonanci/data/repository/cart_repo.dart';
import 'package:fibbonanci/data/repository/popular_product_repo.dart';
import 'package:fibbonanci/data/repository/recommended_product_repo.dart';
import 'package:fibbonanci/utils/app_Constants.dart';
import 'package:get/get.dart';

Future<void> init()async{

//api client
  Get.lazyPut(()=>ApiCLient(appBaseUrl: AppConstants.BASE_URL));


//repo
  Get.lazyPut(()=>PopularProductRepo(apiClient:Get.find()));
  Get.lazyPut(()=>RecommendedProductRepo(apiClient:Get.find()));
  Get.lazyPut(() => CartRepo());

  //controllers
  Get.lazyPut(()=>PopularProductController(popularProductRepo:Get.find()));
  Get.lazyPut(()=>RecommendedProductController(recommendedProductRepo:Get.find()));
  Get.lazyPut(() => CartController(cartRepo:Get.find()));
  

}