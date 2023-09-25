import 'package:my_app/model/photos_model.dart';
import 'package:my_app/repositories/jsonplaceholder_dio_custom.dart';

class PhotosDioRepository {
  Future<List<PhotosModel>> obterPhotos() async {
    var dio = JsonPlaceHolderDioCustom();
    var response = await dio.baseUrl.get('/photos');
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => PhotosModel.fromJson(e))
          .toList();
    }
    return [];
  }
}
