import 'package:my_app/model/comment_model.dart';

abstract class CommentRepository {
  Future<List<CommentModel>> retornaComentarios(int postId);
}
