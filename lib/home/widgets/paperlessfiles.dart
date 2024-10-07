import 'dart:io';

import 'package:cargoshipping/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class Paperlessfiles extends StatefulWidget {
  const Paperlessfiles({super.key});

  @override
  State<Paperlessfiles> createState() => _PaperlessfilesState();
}

class _PaperlessfilesState extends State<Paperlessfiles> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'ขึ้นทะเบียนผู้นำเข้า(Paperless)',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: backgroundColor,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 0.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'อัปโหลดรูปภาพบัตรประชาชนผู้มีอำนาจ / ผู้รับมอบอำนาจ',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'รองรับไฟล์รูปถ่าย JPG, PNG เท่านั้น',
                  style: TextStyle(
                      fontSize: 13,
                      color: headingtext,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.005,
            ),
            Container(
              height: size.height * 0.25,
              width: size.width * 0.95,
              decoration: BoxDecoration(color: Colors.white),
              child: GestureDetector(
                onTap: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    type: FileType.custom, // ใช้ประเภท custom
                    allowedExtensions: [
                      'jpg',
                      'png'
                    ], // ระบุเฉพาะไฟล์ jpg และ png
                  );

                  if (result != null) {
                    File file = File(result.files.single.path!);
                    // ทำงานกับไฟล์ที่เลือก
                  } else {
                    // User canceled the picker
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/idcard.png',
                      height: size.height * 0.17,
                      width: size.width * 0.6,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'กรุณาไม่ขีดคร่อม ระบบจะเขียนคร่อมให้ท่านอัตโนมัติ',
                  style: TextStyle(
                      fontSize: 13, color: red1, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'อัปโหลดหนังสือรับรองบริษัท',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'รองรับไฟล์รูปถ่าย JPG, PNG เท่านั้น',
                  style: TextStyle(
                      fontSize: 13,
                      color: headingtext,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.005,
            ),
            GestureDetector(
              onTap: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom, // ใช้ประเภท custom
                  allowedExtensions: [
                    'jpg',
                    'png'
                  ], // ระบุเฉพาะไฟล์ jpg และ png
                );

                if (result != null) {
                  File file = File(result.files.single.path!);
                  // ทำงานกับไฟล์ที่เลือก
                } else {
                  // User canceled the picker
                }
              },
              child: Container(
                  height: size.height * 0.25,
                  width: size.width * 0.95,
                  decoration: BoxDecoration(color: white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/certificate.png',
                        height: size.height * 0.17,
                        width: size.width * 0.6,
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'เอกสารต้องยังไม่หมดอายุ และเซ็นต์สำเนาถูกต้อง ',
                  style: TextStyle(
                      fontSize: 13, color: red1, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'อัปโหลดภพ.20',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'รองรับไฟล์รูปถ่าย JPG, PNG เท่านั้น',
                  style: TextStyle(
                      fontSize: 13,
                      color: headingtext,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.005,
            ),
            GestureDetector(
              onTap: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom, // ใช้ประเภท custom
                  allowedExtensions: [
                    'jpg',
                    'png'
                  ], // ระบุเฉพาะไฟล์ jpg และ png
                );

                if (result != null) {
                  File file = File(result.files.single.path!);
                  // ทำงานกับไฟล์ที่เลือก
                } else {
                  // User canceled the picker
                }
              },
              child: Container(
                  height: size.height * 0.25,
                  width: size.width * 0.95,
                  decoration: BoxDecoration(color: white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/card20.png',
                        height: size.height * 0.17,
                        width: size.width * 0.6,
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'อัปโหลดภพ.20',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'รองรับไฟล์รูปถ่าย JPG, PNG เท่านั้น',
                  style: TextStyle(
                      fontSize: 13,
                      color: headingtext,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.005,
            ),
            GestureDetector(
              onTap: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom, // ใช้ประเภท custom
                  allowedExtensions: [
                    'jpg',
                    'png'
                  ], // ระบุเฉพาะไฟล์ jpg และ png
                );

                if (result != null) {
                  File file = File(result.files.single.path!);
                  // ทำงานกับไฟล์ที่เลือก
                } else {
                  // User canceled the picker
                }
              },
              child: Container(
                  height: size.height * 0.25,
                  width: size.width * 0.95,
                  decoration: BoxDecoration(color: white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/upseal.png',
                        height: size.height * 0.17,
                        width: size.width * 0.6,
                      ),
                    ],
                  )),
            ),
            Container(
              padding: EdgeInsets.all(size.height * 0.02),
              width: size.width,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // จัดให้ข้อความอยู่ชิดซ้าย
                children: [
                  Text(
                    'ค่าใช้จ่ายในการขึ้นทะเบียน',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xff004aad), // สีข้อความเป็นสีน้ำเงิน
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ค่าขึ้นทะเบียนใหม่',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '3,000 บาท',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Container(
                    height: size.height * 0.04,
                    padding: EdgeInsets.all(size.height * 0.01),
                    decoration: BoxDecoration(
                      color: Colors.pink[100], // พื้นหลังสีชมพู
                      borderRadius: BorderRadius.circular(8), // ขอบมน
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'รวมยอดชำระค่าบริการในการขึ้นทะเบียน',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '3,000 บาท',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: red1, // เปลี่ยนสีปุ่มเป็นสีแดง
                        minimumSize: Size(size.width * 0.9, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      'ชำระเงิน',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold, // ตัวหนา
                        color: Colors.white, // สีตัวอักษรเป็นสีขาว
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: size.height * 0.085,
        child: BottomAppBar(
          color: white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: size.height * 0.07,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: arrowcolor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'ยืนยันข้อมูลผู้นำเข้า',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
