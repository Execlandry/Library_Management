import 'package:get/get.dart';
import 'package:library_management/common/app_constants.dart';
import 'package:library_management/controllers/AuthController/auth_controller.dart';
import 'package:library_management/controllers/popularBook/popular_book_controller.dart';
import 'package:library_management/services/api/api_client.dart';
import 'package:library_management/services/repository/auth_repo.dart';
import 'package:library_management/services/repository/popular_book_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  //loading dependencies
  final sharedPreferences = await SharedPreferences.getInstance();

  //api client
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  //repos
  Get.lazyPut(() => PopularBookRepo(apiClient: Get.find()));
  // Get.lazyPut(() => PopularBookRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => PopularBookController(
        popularBookRepo: Get.find(),
      ));
}
