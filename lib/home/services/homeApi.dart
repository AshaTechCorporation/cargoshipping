import 'package:cargoshipping/models/categories.dart';
import 'package:cargoshipping/models/item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HomeApi {
  const HomeApi();

  //เรียกดูข้อมูล Category
  static Future<List<Categories>> getCategories({required String name}) async {
    final url = Uri.https('api.atphosting24.com', '/category/api.php',{"folder": '$name'});
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
    final url = Uri.https('api.kongcrdv.com', '/taobao/api_call.php',{
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
}