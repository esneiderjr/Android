import 'package:http/http.dart' as http;

class AllApi {
  //ferasApp.php
  static String starUrl = 'https://api.clotthy.com/api';
  // static Dio _dio = new Dio();
  static Future<http.Response> httpGet(String path,) async {
    final url = starUrl + path;
    // print(url);
    try {
      return http.get(
        Uri.parse(url),
        headers: <String, String>{
          
          'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
        },
      );
    } catch (e) {
      throw ('Error en el get');
    }
  }

  static Future<http.Response> httpPost(String path, parametros) async {
    final url = starUrl + path;
    // print(url);
    try {
      return http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
          },
          body: parametros);
    } catch (e) {
      throw ('Error en el POST');
    }
  }
}
