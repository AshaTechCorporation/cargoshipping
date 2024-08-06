import 'package:cargoshipping/account/widgets/CardlistWidget.dart';
import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.10),
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 30,
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Girati Sukapat'),
                        ],
                      ),
                      Text('giratisuktipat@gmail.com')
                    ]),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.02, horizontal: size.width * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'รายการสั่งซื้อสินค้า',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite_border_outlined), // เปลี่ยนเป็นไอคอนที่คุณต้องการ
                    onPressed: () {
                      // กำหนดการกระทำเมื่อไอคอนถูกกด
                    },
                  ),
                ],
              ),
            ),
            Wrap(
              spacing: 15,
              runSpacing: 10,
              children: List.generate(
                productOrderList.length,
                (index) => CardlistWidget(
                  size: size,
                  title: productOrderList[index],
                  press: () {},
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.02, horizontal: size.width * 0.01),
              child: Row(
                children: [
                  Text(
                    'รายการนำเข้า',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )
                ],
              ),
            ),
            Wrap(
              spacing: 15,
              runSpacing: 10,
              children: List.generate(
                listImport.length,
                (index) => CardlistWidget(
                  size: size,
                  title: listImport[index],
                  press: () {},
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.02, horizontal: size.width * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (bool? value) {}),
                      Text('สมัครเป็นตัวแทน'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (bool? value) {}),
                      Text('ติดต่อเรา'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (bool? value) {}),
                      Text('ช่วยเหลือ'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (bool? value) {}),
                      Text('แจ้งปัญหา'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (bool? value) {}),
                      Text('ตั้งค่า'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
