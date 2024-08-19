import 'package:cargoshipping/account/widgets/userinfo.dart';
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
            ListTile(
              title: Text('data'),
              trailing: Icon(Icons.arrow_forward),
              dense: true,
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Userinfo()));

              },
            ),
            Divider(),

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
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Userinfo()));
                },
                child: Row(
                  children: [
                    Text('ชื่อผู้ใช้'),
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
              child: Row(
                children: [
                  Text('ที่อยู่ของฉัน'),
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
                  Text('ข้อมูลบัตร/บัญชีธนาคาร'),
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
                  Text('เปลี่ยนรหัสผ่าน'),
                  Spacer(),
                  Icon(Icons.arrow_forward)
                ],
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
                  style: TextStyle(fontWeight: FontWeight.bold), // เพิ่มความหนาของข้อความ
                ),
              ),
            ),
            SizedBox(height: 1),
            
            Divider(),
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
                  Icon(Icons.arrow_forward)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
