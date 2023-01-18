import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  final String authority = 'api.weatherapi.com';
  final String key = 'aae641cb8a9b43608ba215358231701';
  late String q;

  Networking({required this.q});

  Future getResponseBody() async {
    const String path = '/v1/current.json';
    Map<String, String> headers = {"key": key, "q": q};

    try {
      http.Response response = await http.get(
        Uri.http(authority, path, headers = headers),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
