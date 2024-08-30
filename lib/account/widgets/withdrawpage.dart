import 'package:cargoshipping/account/cerditcardpage.dart';
import 'package:cargoshipping/account/widgets/withdrawmobile.dart';
import 'package:flutter/material.dart';

class Withdrawpage extends StatefulWidget {
  const Withdrawpage({super.key});

  @override
  State<Withdrawpage> createState() => _WithdrawpageState();
}

class _WithdrawpageState extends State<Withdrawpage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ช่องทางการถอนเงิน',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
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
                    builder: (context) => Withdrawmobile(),
                  ),
                );
              },
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Image.asset('assets/icons/mobilebank.png'),
                  Text(
                    'ถอนเงินผ่านแอป Mobile Banking',
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
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Cerditcardpage(),
                  ),
                );
              },
              child: Row(
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
                'ยืนยันช่องทางการถอน',
                style: TextStyle(color: Colors.white),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
