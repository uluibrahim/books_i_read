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

  @override
  Future deleteBook(int bookId) async {
    try {
      await _service.deleteBook(bookId);
      myBooks!.removeWhere((element) => element.id == bookId);
      notifyListeners();
      return true;
    } catch (e) {
      debugPrint("delete book error: $e");
      return false;
    }
  }

  BookModel? newBook;
  @override
  Future createBook(
      {required String name,
      required String writer,
      required String countPage,
      required String startDate,
      required String finishDate}) async {
    try {
      state = ViewState.busy;
      newBook = await _service.createBook(
          name: name,
          writer: writer,
          countPage: countPage,
          startDate: startDate,
          finishDate: finishDate);
      return newBook != null;
    } catch (e) {
      debugPrint("error save book: $e");
      return false;
    } finally {
      state = ViewState.idle;
    }
  }

  BookModel? updatedBook;
  @override
  Future updateBook(
      {required int id,
      required String name,
      required String writer,
      required String countPage,
      required String startDate,
      required String finishDate}) async {
    state = ViewState.busy;
    try {
      updatedBook = await _service.updateBook(
          id: id,
          name: name,
          writer: writer,
          countPage: countPage,
          startDate: startDate,
          finishDate: finishDate);
      return updatedBook != null;
    } catch (e) {
      debugPrint("update book error: $e");
      return false;
    } finally {
      state = ViewState.idle;
    }
  }
}
