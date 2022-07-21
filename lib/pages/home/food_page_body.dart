// ignore_for_file: prefer_final_fields, sized_box_for_whitespace, prefer_const_constructors, unnecessary_new


import 'dart:io';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:fibbonanci/controllers/popular_product_controller.dart';
import 'package:fibbonanci/controllers/recommended_product_controller.dart';
import 'package:fibbonanci/models/popular_product_models.dart';
import 'package:fibbonanci/pages/home/book/recommended_details.dart';
import 'package:fibbonanci/routes/route_helper.dart';
import 'package:fibbonanci/utils/app_Constants.dart';
import 'package:fibbonanci/utils/colors.dart';
import 'package:fibbonanci/utils/dimensions.dart';
import 'package:fibbonanci/widgets/app_column.dart';
import 'package:fibbonanci/widgets/bigText.dart';
import 'package:fibbonanci/widgets/icon_and_text.dart';
import 'package:fibbonanci/widgets/smallText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;


import 'book/popular_book_details.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimension.pageViewContainer;
  @override
  void initState() {
    // get();
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

//   get ()async{
//      HttpClient client = new HttpClient();
//   // tls 1.2 error
// //  var request = await client.getUrl(Uri.parse('https://shop.io.mi-img.com/app/shop/img?id=shop_88f929c5731967cbc8339cfae1f5f0ec.jpeg')); 
//   // tls 1.3 normal
//   var request = await client.getUrl(Uri.parse(AppConstants.BASE_URL+AppConstants.POPURAL_PRODUCT_URL));
//   var response = await request.close();
//   print(response.headers);
//   }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Slider section
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return 
          popularProducts.isLoaded
              ? 
              Container(
                  // color: Colors.red,
                  height: Dimension.pageView,
              //     child: Image.network('https://static.remove.bg/remove-bg-web/5c20d2ecc9ddb1b6c85540a333ec65e2c616dbbd/assets/start_remove-c851bdf8d3127a24e2d137a55b1b427378cd17385b01aec6e59d5d4b5f39d2ec.png',),
                 child: PageView.builder(
                      controller: pageController,
                      // itemCount: 5,
                      itemCount: popularProducts.popularProductList.length,
                      itemBuilder: (context, position) {
                        return _buildPageItem(position,
                            popularProducts.popularProductList[position]);
                      })
                )
              : 
              CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }),

        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty
                ? 1
                : popularProducts.popularProductList.length,
            // dotsCount: 5,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        SizedBox(
          height: Dimension.height30,
        ),
        //product section
        Container(
          padding: EdgeInsets.all(Dimension.height15),
          margin:  EdgeInsets.all(Dimension.height15) ,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(text: "Our Product List",size: Dimension.iconSize16*2,),
                  InkWell(
                    onTap: (){

                    },
                    child: Container(child: Row(
                      children: [
                        SmallText(text: "See More",color: AppColors.mainColor,),
                        Icon(Icons.arrow_drop_down,color: AppColors.mainColor,),
                      ],
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: Dimension.height30,
              ),
              GridView.builder(
                
                itemCount: 6,
                physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
                
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing:0,
                // crossAxisSpacing: Dimension.height10/2,
                mainAxisExtent: Dimension.height20*8,
              
              ),
              
              itemBuilder: (BuildContext context, int index){
                  return _buildProductItem();
                },
              
              )
             
            ],
          ),
        ),

        //service section
         Container(
          padding: EdgeInsets.all(Dimension.height15),
          margin:  EdgeInsets.all(Dimension.height15) ,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(text: "Our Service List",size: Dimension.iconSize16*2,),
                  InkWell(
                    onTap: (){

                    },
                    child: Container(child: Row(
                      children: [
                        SmallText(text: "See More",color: AppColors.mainColor,),
                        Icon(Icons.arrow_drop_down,color: AppColors.mainColor,),
                      ],
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: Dimension.height30,
              ),
              GridView.builder(
                
                itemCount: 6,
                physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
                
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing:0,
                // crossAxisSpacing: Dimension.height10/2,
                mainAxisExtent: Dimension.height20*8,
              
              ),
              
              itemBuilder: (BuildContext context, int index){
                  return _buildProductItem();
                },
              
              )
             
            ],
          ),
        ),

      
        
        Container(
          margin: EdgeInsets.only(left: Dimension.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(
                width: Dimension.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimension.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(
                  text: "Food Pairing",
                ),
              )
            ],
          ),
        ),
        //recommended food
        //List of food and images
        GetBuilder<RecommendedProductController>(
          builder: (recommendedProduct) {
            return recommendedProduct.isLoaded
                ? ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: recommendedProduct.recommendedProductList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (() {
                          Get.toNamed(RouteHelper.getRecommended(index,"home"));
                        }),
                        child: Container(
                            margin: EdgeInsets.only(
                              left: Dimension.width20,
                              right: Dimension.width20,
                              top: Dimension.height10,
                              bottom: Dimension.height10,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: Dimension.listViewImgSize,
                                  width: Dimension.listViewImgSize,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimension.radius20),
                                      color: Colors.white38,
                                      image: DecorationImage(
                                        image: NetworkImage(AppConstants
                                                .BASE_URL +
                                            AppConstants.UPLOAD_URL +
                                            recommendedProduct
                                                .recommendedProductList[index]
                                                .img!),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                Expanded(
                                  child: Container(
                                    height: Dimension.listViewTextSize,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight:
                                            Radius.circular(Dimension.radius20),
                                        bottomRight:
                                            Radius.circular(Dimension.radius20),
                                      ),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: Dimension.width10,
                                          right: Dimension.width10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          BigText(
                                            text: recommendedProduct
                                                .recommendedProductList[index]
                                                .name!,
                                          ),
                                          SizedBox(
                                            height: Dimension.height10,
                                          ),
                                          SmallText(
                                            text: "With cafe ideas",
                                          ),
                                          SizedBox(
                                            height: Dimension.height10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              IconAndTextWidget(
                                                icon: Icons.circle_sharp,
                                                text: "Normal",
                                                iconColor: AppColors.iconColor1,
                                              ),
                                              // SizedBox(width:5),
                                              IconAndTextWidget(
                                                icon: Icons.location_on,
                                                text: "1.7km",
                                                iconColor: AppColors.mainColor,
                                              ),
                                              // SizedBox(width:5),
                                              IconAndTextWidget(
                                                icon: Icons.access_time_rounded,
                                                text: "32min",
                                                iconColor: AppColors.iconColor2,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      );
                    })
                : CircularProgressIndicator(
                    color: AppColors.mainColor,
                  );
          },
        )
      ],
    );
  }


  Widget _buildProductItem(){
    return  Container(
      padding: EdgeInsets.only(left: Dimension.width10, right: Dimension.width10),
      // height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(image: AssetImage("images/fruits.jpg"),
                    height:Dimension.listViewImgSize/1.5,
                    ),
                    // SizedBox(
                    //   height: Dimension.height20,
                    // ),
                    BigText(text: "Fruits",
                    size: 20,
                    
                    ),
                  ],
                ),
              );
  }

  Widget _buildPageItem(int index, ProductModels popularProduct) {
    Matrix4 matrix = new Matrix4.identity(); //scalling the page
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteHelper.getPopularFood(index,"home"));
      },
      child: Transform(
        transform: matrix,
        child: Stack(
          children: [
            Container(
              height: Dimension.pageViewContainer,
              margin: EdgeInsets.only(
                  left: Dimension.width10, right: Dimension.width10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.radius30),
                  color: index.isEven
                      ? const Color(0xFF69c5df)
                      : const Color(0xFF9294cc),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                       NetworkImage(
                        AppConstants.BASE_URL +
                          AppConstants.UPLOAD_URL +
                          popularProduct.img!
                          ))),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimension.pageViewTextContainer,
                margin: EdgeInsets.only(
                    left: Dimension.width30,
                    right: Dimension.width30,
                    bottom: Dimension.height30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.radius20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      offset: const Offset(
                          0, 5), //this gives the shadow to the down side
                    ),
                  ],
                ),
                child: AppColumn(
                  text: popularProduct.name!,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
