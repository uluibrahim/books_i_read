import 'package:books_i_read/core/base/model/base_model.dart';
import 'package:easy_localization/easy_localization.dart';

class BookModel extends BaseModel {
  BookModel({
    this.id,
    this.name,
    this.writer,
    this.countPage,
    this.startDate,
    this.finishDate,
  });

  int? id;
  String? name;
  String? writer;
  String? countPage;
  dynamic startDate;
  dynamic finishDate;

  @override
  fromJson(Map<String, dynamic> map) => BookModel(
        id: map["id"],
        name: map["name"],
        writer: map["writer"],
        countPage: map["count_page"],
        startDate: map["start_date"],
        finishDate: map["finish_date"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "writer": writer,
        "count_page": countPage,
        "start_date": startDate,
        "finish_date": finishDate,
      };
}
