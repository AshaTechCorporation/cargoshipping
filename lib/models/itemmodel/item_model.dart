
import 'package:objectbox/objectbox.dart';

@Entity()
class JsonData {
  int id = 0; // ต้องมี id สำหรับ ObjectBox
  String type;
  String categoryName;
  List<String> jsonList;
  List<String> jsonProduct;

  JsonData({required this.jsonList, required this.categoryName, required this.type, required this.jsonProduct});
}