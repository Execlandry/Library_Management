import 'package:get/get.dart';
import 'package:library_management/controllers/popularBook/popular_book_controller.dart';
import 'package:library_management/services/api/api_client.dart';
import 'package:library_management/services/repository/popular_book_repo.dart';

Future<void> init() async {
  //loading dependencies

  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: "http://127.0.0.1:8000"));
  //repos
  Get.lazyPut(() => PopularBookRepo(apiClient: Get.find()));
  //controllers
  Get.lazyPut(() => PopularBookController(
        popularBookRepo: Get.find(),
      ));
}
