import 'package:cargoshipping/account/widgets/mobilebankingpage.dart';
import 'package:flutter/material.dart';

class Topuppage extends StatefulWidget {
  const Topuppage({super.key});

  @override
  State<Topuppage> createState() => _TopuppageState();
}

class _TopuppageState extends State<Topuppage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ช่องทางการเติมเงิน'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 25,
                ),
                Image.asset(
                  'assets/icons/qrcode.png',
                  height: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'QR พร้อมเพย์',
                  style: TextStyle(fontSize: 13),
                ),
                Spacer(),
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 380,
              height: 1,
              color: Colors.black,
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Mobilebankingpage(),
                  ),
                );
              },
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Image.asset('assets/icons/mobilebank.png'),
                  Text(
                    'โอนเงินผ่านแอป Mobile Banking',
                    style: TextStyle(fontSize: 13),
                  ),
                  Spacer(),
                  Image.asset('assets/icons/rightarrow.png'),
                  SizedBox(width: 20),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 380,
              height: 1,
              color: Colors.black,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Image.asset('assets/icons/creditcard.png'),
                Text(
                  'บัตรเครดิต/บัตรเดบิต',
                  style: TextStyle(fontSize: 13),
                ),
                Spacer(),
                Image.asset('assets/icons/rightarrow.png'),
                SizedBox(
                  width: 20,
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 380,
              height: 1,
              color: Colors.black,
            ),
            SizedBox(
              height: 500,
            ),
            Container(
              height: 45,
              width: 306,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.red),
              child: Center(
                  child: Text(
                'ยืนยันช่องทางการเติมเงิน',
                style: TextStyle(color: Colors.white),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
