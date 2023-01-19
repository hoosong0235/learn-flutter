import 'dart:convert';
import 'package:http/http.dart' as http;

class CoinAPI {
  String key = '36C16606-92D8-4B3C-81DA-3E9701061A32';
  String authority = 'rest.coinapi.io';
  late String unencodedPath;

  CoinAPI({required this.unencodedPath});

  Future<double> exchangeRate() async {
    try {
      http.Response response = await http.get(
        Uri.https(
          authority,
          '/v1/exchangerate' + unencodedPath,
        ),
        headers: {'X-CoinAPI-Key': key},
      );

      return jsonDecode(response.body)['rate'];
    } catch (e) {
      print(e);

      return 0.0;
    }
  }
}
