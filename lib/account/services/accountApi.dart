import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/models/articletype.dart';
import 'package:cargoshipping/models/manualtype.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AccountApi {
  const AccountApi();

  //เรียกดูข้อมูล ประเภทบทความ
  static Future<List<ArticleType>> getArticleType() async {
    final url = Uri.https(publicUrl, '/api/ArticleType/showall');
    var headers = {'Content-Type': 'application/json'};
    final response = await http.get(
      headers: headers,
      url,
    );
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final list = data['data'] as List;
      return list.map((e) => ArticleType.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  //เรียกดูข้อมูล บทความแต่ละประเภท
  static Future<ArticleType> getArticleTypeById({required int article_id}) async {
    final url = Uri.https(publicUrl, '/api/ArticleType/show/$article_id');
    var headers = {'Content-Type': 'application/json'};
    final response = await http.get(
      headers: headers,
      url,
    );
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      return ArticleType.fromJson(data['data']);
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  //เรียกดูข้อมูล ประเภทคู่มือ
  static Future<List<ManualType>> getManualType() async {
    final url = Uri.https(publicUrl, '/api/ManualType/showall');
    var headers = {'Content-Type': 'application/json'};
    final response = await http.get(
      headers: headers,
      url,
    );
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final list = data['data'] as List;
      return list.map((e) => ManualType.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  //เรียกดูข้อมูล คู่มือแต่ละประเภท
  static Future<ManualType> getManualTypeById({required int manual_id}) async {
    final url = Uri.https(publicUrl, '/api/ManualType/show/$manual_id');
    var headers = {'Content-Type': 'application/json'};
    final response = await http.get(
      headers: headers,
      url,
    );
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      return ManualType.fromJson(data['data']);
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }
}
