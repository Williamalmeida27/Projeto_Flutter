import 'package:dio/dio.dart';
import 'package:my_app/model/comment_model.dart';
import 'package:my_app/repositories/comments/comment_repository.dart';
import 'package:my_app/repositories/jsonplaceholder_dio_custom.dart';

class CommentDioRepository implements CommentRepository {
  @override
  Future<List<CommentModel>> retornaComentarios(int postId) async {
    var dio = JsonPlaceHolderDioCustom();
    var response = await dio.baseUrl.get('/posts/$postId/comments');
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => CommentModel.fromJson(e))
          .toList();
    }
    return [];
  }
}
