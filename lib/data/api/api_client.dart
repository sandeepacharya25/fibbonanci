import 'package:get/get.dart';

class ApiCLient extends GetConnect implements GetxService{
  late String token;
  final String appBaseUrl;

  late Map<String, String> _mainHeaders;//Map is for storing data locally or converting data to map
  //in our case we are accepting string as a key and string as a value for _mainheaders variable

  ApiCLient({required this.appBaseUrl}){
    baseUrl=appBaseUrl;
    timeout=Duration(seconds: 30);
    _mainHeaders={
      'Content-Type':'application/json; charset=UTF-8',
      'Authorization':'Bearer $token',
    };
  }
  Future<Response> getData(String uri,)async{
    try{
      Response response= await get(uri);
      return response;
    }catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}