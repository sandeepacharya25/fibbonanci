import 'dart:io';

import 'package:fibbonanci/controllers/cart_controller.dart';
import 'package:fibbonanci/controllers/popular_product_controller.dart';
import 'package:fibbonanci/routes/route_helper.dart';
import 'package:fibbonanci/utils/app_Constants.dart';
import 'package:fibbonanci/utils/colors.dart';
import 'package:fibbonanci/utils/dimensions.dart';
import 'package:fibbonanci/widgets/app_icon.dart';
import 'package:fibbonanci/widgets/bigText.dart';
import 'package:fibbonanci/widgets/smallText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/recommended_product_controller.dart';


class ProductList extends StatefulWidget {
  const ProductList({ Key? key }) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Select a Service",style: TextStyle(
          color: AppColors.mainColor,
        ),),
        leading: Icon(Icons.arrow_back_outlined,color: AppColors.mainColor,),
        actions: [
          Icon(Icons.search,color:AppColors.mainColor),
        ],
      ),
      body:  Container(
        margin: EdgeInsets.only(top: Dimension.height15),
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: 
               ListView.builder(
                itemCount: 5,
                itemBuilder: (_, index) {
                  return 
                  
                  Container(
                    height: Dimension.height20 * 5,
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            
                          },
                          child: Container(
                            width: Dimension.height20 * 5,
                            height: Dimension.height20 * 5,
                            margin: EdgeInsets.only(
                                bottom: Dimension.height10),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://5.imimg.com/data5/LS/BJ/QZ/SELLER-27744046/sparkz-electro-world-marthandam-kanyakumari-ac-repair-and-services-1ortjaopli-500x500.jpg",
                                              ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(
                                    Dimension.radius20),
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: Dimension.width10,
                        ),
                        Expanded(
                          child: Container(
                            height: Dimension.height20 * 5,
                            child: Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                BigText(
                                  text: "Ac Repair and serviced",
                                  color: Colors.black54,
                                ),
                                SmallText(text: "Spicy"),
                               ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              ),
      ),
    );
            
          
        
      
      
    
  }
}
