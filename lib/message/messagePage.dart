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
        backgroundColor: background,
        title: Text(
          'ช่วยเหลือ',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 17),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.003,
            ),
            Container(
              color: background,
              height: size.height * 0.27,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Promotionpage(),
                        ),
                      );
                    },
                    child: PictureSliderWidget(size: size),
                  ),
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: size.height * 0.562,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.02,
                        horizontal: size.width * 0.03),
                    child: Row(
                      children: [
                        Text(
                          'ข้อความ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontFamily: 'SukhumvitSet'),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.04),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/icons/Frame 61.png',
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(width: size.width * 0.04),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: pinkmess,
                              ),
                              width: size.width * 0.55,
                              height: size.height * 0.07,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 7, top: 8),
                                  child: Text(
                                    'สวัสดีครับ (username)TEG Cargo ยินดีให้บริการครับ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: size.height * 0.01),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: pinkmess,
                              ),
                              width: size.width * 0.66,
                              height: size.height * 0.08,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: size.width * 0.04,
                                    top: size.height * 0.02),
                                child: Text(
                                  'ท่านสามารถเลือกคำถามจากปุ่มตัวเลือก หรือพิมพ์คำถามในช่องแชทได้เลยครับ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.09),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: greymess,
                                ),
                                width: size.width * 0.5,
                                height: size.height * 0.07,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: size.width * 0.03,
                                    right: size.width * 0.03,
                                    top: size.height * 0.015,
                                  ),
                                  child: Text(
                                    'การรับส่งของแต่ละครั้งมีจำนวนขั้นต่ำไหม',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * 0.01),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: greymess,
                                ),
                                width: size.width * 0.5,
                                height: size.height * 0.07,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: size.width * 0.03,
                                    right: size.width * 0.03,
                                    top: size.height * 0.015,
                                  ),
                                  child: Text(
                                    'ต้องการทราบราคาค่าขนส่งสินค้า ทั้งทาง รถ และทางเรือ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * 0.01),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: greymess,
                                ),
                                width: size.width * 0.5,
                                height: size.height * 0.07,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: size.width * 0.03,
                                    right: size.width * 0.03,
                                    top: size.height * 0.015,
                                  ),
                                  child: Text(
                                    'วิธีการคิดค่าขนส่งจากราคาที่คิดเป็น CBM',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: size.height * 0.073,
        color: white,
        child: BottomAppBar(
          color: white,
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
                        hintStyle: TextStyle(fontSize: 13)),
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
