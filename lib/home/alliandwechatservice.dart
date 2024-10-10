import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Alliandwechatservice extends StatelessWidget {
  const Alliandwechatservice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(
          'บริการเติม Alipay, Wechat ',
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
                  'assets/images/alipayandwechat.png',
                  fit: BoxFit.cover, // ให้ภาพครอบคลุมพื้นที่ทั้งหมด
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0, left: 8.0),
              child: Text(
                'บริการเติม Alipay, Wechat ',
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
                'บริการโอนเงินไปจีน/ฝากจ่ายค่าสินค้า เติมเงิน Alipay, Wechat ค่าธรรมเนียม 50 บาท/บิล โอนเงินไปจีน-เติมเงิน Alipay โดยขั้นอยู่อัตราแลกเปลี่ยน ณ ปัจจุบัน ',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0, left: 8.0),
              child: Text(
                'ขั้นตอนการเติมเงิน ',
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
                '1. โอนเงินไปจีน',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '2. ชำระค่าสินค้าเว็บออนไลน์',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '3. เติมเงิน Alipay',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '4. เติมเงิน Wechat',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 13.0),
              child: Text(
                'หมายเหตุ : ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 8.0, top: 5.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'ตั้งแต่วันนี้เป็นต้นไป ลูกค้าที่ทำธุรกรรม โอนเงินไปจีน จำนวนมากกว่า 20,000 บาทขึ้นไป ต้องทำการลงทะเบียนด้วยบัตรประชาชน หรือ Passport บริษัท Thai Express Global Cargo Co.,Ltd มีความจำเป็นต้องปฏิบัติตาม พ.ร.บ. ป้องกันและปราบปรามการฟอกเงิน พ.ศ.2542 ',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text:
                            '(ทางบริษัทฯ ขอสงวนสิทธิ์ในการให้บริการนี้กับลูกค้าที่ใช้บริการขนส่งกับทางบริษัทฯ เท่านั้น)',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: red1,
                        ),
                      ),
                    ],
                  ),
                )),
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
