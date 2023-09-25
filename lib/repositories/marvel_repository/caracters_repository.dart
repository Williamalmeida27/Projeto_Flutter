import 'dart:convert';
import 'package:convert/convert.dart' as con;
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_app/model/caracters_model.dart';
import 'package:crypto/crypto.dart' as crypto;

class MarvelRepository {
  Future<CaractersModel> obterCaracters(int offset) async {
    var dio = Dio();
    var privateKey = dotenv.get('YOURPRIVATEPUBLICKEY');
    var publicKey = dotenv.get('YOURPUBLICKEYMARVEL');
    var ts = DateTime.now().microsecondsSinceEpoch.toString();
    var hash = _generateMd5(ts + privateKey + publicKey);
    var query = "offset=$offset&ts=$ts&apikey=$publicKey&hash=$hash";
    var result =
        await dio.get('http://gateway.marvel.com/v1/public/characters?$query');

    var caractersModel = CaractersModel.fromJson(result.data);

    return caractersModel;
  }

  _generateMd5(String data) {
    var content = const Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return con.hex.encode(digest.bytes);
  }
}
