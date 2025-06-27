import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String url = 'https://fakestoreapi.com/products';

  static Future<List<dynamic>> fetchProducts() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }
}
