
import 'package:fibbonanci/pages/home/book/popular_book_details.dart';
import 'package:fibbonanci/pages/home/main_food_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        body:PopularBookDetails(),
      ),

      
    );
  }
}