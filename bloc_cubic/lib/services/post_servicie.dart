import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post_modelo.dart';

class PostService {
  final String url;
  PostService(this.url);

  Future<List<PostModel>> fetchPosts() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((e) => PostModel.fromJson(e)).toList();
    } else {
      throw Exception("Error al cargar posts");
    }
  }
}
