import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/message/widgets/customdivider.dart';
import 'package:cargoshipping/track/widgets/paperlesslistwidget.dart';
import 'package:flutter/material.dart';

class Texpaymentdetail extends StatefulWidget {
  const Texpaymentdetail({super.key});

  @override
  State<Texpaymentdetail> createState() => _TexpaymentdetailState();
}

class _TexpaymentdetailState extends State<Texpaymentdetail> {
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
                  'assets/icons/coinred.png',
                  height: size.height * 0.04,
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Text(
                  'รอชำระค่าภาษี',
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
                          color: greyuserinfo, fontWeight: FontWeight.bold,fontFamily: 'SukhumvitSet'),
                      children: const <TextSpan>[
                        TextSpan(
                            text: 'xxxxx',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,fontFamily: 'SukhumvitSet')),
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
              padding:EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('วันที่รับเรื่อง',style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),),
                  Text('10 ก.ย. 2567',style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),)
                ],
              ),
            ),
             SizedBox(
              height: size.height * 0.01,
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('วันที่ส่งฉบับร่าง',style: TextStyle(
                    fontSize: 13,
                    color: Color(0xff004aad),
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(width: size.width * 0.04,),
                  Text('15 ก.ย. 2567',style: TextStyle(
                    fontSize: 13,
                    color: Color(0xff004aad),
                    fontWeight: FontWeight.bold
                  ),)
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
              height: size.height * 0.02,
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Row(
                children: [
                  Text('ชื่อผู้นำเข้า',style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(width: size.width * 0.04,),
                  Text('บจก. ABCD',style: TextStyle(
                    fontSize: 13,
                    color: red1,
                    fontWeight: FontWeight.bold
                  ),)
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
                      fontFamily: 'SukhumvitSet'
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text('1. Invoice',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                      Container(
                        height: size.height * 0.034,
                        width: size.width * 0.35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'แสดงเอกสาร Invoice',
                            style: TextStyle(
                                fontSize: 12,
                                color: greyuserinfo,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text('2. Packing list',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                      Container(
                        height: size.height * 0.034,
                        width: size.width * 0.35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'แสดงเอกสาร Packing list',
                            style: TextStyle(
                                fontSize: 12,
                                color: greyuserinfo,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Center(
                    child: Container(
                      height: size.height * 0.035,
                      width:  size.width * 0.4,
                      decoration: BoxDecoration(
                        color: red1,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Center(
                        child: Text('ตรวจสอบใบขนฉบับร่าง',style: TextStyle(
                          fontSize: 12,color: white,fontWeight: FontWeight.w600
                        ),),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  CustomDivider(
                    heightFactor: size.height * 0.0000005,
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: size.height * 0.08,
        child: BottomAppBar(
          color: white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  // เมื่อปุ่มถูกคลิก
                  // print("ปุ่มส่งรายการสั่งซื้อถูกคลิก");

                  // แสดง dialog
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
                  width: size.width * 0.42,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      width: size.width * 0.003,
                      color: red1
                    )
                  ),
                  child: Center(
                    child: Text(
                      'แก้ไขข้อมูลฉบับร่าง',
                      style: TextStyle(
                        color: red1,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: size.width * 0.004,
                height: size.height * 0.1,
                color: greymess,
              ),
              GestureDetector(
                onTap: () {
                  // เมื่อปุ่มถูกคลิก
                  // print("ปุ่มส่งรายการสั่งซื้อถูกคลิก");

                  // แสดง dialog
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
                  width: size.width * 0.42,
                  decoration: BoxDecoration(
                    color: red1,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'ชำระค่าใช้จ่าย',
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


