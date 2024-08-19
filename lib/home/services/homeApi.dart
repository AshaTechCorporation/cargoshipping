import 'package:cargoshipping/models/categories.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HomeApi {
  const HomeApi();

  //เรียกดูข้อมูล Category
  static Future<List<Categories>> getCategories() async {
    final url = Uri.https('api.atphosting24.com', '/category/api.php',{"folder": 'taobao'});
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

}