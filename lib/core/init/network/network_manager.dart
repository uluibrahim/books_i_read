import 'package:dio/dio.dart';

import '../../base/model/base_model.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance => _instance ??= NetworkManager._init();

  Dio _dio = Dio();
  NetworkManager._init() {
    final _baseOptions = BaseOptions(baseUrl: "http://toolguide.benkimmiyim.com");
    _dio = Dio(_baseOptions);
  }

  Future<dynamic> dioGet<T extends BaseModel>(String path,
      {T? model,
      Options? options,
      Map<String, dynamic>? queryParameters}) async {
    Response _response = await _dio.get(path,
        options: options, queryParameters: queryParameters);

    switch (_response.statusCode) {
      case 200:
        final responseBody = _response.data;
        if ((responseBody is List) && model != null) {
          return responseBody.map((e) => model.fromJson(e)).toList();
        } else if ((responseBody is Map) && model != null) {
          return model.fromJson(responseBody as Map<String, dynamic>);
        } else {
          return responseBody;
        }
      default:
    }
  }

  Future<dynamic> dioPost<T extends BaseModel>(String path,
      {T? model, dynamic data, Options? options}) async {
    Response _response = await _dio.post(path, options: options, data: data);
    if (_response.statusCode == 200 || _response.statusCode == 201) {
      final _responseBody = _response.data;
      if ((_responseBody is List) && model != null) {
        return _responseBody.map((e) => model.fromJson(e)).toList();
      } else if ((_responseBody is Map) && model != null) {
        return model.fromJson(_responseBody as Map<String, dynamic>);
      } else {
        return _responseBody;
      }
    }
  }
}
