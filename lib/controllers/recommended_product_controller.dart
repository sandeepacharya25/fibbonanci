import 'package:fibbonanci/data/repository/popular_product_repo.dart';
import 'package:fibbonanci/data/repository/recommended_product_repo.dart';
import 'package:fibbonanci/models/popular_product_models.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});

  List<ProductModels> _recommendedProductList = [];
  List<ProductModels> get recommendedProductList=>_recommendedProductList;

  bool _isLoaded=false;
  bool get isLoaded=>_isLoaded;

  Future<void> getRecommendedProductList() async{
   Response response=await recommendedProductRepo.getRecommendedProductList();

  //  print("The status code is ${response.statusCode}");
  //  print(response.body);
   
   if(response.statusCode==200){
    // print("got products");
    _recommendedProductList=[];
   _recommendedProductList.addAll(Product.fromJson(response.body).products);
  //  print(_recommendedProductList);
   _isLoaded=true;
    update();//this is like setstate
   }else{
    print("Not got products");
   
    
   }
  }
  
}