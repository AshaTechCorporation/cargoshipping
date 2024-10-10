import 'dart:io';

import 'package:cargoshipping/cart/widget/customcheck.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/widgets/CardImportProductWidget.dart';
import 'package:cargoshipping/message/widgets/customdivider.dart';
import 'package:cargoshipping/track/widgets/paperlesslistwidget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Detailpaper extends StatefulWidget {
  const Detailpaper({super.key});

  @override
  State<Detailpaper> createState() => _DetailpaperState();
}

class _DetailpaperState extends State<Detailpaper> {
  String? selectedValue;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text('นำเข้าถูกต้อง'),
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
              height: size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/detailimport.png',
                  height: size.height * 0.04,
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Text(
                  'นำเข้าเอกสาร',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Center(
              child: Container(
                height: size.height * 0.053,
                width: size.width * 0.94,
                decoration: BoxDecoration(
                    color: red1, borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.06),
                      child: Text(
                        'Custom no. A99999',
                        style: TextStyle(
                            fontSize: 16,
                            color: white,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'สถานะ:   ',
                      style: TextStyle(
                          color: greyuserinfo,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SukhumvitSet'),
                      children: const <TextSpan>[
                        TextSpan(
                            text: 'xxxxx',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: 'SukhumvitSet')),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    'เข้าโกดังเมื่อ 00 ส.ค. 67',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff004AAD)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            paperlesslistwidget(size: size),
            SizedBox(
              height: size.height * 0.07,
              width: size.width * 0.9,
              // color: red1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'ชื่อผู้นำเข้า',
                    style: TextStyle(
                      fontSize: 13.5,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.035,
                    width: size.width * 0.62,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                      hint: Text(
                        'เลือกชื่อบริษัทนิติบุคคล',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      icon: Icon(Icons.keyboard_arrow_down),
                      iconSize: 20,
                      elevation: 16,
                      style: TextStyle(color: Colors.black),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue;
                        });
                      },
                      items: <String>[
                        'บริษัท A',
                        'บริษัท B',
                        'บริษัท C',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/icons/checktook.png'),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Text(
                  'ขึ้นทะเบียน Paperless แล้ว',
                  style: TextStyle(
                      fontSize: 12, color: red1, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(size.height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'จัดส่งเอกสารเพื่อนำเข้าถูกต้อง',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'อัปโหลดไฟล์ Invoice',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'รองรับไฟล์รูปถ่าย JPG, PNG เท่านั้น',
                      style: TextStyle(
                          fontSize: 13,
                          color: headingtext,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  DottedBorder(
                    color: Color(0xff00ac47),
                    strokeWidth: 1.5,
                    dashPattern: [6, 10],
                    borderType: BorderType.RRect,
                    radius: Radius.circular(12),
                    child: GestureDetector(
                      onTap: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(
                          type: FileType.custom, // ใช้ประเภท custom
                          allowedExtensions: [
                            'jpg',
                            'png',
                            'pdf'
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
                        color: white,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/invoiceimages.png',
                                height: size.height * 0.17,
                                width: size.width * 0.6,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // การทำงานเมื่อลิงก์ถูกกด
                        print('ดูไฟล์ตัวอย่าง Invoice');
                      },
                      child: Text(
                        'ดูไฟล์ตัวอย่าง',
                        style: TextStyle(
                          color: Color(0xff004AAD),
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'อัปโหลดไฟล์ Packing list',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'รองรับไฟล์รูปถ่าย JPG, PNG, PDF เท่านั้น',
                      style: TextStyle(
                          fontSize: 13,
                          color: headingtext,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  DottedBorder(
                    color: Color(0xff00ac47),
                    strokeWidth: 1.5,
                    dashPattern: [6, 10],
                    borderType: BorderType.RRect,
                    radius: Radius.circular(12),
                    child: GestureDetector(
                      onTap: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(
                          type: FileType.custom, // ใช้ประเภท custom
                          allowedExtensions: [
                            'jpg',
                            'png',
                            'pdf'
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
                        color: white,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/pakinglistimg.png',
                                height: size.height * 0.17,
                                width: size.width * 0.6,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // การทำงานเมื่อลิงก์ถูกกด
                        print('ดูไฟล์ตัวอย่าง Invoice');
                      },
                      child: Text(
                        'ดูไฟล์ตัวอย่าง',
                        style: TextStyle(
                          color: Color(0xff004AAD),
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'อื่นๆ เช่น ใบอนุญาต',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'รองรับไฟล์รูปถ่าย JPG, PNG, PDF เท่านั้น',
                      style: TextStyle(
                          fontSize: 13,
                          color: headingtext,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  DottedBorder(
                    color: Color(0xff00ac47),
                    strokeWidth: 1.5,
                    dashPattern: [6, 10],
                    borderType: BorderType.RRect,
                    radius: Radius.circular(12),
                    child: GestureDetector(
                      onTap: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(
                          type: FileType.custom, // ใช้ประเภท custom
                          allowedExtensions: [
                            'jpg',
                            'png',
                            'pdf'
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
                        color: white,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/moreupload.png',
                                height: size.height * 0.17,
                                width: size.width * 0.6,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Text(
                    'ค่าบริการในการดำเนินการ',
                    style: TextStyle(
                        fontSize: 15, color: red1, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    'ค่าบริการส่วนที่1: ชำระก่อนเริ่มจัดทำ',
                    style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff004aad),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Text(
                        '1. ค่าธรรมเนียมศุลกากร',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        '3,000 บาท',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Row(
                    children: [
                      CustomCheckbox(
                        value: isChecked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            isChecked = newValue!;
                          });
                        },
                      ),
                      Text(
                        '  ทำ FORM E',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        '2,000 บาท',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'ค่าบริการส่วนที่2: ชำระเมื่อได้รับฉบับร่าง',
                    style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff004aad),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Text(
                        '3. ค่าภาษีมูลค่าเพิ่ม',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        '0 บาท',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.007,
                  ),
                  Row(
                    children: [
                      Text(
                        '4. ค่าอากรค่าเข้า',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        '0 บาท',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.007,
                  ),
                  Row(
                    children: [
                      Text(
                        '5. ค่าธรรมเนียมลงทะเบียน',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        '0 บาท',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    height: size.height * 0.035,
                    width: size.width * 0.95,
                    decoration: BoxDecoration(
                        color: Color(0xfffff0f0),
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'รวมค่าใช้จ่ายค่าบริการในการดำเนินการทั้งหมด',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '5,000 บาท',
                            style: TextStyle(
                                fontSize: 13,
                                color: red1,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    width: size.width * 0.9,
                    height: size.height * 0.2,
                    decoration: BoxDecoration(
                        color: background,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: EdgeInsets.all(size.height * 0.02),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/icons/alertwarn.png',
                                height: size.height * 0.02,
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              Text(
                                'หมายเหตุ',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            ': ค่าภาษีมูลค่าเพิ่ม และค่าอากรค่าเข้าจะแจ้งให้ท่านทราบเพื่อ ยืนยันยอดชำระอีกครั้งในภายหลังจัดทำเอกสารตามไฟล์แนบ ทั้ง 2 ฉบับด้านบนเรียบร้อยแล้ว',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            ': ระยะเวลาดำเนินการ 10-20 วัน ยังไม่รวมระยะเวลาขึ้นทะเบียน Paperless',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: size.height * 0.095,
        child: BottomAppBar(
          color: white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.of(context)
                            .pop(); // ปิด dialog หลังจาก 2 วินาที
                      });
                      return AlertDialog(
                        title: Text('เปิดบิล'),
                        content: Text('เปิดบิลเสร็จสิ้น'),
                      );
                    },
                  );
                },
                child: Container(
                  height: size.height * 0.06,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: red1,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'นำเข้าเอกสาร',
                      style: TextStyle(
                          color: white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SukhumvitSet'),
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
