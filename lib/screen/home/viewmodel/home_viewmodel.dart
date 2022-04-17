import 'package:books_i_read/locator.dart';
import 'package:books_i_read/screen/home/service/home_service.dart';
import 'package:flutter/material.dart';

import '../../../product/enum/view_state.dart';
import '../model/book_model.dart';

class HomeViewmoel extends ChangeNotifier implements HomeService {
  final HomeService _service = locator<HomeService>();
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  set state(ViewState state) {
    _state = state;
    notifyListeners();
  }

  List<BookModel>? _myBooks;

  List<BookModel>? get myBooks => _myBooks;

  set myBooks(List<BookModel>? myBooks) {
    _myBooks = myBooks;
    notifyListeners();
  }

  HomeViewmoel() {
    getMyBooks;
  }
  @override
  Future get getMyBooks async {
    state = ViewState.busy;
    try {
      List books = await _service.getMyBooks;
      myBooks = books.cast<BookModel>();
      state = ViewState.idle;
    } catch (e) {
      debugPrint("error get my books: $e");
      state = ViewState.error;
    }
  }
}
