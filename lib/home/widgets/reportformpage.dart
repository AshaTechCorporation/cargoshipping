import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class ReportFormPage extends StatefulWidget {
  const ReportFormPage({super.key});

  @override
  _ReportFormPageState createState() => _ReportFormPageState();
}

class _ReportFormPageState extends State<ReportFormPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedIssue;
  final _titleController = TextEditingController();
  final _detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: Text(
          'แบบฟอร์มแจ้งปัญหา',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Card(
                color: white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'ปัญหาด้าน X',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.015),
                        DropdownButtonFormField<String>(
                          icon: Icon(Icons.keyboard_arrow_down),
                          decoration: InputDecoration(
                            isDense:
                                true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 12.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          hint: Text(
                            'เลือกปัญหาที่พบในด้านนี้',
                            style: TextStyle(
                                fontSize: 14),
                          ),
                          value: _selectedIssue,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedIssue = newValue;
                            });
                          },
                          items: <String>[
                            'ปัญหาที่ 1',
                            'ปัญหาที่ 2',
                            'ปัญหาที่ 3'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                    fontSize:
                                        14), // ปรับขนาดฟอนต์ของตัวเลือกให้เล็กลง
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(height: size.height * 0.02),
                        TextFormField(
                          controller: _titleController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 12.0),
                            hintText: '... กรอกหัวข้อเรื่อง',
                            hintStyle: TextStyle(
                                fontSize:
                                    14),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          style: TextStyle(
                              fontSize:
                                  14),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'กรุณากรอกหัวข้อเรื่อง';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: size.height * 0.02),
                        TextFormField(
                          controller: _detailsController,
                          maxLines: 4,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: '... กรอกรายละเอียด',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'กรุณากรอกรายละเอียด';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: size.height * 0.015),
                        Row(
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  'รูปภาพประกอบ',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // เพิ่มฟังก์ชันการอัปโหลดรูปภาพ
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: Text('อัพโหลดไฟล์รูป',style: TextStyle(
                                color: greyuserinfo
                              ),),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.02),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // ฟังก์ชันการแจ้งปัญหา
                              print('ปัญหาได้รับการแจ้ง');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: red1,
                            padding: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: size.width * 0.05,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Text(
                            'แจ้งปัญหา',
                            style: TextStyle(
                                color: white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
