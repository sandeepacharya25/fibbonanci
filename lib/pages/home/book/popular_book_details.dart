import 'package:fibbonanci/utils/colors.dart';
import 'package:fibbonanci/utils/dimensions.dart';
import 'package:fibbonanci/widgets/app_column.dart';
import 'package:fibbonanci/widgets/app_icon.dart';
import 'package:fibbonanci/widgets/expandable_text_widget.dart';
import 'package:fibbonanci/widgets/icon_and_text.dart';
import 'package:fibbonanci/widgets/smallText.dart';
import 'package:flutter/material.dart';

import '../../../widgets/bigText.dart';

class PopularBookDetails extends StatelessWidget {
  const PopularBookDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimension.popularBookImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/1stBook.jpg"), fit: BoxFit.cover),
              ),
            ),
          ),
         //icon widget
          Positioned(
            top: Dimension.height45,
            left: Dimension.width20,
            right: Dimension.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),
          //introduction of food
          Positioned(
            top: Dimension.popularBookImgSize - 20,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimension.width20,
                  right: Dimension.width20,
                  top: Dimension.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimension.radius20),
                  topLeft: Radius.circular(Dimension.radius20),
                ),
                color: Colors.white,
              ),
              child: Container(
                padding: EdgeInsets.only(
                  top: Dimension.height15,
                  left: Dimension.width15,
                  right: Dimension.width15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: "Pushpa Cafe"),
                    SizedBox(
                      height: Dimension.height20,
                    ),
                    BigText(text: "Introduce"),
                    //expandable  text widget
                    ExpandableTextWidget(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                  ],
                ),
              ),
            ),
          ),
          
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimension.bottomHeightBar,
        padding: EdgeInsets.only(
            top: Dimension.height30,
            bottom: Dimension.height30,
            left: Dimension.width20,
            right: Dimension.width20),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimension.radius20 * 2),
              topRight: Radius.circular(Dimension.radius20 * 2)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: Dimension.height20,
                  bottom: Dimension.height20,
                  left: Dimension.width20,
                  right: Dimension.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radius20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: Dimension.width10 / 2,
                  ),
                  BigText(text: "0"),
                  SizedBox(
                    width: Dimension.width10 / 2,
                  ),
                  Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: Dimension.height20,
                  bottom: Dimension.height20,
                  left: Dimension.width20,
                  right: Dimension.width20),
              child: BigText(
                text: "\$10 | Add to cart",
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radius20),
                color: AppColors.mainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
