import 'package:fibbonanci/pages/cart/cart_page.dart';
import 'package:fibbonanci/pages/home/book/popular_book_details.dart';
import 'package:fibbonanci/pages/home/book/recommended_details.dart';
import 'package:fibbonanci/pages/home/main_food_page.dart';
import 'package:fibbonanci/pages/profile.dart';
import 'package:get/get.dart';

class RouteHelper {
  static String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage="/cart-page";
  static const String profilePage="/profile-page";

  static String getPopularFood(int pageId,String page) => '$popularFood?pageId=$pageId&page=$page';
  static String getInitial() => '$initial';
  static String getRecommended(int pageId,String page) => '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage()=>'$cartPage';
  static String getProfilePage()=>'$profilePage';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainFoodPage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId=Get.parameters['pageId'];
          var page=Get.parameters["page"];
          return PopularBookDetails(pageId:int.parse(pageId!),page:page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId=Get.parameters['pageId'];
          var page=Get.parameters["page"];
          return RecommendedDetails(pageId:int.parse(pageId!),page: page!,);
        },
        transition: Transition.fadeIn,),

        GetPage(name:cartPage,page:(){
          return CartPage();
        },
        transition: Transition.fadeIn),

        GetPage(name:profilePage,page:(){
          return Profile();
        },
        transition: Transition.fadeIn),
        
  ];
}
