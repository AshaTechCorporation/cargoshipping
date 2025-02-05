import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/models/rateShip.dart';
import 'package:cargoshipping/models/serviceTransporter.dart';
import 'package:cargoshipping/models/serviceTransporterById.dart';
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
    String? referrer,
    String? live_address,
    String? live_province,
    String? live_district,
    String? live_sub_district,
    String? live_postal_code,
    String? address,
    String? province,
    String? district,
    String? sub_district,
    String? postal_code,
    double? latitude,
    double? longitude,
    int? transport_thai_master_id,
    String? ever_imported_from_china,
    String? order_quantity,
    String? frequent_importer,
    String? need_transport_type,
    String? additional_requests,
    String? image,
  }) async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // final domain = prefs.getString('domain');
    var headers = {'Content-Type': 'application/json'};
    final url = Uri.https(publicUrl, '/api/member');
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
        'referrer': referrer,
        'live_address': live_address,
        'live_province': live_province,
        'live_district': live_district,
        'live_sub_district': live_sub_district,
        'live_postal_code': live_postal_code,
        'address': address,
        'province': province,
        'district': district,
        'sub_district': sub_district,
        'postal_code': postal_code,
        'latitude': latitude,
        'longitude': longitude,
        'transport_thai_master_id': transport_thai_master_id,
        'ever_imported_from_china': ever_imported_from_china,
        'order_quantity': order_quantity,
        'frequent_importer': frequent_importer,
        'need_transport_type': need_transport_type,
        'additional_requests': additional_requests,
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

  static Future<List<ServiceTransporterById>> getTransport() async {
    final url = Uri.https(publicUrl, '/api/get_transport');
    var headers = {'Content-Type': 'application/json'};
    final response = await http.get(
      headers: headers,
      url,
    );
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final list = data['data'] as List;
      return list.map((e) => ServiceTransporterById.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }
}
