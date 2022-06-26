
import 'package:fibbonanci/pages/home/food_page_body.dart';
import 'package:fibbonanci/utils/colors.dart';
import 'package:fibbonanci/utils/dimensions.dart';
import 'package:fibbonanci/widgets/bigText.dart';
import 'package:fibbonanci/widgets/smallText.dart';
import 'package:flutter/material.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({ Key? key }) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
  
    return SafeArea(
      child: Column(
        children: [
          //showing the header
          Container(
            // margin:const EdgeInsets.only(top: 45,bottom:15),
            // padding:const EdgeInsets.only(left: 20,right: 20),
            child: Column(
              children: [
                Container(
                  padding:const EdgeInsets.all(8),
                  
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Column(
                      children: [
                         BigText(text: "Nepal",color: AppColors.mainColor,size: 30,),
                         Row(
                           children: [
                             SmallText(text: "Bhadrapur",color: Colors.black,),
                            const Icon(Icons.arrow_drop_down_rounded)
                           ],
                         ),
          
                      ],
                    ),
                    Center(
                      child: Container(
                        width: Dimension.height45,
                        height: Dimension.height45,
                        child: Icon(Icons.search,color:Colors.white, size:Dimension.iconSize24,),
                           decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(Dimension.radius15),
                           color:AppColors.mainColor,
                         ),
                      ),
                    ),
                  ],
                  ),
                ),
              ],
            ),
          ),
        //Showing the body
        Expanded(child: SingleChildScrollView(
          child:FoodPageBody(),
        ))
        ],
      ),
    );
  }
}