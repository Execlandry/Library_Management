import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  // late String token;
  final String appBaseUrl;

  //map is used to simulate objects
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl,}) {

    baseUrl = appBaseUrl;
    //keep sending the request for 30 seconds
    timeout = Duration(seconds: 30);

    //since we defined a map above which takes key:value pair as strings
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      // 'Authorization': 'Bearer $token',
    };
  }

  Future <Response> getData(String uri,) async{
    try{
      Response response =await get(uri);
      return response;
    }
    catch(e){
      return Response(statusCode: 1,statusText: e.toString());

    }

  }

}
