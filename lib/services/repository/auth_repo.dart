import 'package:get/get_connect/connect.dart';
import 'package:library_management/common/app_constants.dart';
import 'package:library_management/models/signup_body_model.dart';
import 'package:library_management/services/api/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({
    required this.apiClient,
    required this.sharedPreferences
  });

  //similar function as authcontroller

  Future <Response> registration(SignUpBody signUpBody) async{
    return await apiClient.postData(AppConstants.REGISTRATION_URI, signUpBody.toJson());
  }

  // to store token in the device using shared preferences

  saveUserToken(String token)async{
    //storing token in the memory as well as on the server
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);

  }

}