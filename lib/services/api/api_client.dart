import 'package:get/get.dart';
import 'package:library_management/common/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient extends GetConnect implements GetxService {
  String? token;
  final String appBaseUrl;
  SharedPreferences? sharedPreferences;

  //map is used to simulate objects
  late Map<String, String> _mainHeaders;

  ApiClient({
    required this.appBaseUrl,
  }) {
    baseUrl = appBaseUrl;
    //keep sending the request for 30 seconds
    timeout = Duration(seconds: 30);
    token = sharedPreferences?.getString(AppConstants.TOKEN)!;

    //since we defined a map above which takes key:value pair as strings
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  void updateHeader(String token) {
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> getData(
    String uri,
  ) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

//body is the information we want to send server
  Future<Response> postData(String uri, dynamic body) async {
    print(body.toString());
    try {
      Response response = await post(uri, body, headers: _mainHeaders);
      print(response.toString());
      return response;
    } catch (e) {
      print(e.toString());
      //if this go wrong tell the ui
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
