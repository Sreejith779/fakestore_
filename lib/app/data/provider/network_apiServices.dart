import 'dart:convert';
import 'package:http/http.dart' as http;
import 'base_apiServices.dart';


class NetworkApiServices extends BaseApiServices {

  @override
  Future<dynamic> getApi(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {

        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {

      print('Exception: $e');
      return null;
    }
  }

  @override
  Future<dynamic> postApi(dynamic data, String url) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {

      print('Exception: $e');
      return null;
    }
  }
}
