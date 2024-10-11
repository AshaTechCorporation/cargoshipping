import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Alipayservice extends StatelessWidget {
  const Alipayservice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(
          'บริการโอนชำระสินค้า',
          style: TextStyle(
              fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
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
          crossAxisAlignment:
              CrossAxisAlignment.start, // จัดข้อความและวิดเจ็ตภายในให้ชิดซ้าย
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // ขอบมน
              ),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(10.0), // ขอบมนให้เหมือนกับ Container
                child: Image.asset(
                  'assets/images/alipayservice.png',
                  fit: BoxFit.cover, // ให้ภาพครอบคลุมพื้นที่ทั้งหมด
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0, left: 8.0),
              child: Text(
                'บริการโอนชำระสินค้า',
                style: TextStyle(
                  fontSize: 20,
                  color: red1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0, left: 8.0),
              child: Text(
                'บริการฝากโอนมี 2 รูปแบบ',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 5.0),
              child: Text(
                '1. โอนเข้าธนาคาร',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '2. เติมเข้า Wallet',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 13.0, left: 8.0),
              child: Text(
                'การเติมเข้า Wellet จะมีระบบ Alipay และ Wechatpay  การโอนชำระทั้ง 2 วิธีนี้ ลูกค้าไม่จำเป็นต้องสั่งซื้อสินค้าผ่านทาง แอดมินหรือระบบของบริษัทฯ ',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3.0, left: 8.0),
              child: Text(
                'แต่จำเป็นจะต้องใช้บริการขนส่งของทางบริษัทฯเท่านั้นโดยการโอนเงินนั้น อ้างอิง อัตราค่าแลกเงิน ตามเรทรายวัน โดยเรท จะออกทุกวันเวลา 11.00 เป็นต้นไป',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, left: 8.0),
              child: Text(
                '**ก่อนทำการรับยอดโอนจำเป็นต้องเช็คยอดโอนกับทางผู้บริหารก่อนทุกครั้ง **',
                style: TextStyle(
                  fontSize: 13,
                  color: red1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, left: 8.0),
              child: Text(
                'ข้อมูลการโอนชำระ  ',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2.0, left: 8.0),
              child: Text(
                'ธนาคารกสิกรไทย  เลขที่ 110-3-83617-0   ',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.0, left: 8.0),
              child: Text(
                'บริษัท แปดหนึ่งหกแปด เทรดดิ้ง จำกัด',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, left: 8.0),
              child: Text(
                'ค่าธรรมเนียม :  ',
                style: TextStyle(
                  fontSize: 13,
                  color: red1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3.0, left: 8.0),
              child: Text(
                'โดยค่าบริการส่วนนี้จะอยู่ที่ รายการละ 300 บาท ',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: size.height * 0.08,
        child: BottomAppBar(
          color: white,
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  Future.delayed(Duration(seconds: 2), () {
                    Navigator.of(context).pop(); // ปิด dialog หลังจาก 2 วินาที
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
                  border: Border.all(width: size.width * 0.003, color: red1)),
              child: Center(
                child: Text(
                  'สนใจใช้บริการนี้',
                  style: TextStyle(
                    color: white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
