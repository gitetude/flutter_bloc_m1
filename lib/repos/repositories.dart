import 'dart:convert';
import 'package:http/http.dart';
import '../models/textPrixDist_model.dart';

class TextPrixDistRepository {
  String endpoint = 'http://74.208.37.86:9088/textprixdist';
  Future<List<TextPrixDistModel>> getTextPrixDists() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map(((e) => TextPrixDistModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

