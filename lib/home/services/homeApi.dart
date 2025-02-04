import 'dart:convert';

import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/models/categories.dart';
import 'package:cargoshipping/models/item.dart';
import 'package:cargoshipping/models/itemsearch.dart';
import 'package:cargoshipping/models/problembodies.dart';
import 'package:cargoshipping/models/problemtype.dart';
import 'package:cargoshipping/models/rateShip.dart';
import 'package:cargoshipping/models/reportproblems.dart';
import 'package:cargoshipping/models/searchpic1688.dart';
import 'package:cargoshipping/models/searchpictaobao.dart';
import 'package:cargoshipping/models/serviceTransporter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HomeApi {
  const HomeApi();

  //เรียกดูข้อมูล Category
  static Future<List<Categories>> getCategories({required String name}) async {
    final url = Uri.https('api.atphosting24.com', '/category/api.php', {"folder": '$name'});
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
  static Future<List<Item>> getItemCategories({required String categories_name}) async {
    final url =
        Uri.https('api.kongcrdv.com', '/taobao/api_call.php', {"api_name": 'item_search', "lang": 'zh-CN', "q": '$categories_name', "page": '1', "key": 'tegcargo06062024'});
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

  //ค้นหาข้อมูลสินค้า
  static Future<List<ItemSearch>> getItemSearch({required String search, required String type}) async {
    // final url = Uri.https('api.kongcrdv.com', '/$type/api_call.php', {
    //   "api_name": 'item_search',
    //   "lang": 'zh-CN',
    //   "q": '$search',
    //   "page": '1',
    //   "key": 'tegcargo06062024'
    // });
    final url = Uri.https('api.icom.la', '/$type/api/call.php', {
      "item_search": 'item_search',
      "lang": 'zh-CN',
      "q": '$search',
      "page": '1',
      "api_key": 'tegcargo06062024',
      "is_promotion": '1',
    });
    var headers = {'Content-Type': 'application/json'};
    final response = await http.get(
      headers: headers,
      url,
    );
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final list = data['item']['items']['item'] as List;
      return list.map((e) => ItemSearch.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  //ดูข้อมูลรายละเอียดสินค้า
  static Future<ItemSearch> getItemDetail({required String num_id, required String type}) async {
    final url = Uri.https('api.icom.la', '/$type/api/call.php', {
      "item_get": '',
      "lang": 'zh-CN',
      "num_iid": '$num_id',
      "api_key": 'tegcargo06062024',
      "is_promotion": '1',
    });
    var headers = {'Content-Type': 'application/json'};
    final response = await http.get(
      headers: headers,
      url,
    );
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      return ItemSearch.fromJson(data['item']);
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  //อัปโหลดรูป
  static Future uploadImage({required String imgcode}) async {
    final url = Uri.https('kongcrdv.com', '/ima/index.php', {"imgcode": '${imgcode}', "key": 'tegcargo06062024'});
    var headers = {'Content-Type': 'application/json'};
    final response = await http.get(
      headers: headers,
      url,
    );
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      if (data['status'] == "success") {
        return data['items']['item']['name'];
      } else {
        throw Exception(data['message']);
      }
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  //ค้นหาข้อมูลสินค้าด้วยรูป
  static Future getItemSearchImg({required String searchImg, required String type}) async {
    // final url = Uri.https('api.kongcrdv.com', '/$type/api_call.php', {
    //   "api_name": 'item_search_img',
    //   "lang": 'zh-CN',
    //   "imgid": '$searchImg',
    //   "key": 'tegcargo06062024'
    // });
    final url =
        Uri.https('api.icom.la', '/$type/api/call.php', {"item_search_img": 'item_search_img', "lang": 'zh-CN', "imgid": '$searchImg', "page": '1', "api_key": 'tegcargo06062024'});
    var headers = {'Content-Type': 'application/json'};
    final response = await http.get(
      headers: headers,
      url,
    );
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final list = data['item']['items']['item'] as List;
      if (type == '1688') {
        return list.map((e) => SearchPic1688.fromJson(e)).toList();
      } else {
        return list.map((e) => SearchPicTaobao.fromJson(e)).toList();
      }
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
    required int problem_body_id, // เปลี่ยนจาก `problem_types_id` เป็น `problem_body_id`
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

  static Future<List<ServiceTransporter>> getService() async {
    final url = Uri.https(publicUrl, '/api/get_services');
    var headers = {'Content-Type': 'application/json'};
    final response = await http.get(
      headers: headers,
      url,
    );
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final list = data['data'] as List;
      return list.map((e) => ServiceTransporter.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  static Future<List<ServiceTransporter>> getStore() async {
    final url = Uri.https(publicUrl, '/api/get_store');
    var headers = {'Content-Type': 'application/json'};
    final response = await http.get(
      headers: headers,
      url,
    );
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final list = data['data'] as List;
      return list.map((e) => ServiceTransporter.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  static Future<List<ServiceTransporter>> getCategoryProduct() async {
    final url = Uri.https(publicUrl, '/api/get_category_product');
    var headers = {'Content-Type': 'application/json'};
    final response = await http.get(
      headers: headers,
      url,
    );
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final list = data['data'] as List;
      return list.map((e) => ServiceTransporter.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  static Future<List<RateShip>> getRateShip({int? page = 0, int? length = 10, String? search}) async {
    final url = Uri.https(publicUrl, '/api/rate_page');
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // final token = prefs.getString('token');
    var headers = {
      // 'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    final response = await http.post(url,
        headers: headers,
        body: convert.jsonEncode({
          "draw": 1,
          "order": [
            {"column": 0, "dir": "asc"}
          ],
          "start": page,
          "length": length,
          "search": {"value": search, "regex": false}
        }));
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final list = data['data']['data'] as List;
      return list.map((e) => RateShip.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
      // throw ApiException(data['message']);
    }
  }
}
