import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Userinfo extends StatefulWidget {
  const Userinfo({super.key});

  @override
  State<Userinfo> createState() => _UserinfoState();
}

class _UserinfoState extends State<Userinfo> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('ตั้งค่าบัญชี'),
        ),
        body: Container(
          color: Colors.grey[300],
          child: Column(
            children: [
              Container(
              color: Colors.grey[300],
              height: 50,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  'ตั้งค่าบัญชีผู้ใช้',
                  style: TextStyle(fontWeight: FontWeight.bold), // เพิ่มความหนาของข้อความ
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  Text('ชื่อผู้ใช้'),
                  Spacer(),
                  Text('Girati Sukapat')
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
                  Text('********22')
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
                  Text('g********@gmail.com')
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
                  Text('g********@gmail.com')
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Divider(),
            SizedBox(
              height: size.height * 0.07,
            ),
            Container(
              width: 358,
              height: 45,
              decoration: BoxDecoration(
                color: red1,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Center(child: Text('ยืนยัน',style: TextStyle(fontSize: 15,color: Colors.white),)),
            )
            ],
          ),
        ));
  }
}
