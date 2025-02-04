import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/models/rateShip.dart';
import 'package:cargoshipping/models/serviceTransporter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class RegisterService {
  const RegisterService();

  static Future register({
    required String member_type,
    String? fname,
    String? lname,
    String? phone,
    String? password,
    String? birth_date,
    String? gender,
    String? importer_code,
    String? company_name,
    String? address,
    String? province,
    String? district,
    String? sub_district,
    String? postal_code,
    String? shipping_type,
    String? image,
  }) async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // final domain = prefs.getString('domain');
    var headers = {'Content-Type': 'application/json'};
    final url = Uri.https(publicUrl, '/api/memberr');
    final response = await http.post(
      url,
      headers: headers,
      body: convert.jsonEncode({
        'member_type': member_type,
        'fname': fname,
        'lname': lname,
        'phone': phone,
        'password': password,
        'birth_date': birth_date,
        'gender': gender,
        'importer_code': importer_code,
        'company_name': company_name,
        'address': address,
        'province': province,
        'sub_district': sub_district,
        'postal_code': postal_code,
        'shipping_type': shipping_type,
        'image': image,
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

  static Future<List<RateShip>> getDataRegister({String? type}) async {
    final url = Uri.https(publicUrl, '/api/get_question_master/$type');
    var headers = {'Content-Type': 'application/json'};
    final response = await http.get(
      headers: headers,
      url,
    );
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final list = data['data'] as List;
      return list.map((e) => RateShip.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }
}
