// ignore_for_file: unused_field, prefer_const_constructors

import 'package:fibbonanci/utils/app_Constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiCLient extends GetConnect implements GetxService{
  late String token;
  final String appBaseUrl;

  late Map<String, String> _mainHeaders;//Map is for storing data locally or converting data to map
  //in our case we are accepting string as a key and string as a value for _mainheaders variable

  ApiCLient({required this.appBaseUrl}){
    baseUrl=appBaseUrl;
    timeout=Duration(seconds: 30);
    token=AppConstants.TOKEN;
    _mainHeaders={
      'Content-type':'application/json; charset=UTF-8',
      'Authorization':'Bearer $token',
    };
  }
  // Future<Response> getData(String uri,)async{
  //   try{
      
  //     Response response= await get(uri);
  //     // var response= await http.get(Uri.parse('http://mvs.bslmeiyu.com'+uri),headers: _mainHeaders);
  //     // print("the body is "+response.body);
  //     return response;
  //     // return Response(statusCode: 1, );
    
  //   }catch(e){
  //     return Response(statusCode: 1, statusText: e.toString());
  //   }
  // }
   Future<Response> getData(String uri,)async{
    try{
      
      Response response= await get("http://3.87.222.46:8085/api");
      print(response);
      // var response= await http.get(Uri.parse('http://mvs.bslmeiyu.com'+uri),headers: _mainHeaders);
      // print("the body is "+response.body);
      return response;
      // return Response(statusCode: 1, );
    
    }catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

}