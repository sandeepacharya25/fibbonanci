// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables
//7:05
import 'package:fibbonanci/controllers/cart_controller.dart';
import 'package:fibbonanci/controllers/popular_product_controller.dart';
import 'package:fibbonanci/pages/cart/cart_page.dart';
import 'package:fibbonanci/pages/home/main_food_page.dart';
import 'package:fibbonanci/routes/route_helper.dart';
import 'package:fibbonanci/utils/app_Constants.dart';
import 'package:fibbonanci/utils/colors.dart';
import 'package:fibbonanci/utils/dimensions.dart';
import 'package:fibbonanci/widgets/app_column.dart';
import 'package:fibbonanci/widgets/app_icon.dart';
import 'package:fibbonanci/widgets/expandable_text_widget.dart';
import 'package:fibbonanci/widgets/icon_and_text.dart';
import 'package:fibbonanci/widgets/smallText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/bigText.dart';

class PopularBookDetails extends StatelessWidget {
  int pageId;
  final String page;
  PopularBookDetails({Key? key, required this.pageId, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
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
                      image: NetworkImage(
                        AppConstants.BASE_URL +
                            AppConstants.UPLOAD_URL +
                            product.img!,
                      ),
                      fit: BoxFit.cover),
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
                  GestureDetector(
                      onTap: (){
                        if(page=="cartpage"){
                          Get.toNamed(RouteHelper.getCartPage());
                        }else{
                          Get.toNamed(RouteHelper.getInitial());
                        }

                      },
                      child: AppIcon(icon: Icons.arrow_back_ios)),
                  GetBuilder<PopularProductController>(builder: ((controller) {
                    return GestureDetector(
                       onTap: (){
                            Get.toNamed(RouteHelper.getCartPage());
                          },
                      child: Stack(
                        children: [
                          AppIcon(icon: Icons.shopping_cart_outlined),
                          Get.find<PopularProductController>().totalItems >= 1
                              ? Positioned(
                                right: 0,
                                top: 0,
                                child: AppIcon(
                                    icon: Icons.circle,
                                    size: 20,
                                    iconColor: Colors.transparent,
                                    backgroundColor: AppColors.mainColor,
                                  ),
                              )
                              : Container(),
                    
                              Get.find<PopularProductController>().totalItems >= 1
                              ? Positioned(
                                right: 3,
                                top: 3,
                                child: BigText(text: Get.find<PopularProductController>().totalItems.toString(),
                                size: 12,
                                color: Colors.white,
                                ),
                              )
                              : Container(),
                        ],
                      ),
                    );
                  }))
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
                      AppColumn(text: product.name!),
                      SizedBox(
                        height: Dimension.height20,
                      ),
                      BigText(text: "Introduce"),
                      //expandable  text widget
                      Expanded(
                          child: SingleChildScrollView(
                              child: ExpandableTextWidget(
                                  text: product.description!))),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (popularProduct) {
            return Container(
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
                        GestureDetector(
                          onTap: (() {
                            popularProduct.setQuantity(false);
                          }),
                          child: Icon(
                            Icons.remove,
                            color: AppColors.signColor,
                          ),
                        ),
                        SizedBox(
                          width: Dimension.width10 / 2,
                        ),
                        BigText(text: popularProduct.inCartItems.toString()),
                        SizedBox(
                          width: Dimension.width10 / 2,
                        ),
                        GestureDetector(
                          onTap: (() {
                            popularProduct.setQuantity(true);
                          }),
                          child: Icon(
                            Icons.add,
                            color: AppColors.signColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                        popularProduct.addItem(product);
                      },
                    child: Container(
                      padding: EdgeInsets.only(
                          top: Dimension.height20,
                          bottom: Dimension.height20,
                          left: Dimension.width20,
                          right: Dimension.width20),
                      child: BigText(
                        text: "\$ ${product.price!} | Add to cart",
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimension.radius20),
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
