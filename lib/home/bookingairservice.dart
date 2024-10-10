import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Bookingairservice extends StatelessWidget {
  const Bookingairservice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(
          'บริการจองตั๋วเครื่องบิน',
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
                  'assets/images/airplanebook.png',
                  fit: BoxFit.cover, // ให้ภาพครอบคลุมพื้นที่ทั้งหมด
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0, left: 8.0),
              child: Text(
                'บริการจองตั๋วเครื่องบิน',
                style: TextStyle(
                  fontSize: 20,
                  color: red1,
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
                  border:
                      Border.all(width: size.width * 0.003, color: red1)),
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
