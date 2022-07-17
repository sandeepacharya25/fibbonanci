import 'package:fibbonanci/data/api/api_client.dart';
import 'package:fibbonanci/utils/app_Constants.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  final ApiCLient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<dynamic> getRecommendedProductList() async {
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URL);
  }
}
