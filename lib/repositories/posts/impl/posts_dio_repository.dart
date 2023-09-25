import 'package:my_app/model/posts_model.dart';
import 'package:my_app/repositories/jsonplaceholder_dio_custom.dart';
import 'package:my_app/repositories/posts/posts_repository.dart';

class PostsDioRepository implements PostsRepository {
  @override
  Future<List<PostsModel>> listarPosts() async {
    var dio = JsonPlaceHolderDioCustom();
    var response = await dio.baseUrl.get('/posts');
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => PostsModel.fromJson(e))
          .toList();
    }
    return [];
  }
}
