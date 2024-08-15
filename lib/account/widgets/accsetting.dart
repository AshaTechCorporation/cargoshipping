import 'package:flutter/material.dart';

class Accsetting extends StatefulWidget {
  const Accsetting({super.key, required this.title});

  final String title;

  @override
  State<Accsetting> createState() => _AccsettingState();
}

class _AccsettingState extends State<Accsetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.grey[300], // เปลี่ยนสีพื้นหลังของ body
        child: Column(
          children: [
            Container(
              color: Colors.grey[300],
              height: 50,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  'ข้อมูลด้านการติดต่อ',
                  style: TextStyle(fontWeight: FontWeight.bold), // เพิ่มความหนาของข้อความ
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  Text('ชื่อผู้ใช้'),
                  Spacer(),
                  Text('Girati Sukapat'),
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  Text('หมายเลขโทรศัพท์'),
                  Spacer(),
                  Text('********22'),
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  Text('อีเมล'),
                  Spacer(),
                  Text('g********@gmail.com'),
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  Text('เปลี่ยนรหัสผ่าน'),
                  Spacer(),
                  Text('********'),
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(),
          ],
        ),
      ),
    );
  }
}
