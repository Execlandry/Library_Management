import 'package:get/get.dart';
import 'package:library_management/models/popular_product_model.dart';
import 'package:library_management/services/repository/popular_book_repo.dart';

class PopularBookController extends GetxController {
  //creating a instance of popularbookrepo class to get or call methods of it
  final PopularBookRepo popularBookRepo;
  PopularBookController({required this.popularBookRepo});

  List<dynamic> _popularBookList = [];

  //to access it anywhere in the ui,so call the below variable since its not private
  List<dynamic> get popularBookList => _popularBookList;

  Future<void> getPopularBookList() async {
    //since we are saving repo as Response the type of the below variable
    //should also be response
    Response response = await popularBookRepo.getPopularBooksList();

    //if the response is successful
    if (response.statusCode == 200) {
      print("Got Books");
      _popularBookList = [];
      _popularBookList.addAll(StudentModel.fromJson(response.body).students);

      update(); //its like setstate to update data

    } else {}
  }
}
