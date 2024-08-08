import 'dart:ui';

import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/message/widgets/AboutQuestionWidget.dart';
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
            PictureSliderWidget(size: size),
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
                        press: () {},
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
                  Icon(Icons.abc),
                  SizedBox(width: 8.0), // ระยะห่างระหว่างรูปภาพกับกล่องสีเทา
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey),
                        width: 200, // กำหนดความกว้างของกล่อง
                        height: 30, // กำหนดสีของกล่อง
                      ),
                      SizedBox(height: 8.0), // ระยะห่างระหว่างกล่อง
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey),
                        width: 200, // กำหนดความกว้างของกล่อง
                        height: 100,
                      ),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey),
                    width: 200, // กำหนดความกว้างของกล่อง
                    height: 30, // กำหนดสีของกล่อง
                  ),
                  SizedBox(height: 5.0), // ระยะห่างระหว่างกล่อง
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey),
                    width: 200, // กำหนดความกว้างของกล่อง
                    height: 30, // กำหนดสีของกล่อง
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey),
                    width: 200, // กำหนดความกว้างของกล่อง
                    height: 30, // กำหนดสีของกล่อง
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.grey,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey),
                    width: 200, // กำหนดความกว้างของกล่อง
                    height: 30, // กำหนดสีของกล่อง
                  ),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
