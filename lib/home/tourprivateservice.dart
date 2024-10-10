import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Tourprivateservice extends StatelessWidget {
  const Tourprivateservice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(
          'บริการทัวร์ส่วนตัว',
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
                  'assets/images/tourprivateservice.png',
                  fit: BoxFit.cover, // ให้ภาพครอบคลุมพื้นที่ทั้งหมด
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0, left: 8.0),
              child: Text(
                'บริการทัวร์ส่วนตัว',
                style: TextStyle(
                  fontSize: 20,
                  color: red1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 13.0),
              child: Text(
                'บริการทัวร์แบบไกด์ 1:1 กลุ่ม เส้นทาง การเดินทาง หรือ เยี่ยมตลาด หรืองาน EXPO เฉพาะกลุ่ม ลูกค้าสามารถเลือกจัดการทุกอย่างได้ ด้วยตนเอง ไม่ว่าจะเป็น เวลาเครื่องบิน การอัพเกรดตั๋วเครื่องบินรูปแบบการเดินทาง ที่พัก รวมถึงไกด์/ล่ามส่วนตัว การเดินทางทัวร์ ส่วนตัวนี้ มักจะเดินทางไปเพื่อดูหรือเยี่ยมชมโรงงานหาซัพพลายเออร์ เจ้าใหม่เข้างาน EXPO ประจำเมือง การออกแบบการเดินทางจะ ออกแบบโดยคำนึงถึงโจทย์และความต้องการของลูกค้าเป็นหลักทุกทริปของลูกค้าตีราคาการเดินทางจากข้อมูลที่ต้องการไปแบบหนึ่งต่อหนึ่ง',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 15.0),
              child: Text(
                'ข้อมูลทัวร์เพื่อคำนวณราคา',
                style: TextStyle(
                    color: red1, fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 5.0),
              child: Text(
                '1. วันที่เดินทางไป',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '2. วันที่เดินทางกลับ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '3. งานที่ต้องการเข้าชม หรือประเภทสินค้า หรือ ชื่อตลาด',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '4. จำนวนผู้สนใจเดินทาง',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '5. เมืองที่ต้องการไป',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '6. ต้องการไกด์หรือไม่',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '7. ต้องการตั๋วเครื่องบินหรือไม่ (หากต้องการที่นั่งBUSINESS โปรดแจ้ง)',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '8. ต้องการโรงแรมหรือไม่',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '9. ต้องการรถรับส่งสนามบินหรือไม่',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '10. ต้องการรถยนต์โดยสารระหว่างการเดินทางหรือไม่',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '11. มีประสงค์อื่นๆ อีกหรือไม่',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
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
