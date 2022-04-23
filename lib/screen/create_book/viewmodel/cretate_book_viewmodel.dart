import 'package:books_i_read/product/enum/view_state.dart';
import 'package:books_i_read/screen/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';

class CreateBookViewmodel extends ChangeNotifier {
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
}
