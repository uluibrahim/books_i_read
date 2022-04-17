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
}
