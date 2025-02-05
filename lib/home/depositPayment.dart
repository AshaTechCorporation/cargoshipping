import 'package:cargoshipping/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class DepositPayment extends StatefulWidget {
  const DepositPayment({super.key});

  @override
  State<DepositPayment> createState() => _DepositPaymentState();
}

class _DepositPaymentState extends State<DepositPayment> {
  bool _isExpanded = false; // ควบคุมการเปิด/ปิด Panel
  final TextEditingController amount = TextEditingController();
  final TextEditingController accountNumber = TextEditingController();
  final TextEditingController accountName = TextEditingController();
  final TextEditingController bankName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'บริการฝากชำระค่าสินค้า',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 0.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              Center(
                child: Container(
                  height: size.height * 0.14,
                  width: size.width * 0.92,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    //border: Border.all(width: 0), // เส้นขอบสีดำ หนา 2px
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1, // การกระจายของเงา
                        blurRadius: 3, // ความฟุ้งของเงา
                        offset: Offset(0, 1), // ตำแหน่งเงา (x, y)
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                        child: Column(
                      children: [
                        Text(
                          "รบกวนแจ้งรายละเอียดให้ครบถ้วน เพื่อความรวดเร็วให้การทำธุรกรรมของท่าน",
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          "ฝากโอน ธนาคารจีน (บัญชีส่วนบุคคล) ค่าบริการ รายละ 300 บาท (ฟรีค่าบริการ เมื่อโอนเกิน 30,000 หยวน)",
                          style: TextStyle(fontSize: 15, color: blueText, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Text(
                      "ข้อมูลการทำธุรกรรม",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Material(
                elevation: 3, // ให้เงากับ panel
                borderRadius: BorderRadius.circular(15), // ทำให้ขอบโค้งมน
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15), // ให้ขอบโค้ง
                    //border: Border.all(color: Colors.black, width: 2), // เส้นขอบสีดำ
                  ),
                  child: ExpansionPanelList(
                    elevation: 0, // ปิด elevation ของ ExpansionPanelList เพื่อใช้ของ Material แทน
                    expansionCallback: (int index, bool isExpanded) {
                      setState(() {
                        _isExpanded = isExpanded;
                      });
                    },
                    children: [
                      ExpansionPanel(
                        backgroundColor: Colors.white,
                        headerBuilder: (context, isExpanded) {
                          return ListTile(title: Text("ธุรกรรมที่ทำ"));
                        },
                        body: Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("ไม่ทราบประเภทสินค้า"),
                                ],
                              ),
                              SizedBox(height: size.height * 0.01),
                              Row(
                                children: [
                                  Text("เติม Alipay"),
                                ],
                              ),
                              SizedBox(height: size.height * 0.01),
                              Row(
                                children: [
                                  Text("เติม Wechat pay"),
                                ],
                              ),
                              SizedBox(height: size.height * 0.01),
                            ],
                          ),
                        ),
                        isExpanded: _isExpanded,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Material(
                elevation: 5,
                //borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: size.height * 0.06,
                  child: TextFormField(
                    controller: amount,
                    decoration: InputDecoration(
                      labelText: 'ยอดเงินหยวนที่ต้องการโอน',
                      labelStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 0.3,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอกรหัสผู้นำเข้า';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              SizedBox(height: size.height * 0.02),
              Material(
                elevation: 5,
                //borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: size.height * 0.06,
                  child: TextFormField(
                    controller: accountNumber,
                    decoration: InputDecoration(
                      labelText: 'เลขที่บัญชี',
                      labelStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 0.3,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอกรหัสผู้นำเข้า';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Material(
                elevation: 5,
                //borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: size.height * 0.06,
                  child: TextFormField(
                    controller: accountName,
                    decoration: InputDecoration(
                      labelText: 'ชื่อบัญชี',
                      labelStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 0.3,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอกรหัสผู้นำเข้า';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Material(
                elevation: 5,
                //borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: size.height * 0.06,
                  child: TextFormField(
                    controller: bankName,
                    decoration: InputDecoration(
                      labelText: 'ชื่อธนาคาร',
                      labelStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 0.3,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอกรหัสผู้นำเข้า';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                children: [
                  Text(
                    'อัปโหลดรูปภาพช่องทางการชำระเงิน',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'รองรับไฟล์รูปถ่าย JPG, PNG, PDF เท่านั้น',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              Center(
                child: DottedBorder(
                  color: Colors.grey, // สีของเส้นปะ
                  strokeWidth: 2, // ความหนาของเส้น
                  dashPattern: [8, 8], // ความยาวเส้นปะ [เส้น 6, ช่องว่าง 4]
                  borderType: BorderType.RRect, // ใช้ขอบโค้งมน
                  radius: Radius.circular(10), // กำหนดมุมโค้งมน
                  child: Container(
                    width: size.width * 0.92,
                    height: size.height * 0.18,
                    alignment: Alignment.center,
                    child: Text("เพิ่มรูป"),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Row(
                children: [
                  Text(
                    'กรุณาระบุหรือแนบช่องทางการชำระเงินของท่าน',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: red1),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.04),
              Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: size.height * 0.18,
                  width: size.width * 0.92,
                  //color: Colors.amber,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20), // ขอบมนเฉพาะด้านบนซ้าย
                      topRight: Radius.circular(20), // ขอบมนเฉพาะด้านบนขวา
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.03, vertical: size.height * 0.02),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ยอดเงินที่ต้องการโอน (หยวน)',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '¥488',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Text(
                          'อัตราแลกเปลี่ยน ณ วันที่ 00 ส.ค. 00 (00:00:00) 4.8851 หยวน จีนต่อบาทไทย',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: blueText),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ค้าธรรมเนียม',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '¥488',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ยอดเงินรวม (บาท)',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '¥488',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: size.height * 0.06,
                width: size.width * 0.92,
                //color: Colors.red,
                decoration: BoxDecoration(
                  color: Colors.red, // พื้นหลังสีน้ำเงิน
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20), // ขอบมนเฉพาะด้านบนซ้าย
                    bottomRight: Radius.circular(20), // ขอบมนเฉพาะด้านบนขวา
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03, vertical: size.height * 0.015),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'ช่องทางการชำระเงิน',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
                          ),
                          Icon(Icons.forward, color: Colors.white,),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}
