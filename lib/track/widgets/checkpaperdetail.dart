import 'dart:io';

import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/message/widgets/customdivider.dart';
import 'package:cargoshipping/track/widgets/paperlesslistwidget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Checkpaperdetail extends StatefulWidget {
  const Checkpaperdetail({super.key});

  @override
  State<Checkpaperdetail> createState() => _CheckpaperdetailState();
}

class _CheckpaperdetailState extends State<Checkpaperdetail> {
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
                  'assets/icons/waitred.png',
                  height: size.height * 0.04,
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Text(
                  'รอตรวจสอบเอกสาร',
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
              height: size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'วันที่รับเรื่อง',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '10 ก.ย. 2567',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            CustomDivider(
              heightFactor: size.height * 0.0000008,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Row(
                children: [
                  Text(
                    'ชื่อผู้นำเข้า',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: size.width * 0.04,
                  ),
                  Text(
                    'บจก. ABCD',
                    style: TextStyle(
                        fontSize: 13, color: red1, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomDivider(
              heightFactor: size.height * 0.0000008,
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.all(size.height * 0.015),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'เอกสารนำเข้าถูกต้อง',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'SukhumvitSet'),
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
                      onTap: () {},
                      child: Container(
                        height: size.height * 0.25,
                        width: size.width * 0.95,
                        color: Color(0xffd0e9da),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.height * 0.015),
                          child: Column(
                            children: [
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Align(
                                  alignment: Alignment.topRight,
                                  child: Image.asset(
                                    'assets/icons/greencorrect.png',
                                    height: size.height * 0.03,
                                  )),
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
                  SizedBox(
                    height: size.height * 0.025,
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
                      onTap: () {},
                      child: Container(
                        height: size.height * 0.25,
                        width: size.width * 0.95,
                        color: Color(0xffd0e9da),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.height * 0.015),
                          child: Column(
                            children: [
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Align(
                                  alignment: Alignment.topRight,
                                  child: Image.asset(
                                    'assets/icons/greencorrect.png',
                                    height: size.height * 0.03,
                                  )),
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
                  SizedBox(
                    height: size.height * 0.025,
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
                      onTap: () {},
                      child: Container(
                        height: size.height * 0.25,
                        width: size.width * 0.95,
                        color: Color(0xffd0e9da),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.height * 0.015),
                          child: Column(
                            children: [
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Align(
                                  alignment: Alignment.topRight,
                                  child: Image.asset(
                                    'assets/icons/greencorrect.png',
                                    height: size.height * 0.03,
                                  )),
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
                  CustomDivider(
                    heightFactor: size.height * 0.0000005,
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
                                  fontWeight: FontWeight.bold,
                                ),
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
                                fontWeight: FontWeight.w600,
                                fontFamily: 'SukhumvitSet'),
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
                      'ชำระค่าบริการ',
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
