import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/message/widgets/AboutQuestionWidget.dart';
import 'package:cargoshipping/message/widgets/promotionpage.dart';
import 'package:cargoshipping/message/widgets/question.dart';
import 'package:cargoshipping/widgets/PictureSliderWidget.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อความ'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text('ข่าวสารทั้งหมด')],
            ),
            //แสดงภาพสไลด์
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Promotionpage(),
                    ),
                  );
                },
                child: PictureSliderWidget(size: size)),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                  aboutQuestion.length,
                  (index) => AboutQuestionWidget(
                        size: size,
                        title: aboutQuestion[index],
                        press: () {
                          if (index == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Question(),
                              ),
                            );
                          }
                        },
                      )),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.02, horizontal: size.width * 0.01),
              child: Row(
                children: [
                  Text(
                    'ติดต่อเรา',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/icons/Frame 61.png',
                    width: 18,
                    height: 20,
                  ),
                  SizedBox(width: 8.0), // ระยะห่างระหว่างรูปภาพกับกล่องสีเทา
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red[200],
                        ),
                        width: 220, // กำหนดความกว้างของกล่อง
                        height: 60, // กำหนดความสูงของกล่อง
                        child: Center(
                          // จัดตำแหน่งข้อความให้อยู่กลางกล่อง
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            child: Text(
                              'สวัสดีครับ (username)TEG Cargo ยินดีให้บริการครับ',
                              style: TextStyle(
                                color: Colors.black, // กำหนดสีของข้อความ
                                fontSize: 13, // ขนาดของข้อความ
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0), // ระยะห่างระหว่างกล่อง
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red[200],
                        ),
                        width: 200, // กำหนดความกว้างของกล่อง
                        height: 70, // กำหนดความสูงของกล่อง
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 7,
                              right: 7,
                              top: 7), // เพิ่ม padding ด้านบน
                          child: Text(
                            'ท่านสามารถเลือกคำถามจากปุ่มตัวเลือก หรือพิมพ์คำถามในช่องแชทได้เลยครับ',
                            style: TextStyle(
                              color: Colors.black, // กำหนดสีของข้อความ
                              fontSize: 13, // ขนาดของข้อความ
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end, // จัดตำแหน่งไปที่ขวา
                children: [
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.end, // จัดตำแหน่งให้ถูกต้องในแนวตั้ง
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                        ),
                        width: 200,
                        height: 50,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 7, right: 7, top: 7),
                          child: Text(
                            'การรับส่งของแต่ละครั้งมีจำนวนขั้นต่ำไหม',
                            style: TextStyle(
                              color: Colors.black, // กำหนดสีของข้อความ
                              fontSize: 13, // ขนาดของข้อความ
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                        ),
                        width: 200,
                        height: 50,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 7, right: 7, top: 7),
                          child: Text(
                            'ต้องการทราบราคาค่าขนส่งสินค้า ทั้งทาง รถ และทางเรือ',
                            style: TextStyle(
                              color: Colors.black, // กำหนดสีของข้อความ
                              fontSize: 13, // ขนาดของข้อความ
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                        ),
                        width: 200,
                        height: 50,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 7, right: 7, top: 7),
                          child: Text(
                            'วิธีการคิดค่าขนส่งจากราคาที่คิดเป็น CBM',
                            style: TextStyle(
                              color: Colors.black, // กำหนดสีของข้อความ
                              fontSize: 13, // ขนาดของข้อความ
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 65,
        child: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/icons/plus.png',
                  width: 30,
                  height: 30,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'พิมข้อความเพื่อพูดคุย',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/icons/vecterup.png',
                  width: 30,
                  height: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
