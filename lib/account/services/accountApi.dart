import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/models/articletype.dart';
import 'package:cargoshipping/models/manualtype.dart';
import 'package:cargoshipping/models/newsPaper/newsPaperShow.dart';
import 'package:cargoshipping/models/serviceTransporter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';

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

  static Future addWallet({
    String? in_from,
    String? out_to,
    String? reference_id,
    String? detail,
    int? amount,
    String? type,
  }) async {
    // final domain = prefs.getString('domain');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final userID = prefs.getInt('userID');
    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    final url = Uri.https(publicUrl, '/api/wallet_trans');
    final response = await http.post(
      url,
      headers: headers,
      body: convert.jsonEncode({
        'member_id': userID,
        'in_from': in_from,
        'out_to': out_to,
        'reference_id': reference_id,
        'detail': detail,
        'amount': amount,
        'type': type,
      }),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = convert.jsonDecode(response.body);
      return data;
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  static Future<List<NewsPaperShow>> getNewsPaper() async {
    final url = Uri.https(publicUrl, '/api/get_category_news');

    var headers = {'Content-Type': 'application/json'};
    final response = await http.get(
      headers: headers,
      url,
    );
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final list = data['data'] as List;
      return list.map((e) => NewsPaperShow.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  static Future<List<NewsPaperShow>> getManual() async {
    final url = Uri.https(publicUrl, '/api/get_category_manual');

    var headers = {'Content-Type': 'application/json'};
    final response = await http.get(
      headers: headers,
      url,
    );
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final list = data['data'] as List;
      return list.map((e) => NewsPaperShow.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }
}
