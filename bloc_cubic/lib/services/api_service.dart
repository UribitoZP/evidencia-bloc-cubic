import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_modelo.dart';

class ApiService {
  final String url;

  ApiService(this.url);

  Future<List<Modelo>> fetchData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Modelo.fromJson(e)).toList();
    } else {
      throw Exception("Error al cargar datos");
    }
  }
}
