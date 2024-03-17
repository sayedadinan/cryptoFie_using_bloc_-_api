import 'dart:convert';
import 'package:cryptofy/data/model/model_class.dart';
import 'package:http/http.dart' as http;

class CryptoApi {
  Future<List<Coinmodel>> fetchData() async {
    const url =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as List;
      final coinmodel = body.map(
        (e) {
          return Coinmodel.fromJson(e);
        },
      ).toList();
      return coinmodel;
    } else {
      return [];
    }
  }
}
