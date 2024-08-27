import 'package:cargoshipping/account/widgets/addresspage.dart';
import 'package:cargoshipping/account/widgets/userinfo.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/login/loginPage.dart';
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('ตั้งค่า',style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),),
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
                  'ตั้งค่าบัญชีผู้ใช้',
                  style: TextStyle(
                      fontWeight: FontWeight.bold), // เพิ่มความหนาของข้อความ
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Userinfo()));
                },
                child: Row(
                  children: [
                    Text('ข้อมูลเกี่ยวกับบัญชี'),
                    Spacer(),
                    Icon(Icons.arrow_forward)
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Addresspage()));
                },
                child: Row(
                  children: [
                    Text('ที่อยู่ของฉัน'),
                    Spacer(),
                    Icon(Icons.arrow_forward)
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Text('ข้อมูลบัตร/บัญชีธนาคาร'),
                    Spacer(),
                    Icon(Icons.arrow_forward)
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            Container(
              color: Colors.grey[300],
              height: 50,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  'ช่วยเหลือ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold), // เพิ่มความหนาของข้อความ
                ),
              ),
            ),
            SizedBox(height: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  Text('ข้อตกลงและเงื่อไขการให้บริการ'),
                  Spacer(),
                  Icon(Icons.arrow_forward)
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  Text('เวอร์ชัน'),
                  Spacer(),
                  Icon(Icons.arrow_forward)
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  Text('เกี่ยวกับเรา'),
                  Spacer(),
                  Icon(Icons.arrow_forward)
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  Text('คำร้องขอลบบัญชีผู้ใช้'),
                  Spacer(),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 190,
            ),
            Container(
              height: 50,
              width: 170,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: red1, width: 1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('ยืนยันการออกจากระบบ'),
                              content: Text('คุณต้องการออกจากระบบใช่ไหม?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('ยกเลิก'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                  (route) => false);
                                  },
                                  child: Text('ตกลง'),
                                )
                              ],
                            );
                          });
                    },
                    child: Text(
                      'ออกจากระบบ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, color: red1),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
