import 'dart:convert';

import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/models/categories.dart';
import 'package:cargoshipping/models/item.dart';
import 'package:cargoshipping/models/problembodies.dart';
import 'package:cargoshipping/models/problemtype.dart';
import 'package:cargoshipping/models/reportproblems.dart';
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
  // static Future<List<Problembodies>> sendProblem(
  //     {required int problem_types_id,
  //     required String title,
  //     required String body}) async {
  //   final url = Uri.https(publicUrl, '/api/ReportProblem/store');
  //   var headers = {'Content-Type': 'application/json'};
  //   final response = await http.post(headers: headers, url, body: {
  //     'title': title,
  //     'body': body,
  //     'problem_types_id': problem_types_id,
  //     'officer_response': '',
  //     'photo_report': [],
  //   });

  //   if (response.statusCode == 200) {
  //     final data = convert.jsonDecode(response.body);

  //     return data['message'];
  //   } else {
  //     final data = convert.jsonDecode(response.body);
  //     throw Exception(data['message']);
  //   }
  // }

  // static Future<String> sendProblem({
  //   required int problem_types_id,
  //   required String title,
  //   required String body,
  // }) async {
  //   final url = Uri.https(publicUrl, '/api/ReportProblem/store');
  //   var headers = {'Content-Type': 'application/json'};

  //   // ใช้ jsonEncode เพื่อแปลง body เป็น JSON
  //   final response = await http.post(
  //     url,
  //     headers: headers,
  //     body: jsonEncode({
  //       'title': title,
  //       'body': body,
  //       'problem_types_id': problem_types_id,
  //       'officer_response': '',
  //       'photo_report': [],
  //     }),
  //   );

  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     // Return the message as a String
  //     return data['message'];
  //   } else {
  //     final data = jsonDecode(response.body);
  //     throw Exception(data['message']);
  //   }
  // }

  static Future<String> sendProblem({
    required int
        problem_body_id, // เปลี่ยนจาก `problem_types_id` เป็น `problem_body_id`
    required String title,
    required String body,
  }) async {
    final url = Uri.https(publicUrl, '/api/ReportProblem/store');
    var headers = {'Content-Type': 'application/json'};

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode({
        'problem_body_id': problem_body_id, // ใช้ `problem_body_id`
        'title': title,
        'body': body,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['message'];
    } else {
      final data = jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  // เรียกดูข้อมูล ReportProblems
  static Future<List<ReportProblems>> getReport() async {
    final url = Uri.https(publicUrl, '/api/ReportProblem/showall');
    var headers = {'Content-Type': 'application/json'};

    final response = await http.get(
      headers: headers,
      url,
    );

    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final list = data['data'] as List;
      return list.map((e) => ReportProblems.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  // ดึงข้อมูล `ReportProblem` รายการเดียวตาม `id`
  // static Future<ReportProblem> fetchReportById(int id) async {
  //   final url = Uri.https('yourapi.com',
  //       '/api/ReportProblem/$id'); // เปลี่ยน `yourapi.com` และ endpoint ตามต้องการ

  //   final response = await http.get(url);

  //   if (response.statusCode == 200) {
  //     // แปลงข้อมูล JSON ที่ได้มาเป็น `ReportProblem`
  //     final Map<String, dynamic> data = jsonDecode(response.body);
  //     return ReportProblem.fromJson(data);
  //   } else {
  //     throw Exception('Failed to load report with id: $id');
  //   }
  // }
}
