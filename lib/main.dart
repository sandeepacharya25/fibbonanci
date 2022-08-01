import 'dart:io';

import 'package:fibbonanci/controllers/popular_product_controller.dart';
import 'package:fibbonanci/controllers/recommended_product_controller.dart';

import 'package:fibbonanci/pages/home/main_food_page.dart';

import 'package:fibbonanci/routes/route_helper.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'helper/dependencies.dart' as dep;

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}


Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //to make sure dependencies are loaded before app starts
  await dep.init();
  HttpOverrides.global =  MyHttpOverrides(); //dependencies are loaded before loading the app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainFoodPage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}





// void main(){
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       home:Scaffold(
//         body:MainFoodPage(),
//       ),

      
//     );
//   }
// }