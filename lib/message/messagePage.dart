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
              padding: EdgeInsets.symmetric(vertical: size.height * 0.02, horizontal: size.width * 0.01),
              child: Row(
                children: [Text('ติดต่อเรา', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
