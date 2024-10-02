import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/models/categories.dart';
import 'package:cargoshipping/models/item.dart';
import 'package:cargoshipping/models/problembodies.dart';
import 'package:cargoshipping/models/problemtype.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HomeApi {
  const HomeApi();

  //เรียกดูข้อมูล Category
  static Future<List<Categories>> getCategories({required String name}) async {
    final url = Uri.https(
        'api.atphosting24.com', '/category/api.php', {"folder": '$name'});
    var headers = {'Content-Type': 'application/json'};
    final response = await http.get(
      headers: headers,
      url,
    );
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final list = data['categories'] as List;
      return list.map((e) => Categories.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  //เรียกดูข้อมูล ตาม Category
  static Future<List<Item>> getItemCategories(
      {required String categories_name}) async {
    final url = Uri.https('api.kongcrdv.com', '/taobao/api_call.php', {
      "api_name": 'item_search',
      "lang": 'zh-CN',
      "q": '$categories_name',
      "page": '1',
      "key": 'tegcargo06062024'
    });
    var headers = {'Content-Type': 'application/json'};
    final response = await http.get(
      headers: headers,
      url,
    );
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final list = data['items']['item'] as List;
      return list.map((e) => Item.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  //เรียกดูข้อมูล ProblemType
  static Future<List<ProblemType>> getProblem() async {
    final url = Uri.https(publicUrl, '/api/ProblemType/showall');
    var headers = {'Content-Type': 'application/json'};
    final response = await http.get(
      headers: headers,
      url,
    );
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final list = data['data'] as List;
      return list.map((e) => ProblemType.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  //เรียกดูข้อมูลproblembody
  static Future<List<Problembodies>> getProblemBodies(int id) async {
    final url = Uri.https(publicUrl, '/api/ProblemBody/show/$id');
    var headers = {'Content-Type': 'application/json'};
    final response = await http.get(
      headers: headers,
      url,
    );

    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);

      if (data['data'] is List) {
        final list = data['data'] as List;
        return list.map((e) => Problembodies.fromJson(e)).toList();
      } else if (data['data'] is Map) {
        final item = Problembodies.fromJson(data['data']);
        return [item];
      } else {
        throw Exception('Unexpected data format');
      }
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

//เรียกดูข้อมูลproblembody
  static Future<List<Problembodies>> sendProblem(
      {required int problem_types_id,
      required String title,
      required String body}) async {
    final url = Uri.https(publicUrl, '/api/ReportProblem/store');
    var headers = {'Content-Type': 'application/json'};
    final response = await http.post(headers: headers, url, body: {
      'title': title,
      'body': body,
      'problem_types_id': problem_types_id,
      'officer_response': '',
      'photo_report': [],
    });

    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);

      return data['message'];
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }
}
