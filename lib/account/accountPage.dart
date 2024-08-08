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
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.red,
                    ), // เปลี่ยนเป็นไอคอนที่คุณต้องการ
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
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.grey[300]),
              height: 45,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.grey,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text('สมัครเป็นตัวแทน'),
                ],
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              height: 45,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.grey,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text('ติดต่อเรา'),
                ],
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.grey[300]),
              height: 45,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.grey,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text('ช่วยเหลือ'),
                ],
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              height: 45,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.grey,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text('แจ้งปัญหา'),
                ],
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.grey[300]),
              height: 45,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.grey,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text('ตั้งค่า'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
