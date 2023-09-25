import 'package:my_app/model/posts_model.dart';

abstract class PostsRepository {
  Future<List<PostsModel>> listarPosts();
}
