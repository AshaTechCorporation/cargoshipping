
import 'package:objectbox/objectbox.dart';

@Entity()
class JsonData {
  int id = 0; // ต้องมี id สำหรับ ObjectBox
  String json;

  JsonData({required this.json});
}