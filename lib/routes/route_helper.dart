import 'package:fibbonanci/pages/home/book/popular_book_details.dart';
import 'package:fibbonanci/pages/home/book/recommended_details.dart';
import 'package:fibbonanci/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";

  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getInitial() => '$initial';
  static String getRecommended(int pageId) => '$recommendedFood?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainFoodPage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId=Get.parameters['pageId'];
          return PopularBookDetails(pageId:int.parse(pageId!));
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId=Get.parameters['pageId'];
          return RecommendedDetails(pageId:int.parse(pageId!));
        },
        transition: Transition.fadeIn),
  ];
}
