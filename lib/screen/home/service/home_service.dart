import 'package:books_i_read/core/init/network/network_manager.dart';

import '../model/book_model.dart';

class HomeService {
  Future get getMyBooks async {
    return await NetworkManager.instance!.dioGet(
      "/books",
      model: BookModel(),
    );
  }

  Future deleteBook(int bookId) async {
    return await NetworkManager.instance!.dioDelete("/book/delete/$bookId");
  }

  Future createBook(
      {required String name,
      required String writer,
      required int countPage,
      required String startDate,
      required String finishDate}) async {
    return await NetworkManager.instance!.dioPost(
      "/book/save",
      model: BookModel(),
      data: {
        "name": name,
        "count_page": countPage.toString(),
        "writer": writer,
        "start_date": startDate,
        "finish_date": finishDate,
      },
    );
  }
}
