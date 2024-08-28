import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  const Question({super.key});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        title: Text(
          'คำถามที่พบบ่อย',
          style: TextStyle(
              fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 1.0,
          ),
        ),
      ),
      body: Container(
        color: background,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.023,
            ),
            Center(
              child: Container(
                width: size.width * 0.89,
                height: size.height * 0.054,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'ติดต่อของที่จีนต้องติดต่ออย่างไร',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_drop_down_outlined)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Center(
              child: Container(
                width: size.width * 0.89,
                height: size.height * 0.054,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'ติดต่อของที่จีนต้องติดต่ออย่างไร',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_drop_down_outlined)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Center(
              child: Container(
                width: size.width * 0.89,
                height: size.height * 0.054,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'ติดต่อของที่จีนต้องติดต่ออย่างไร',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_drop_down_outlined)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Center(
              child: Container(
                width: size.width * 0.89,
                height: size.height * 0.054,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'ติดต่อของที่จีนต้องติดต่ออย่างไร',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_drop_down_outlined)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
