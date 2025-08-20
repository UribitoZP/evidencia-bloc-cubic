import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_modelo.dart';

class UserService {
  final String url;
  UserService(this.url);

  Future<List<UserModel>> fetchUsers() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception("Error al cargar usuarios");
    }
  }
}
