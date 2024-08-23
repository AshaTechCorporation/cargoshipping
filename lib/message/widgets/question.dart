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
    return Scaffold(
      appBar: AppBar(
        title: Text('คำถามที่พบบ่อย'),
      ),
      body: Container(
        color:background,
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Center(
              child: Container(
                width: 358,
                height: 48,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('ติดต่อของที่จีนต้องติดต่ออย่างไร'),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_drop_down_outlined)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                width: 358,
                height: 48,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('ติดต่อของที่จีนต้องติดต่ออย่างไร'),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_drop_down_outlined)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                width: 358,
                height: 48,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('ติดต่อของที่จีนต้องติดต่ออย่างไร'),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_drop_down_outlined)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                width: 358,
                height: 48,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('ติดต่อของที่จีนต้องติดต่ออย่างไร'),
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
