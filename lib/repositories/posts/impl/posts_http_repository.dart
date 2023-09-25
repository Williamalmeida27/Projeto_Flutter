import 'dart:convert';

import 'package:my_app/model/posts_model.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/repositories/posts/posts_repository.dart';

class PostsHttpRepository implements PostsRepository {
  @override
  Future<List<PostsModel>> listarPosts() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      var postJson = jsonDecode(response.body);
      print(postJson);
      return (postJson as List).map((e) => PostsModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
