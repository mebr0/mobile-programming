import 'package:dio/dio.dart';

class StoreAPI {
  late Dio dio;
  late String baseURL;

  StoreAPI()
      : dio = Dio(),
        baseURL = 'https://fakestoreapi.com';

  Future<String> getToken(String login, String password) async {
    Map body = {'username': login, 'password': password};
    dio.options.headers["Content-Type"] = "application/json";

    try {
      Response<Map> res = await dio.post('$baseURL/auth/login', data: body);
      if (res.statusCode != 200) {
        return "";
      }

      return res.data!["token"];
    } on DioError catch (e) {
      print(e);
      return "";
    }
  }
}
