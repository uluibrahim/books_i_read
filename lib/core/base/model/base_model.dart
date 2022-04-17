abstract class BaseModel<T> {
  T fromJson(Map<String, dynamic> map);
  Map<String, dynamic> toMap();
}
