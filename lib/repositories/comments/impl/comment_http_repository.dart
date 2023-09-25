import 'dart:convert';

import 'package:my_app/repositories/comments/comment_repository.dart';

import '../../../model/comment_model.dart';
import 'package:http/http.dart' as http;

class CommentHttpRepository implements CommentRepository {
  @override
  Future<List<CommentModel>> retornaComentarios(int postId) async {
    var res = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/posts/$postId/comments'));
    if (res.statusCode == 200) {
      var commentJsonDecode = jsonDecode(res.body);
      return (commentJsonDecode as List)
          .map((e) => CommentModel.fromJson(e))
          .toList();
    }
    return [];
  }
}
