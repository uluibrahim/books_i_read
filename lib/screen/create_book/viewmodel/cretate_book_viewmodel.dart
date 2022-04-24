import 'package:books_i_read/product/enum/view_state.dart';
import 'package:books_i_read/screen/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../home/model/book_model.dart';

class CreateBookViewmodel extends ChangeNotifier {
  late final TextEditingController controllerName;
  late final TextEditingController controllerWriter;
  late final TextEditingController controllerStartDate;
  late final TextEditingController controllerFinishDate;
  late final TextEditingController controllerCountPage;

  BookModel? bookModel;
  CreateBookViewmodel({this.bookModel}) {
    init;
  }
  get init {
    if (bookModel != null) {
      controllerName = TextEditingController(text: bookModel!.name);
      controllerWriter = TextEditingController(text: bookModel!.writer);
      controllerStartDate = TextEditingController(text: bookModel!.startDate);
      controllerFinishDate = TextEditingController(text: bookModel!.finishDate);
      controllerCountPage = TextEditingController(text: bookModel!.countPage);
    } else {
      controllerName = TextEditingController();
      controllerWriter = TextEditingController();
      controllerStartDate = TextEditingController();
      controllerFinishDate = TextEditingController();
      controllerCountPage = TextEditingController();
      notifyListeners();
    }
  }

  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  set state(ViewState state) {
    _state = state;
    notifyListeners();
  }

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  AutovalidateMode get autovalidateMode => _autovalidateMode;

  set autovalidateMode(AutovalidateMode autovalidateMode) {
    _autovalidateMode = autovalidateMode;
    notifyListeners();
  }

  Future createBook(
      {required String name,
      required String writer,
      required String countPage,
      required String startDate,
      required String finishDate,
      required HomeViewmoel viewmodel}) async {
    state = ViewState.busy;
    var result = await viewmodel.createBook(
        name: name,
        writer: writer,
        countPage: countPage,
        startDate: startDate,
        finishDate: finishDate);
    result ? state = ViewState.idle : state = ViewState.error;
    return result;
  }

  Future updateBook(
      {required int id,
      required String name,
      required String writer,
      required String countPage,
      required String startDate,
      required String finishDate,
      required HomeViewmoel viewmodel,
      required int index}) async {
    state = ViewState.busy;
    var result = await viewmodel.updateBook(
        id: id,
        name: name,
        writer: writer,
        countPage: countPage,
        startDate: startDate,
        finishDate: finishDate,
        index: index);
    result ? state = ViewState.idle : state = ViewState.error;
    return result;
  }
}
