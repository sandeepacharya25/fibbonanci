import 'package:fibbonanci/controllers/popular_product_controller.dart';
import 'package:fibbonanci/data/api/api_client.dart';
import 'package:fibbonanci/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

Future<void> init()async{

//api client
  Get.lazyPut(()=>ApiCLient(appBaseUrl: "https://www.dbestech.com"));


//repo
  Get.lazyPut(()=>PopularProductRepo(apiClient:Get.find()));

  //controllers
  Get.lazyPut(()=>PopularProductController(popularProductRepo:Get.find()));

}