import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class UoloadService {
  static uploadImage(XFile file) async {
    var formData = FormData.fromMap(
      {'image': await MultipartFile.fromFile(file.path, filename: file.name), 'path':'images/asset/'},
    );

    final res = await Dio().post('https://cargo-api.dev-asha9.com/api/upload_images',
        data: formData, options: Options(headers: {'Content-Type': 'multipart/form-data; boundary=<calculated when request is sent>'}));

    if (res.statusCode == 200 || res.statusCode == 201) {
      return res.data['data'];
    } else {
      throw Exception('อัพโหดลไฟล์ล้มเหลว');
    }
  }
}





class UploadResponse {
  UploadResponse({
    required this.fieldname,
    required this.originalname,
    required this.encoding,
    required this.mimetype,
    required this.destination,
    required this.filename,
    required this.path,
    required this.size,
    required this.id,
    required this.photo_test,
    required this.photo_test_url
  });
  late final String fieldname;
  late final String originalname;
  late final String encoding;
  late final String mimetype;
  late final String destination;
  late final String filename;
  late final String path;
  late final int size;
  late final int id;
  late final String photo_test;
  late final String photo_test_url;

  UploadResponse.fromJson(Map<String, dynamic> json) {
    fieldname = json['fieldname'];
    originalname = json['originalname'];
    encoding = json['encoding'];
    mimetype = json['mimetype'];
    destination = json['destination'];
    filename = json['filename'];
    path = json['path'];
    size = json['size'];
    id = json['id'];
    photo_test = json['photo_test'];
    photo_test_url = json['photo_test_url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['fieldname'] = fieldname;
    data['originalname'] = originalname;
    data['encoding'] = encoding;
    data['mimetype'] = mimetype;
    data['destination'] = destination;
    data['filename'] = filename;
    data['path'] = path;
    data['size'] = size;
    data['id'] = id;
    data['photo_test'] = photo_test;
    data['photo_test_url'] = photo_test_url;
    return data;
  }
}
