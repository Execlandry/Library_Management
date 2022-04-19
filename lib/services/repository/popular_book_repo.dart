import 'package:get/get.dart';
import 'package:library_management/services/api/api_client.dart';

//inorder to load data we must extend getxservice class from get package
class PopularBookRepo extends GetxService{
  final ApiClient apiClient;
  PopularBookRepo({required this.apiClient});

  Future <Response> getPopularBooksList() async{
    return await apiClient.getData("/api/students");


  }

}