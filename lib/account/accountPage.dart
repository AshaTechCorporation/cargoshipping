import 'package:cargoshipping/account/widgets/CardlistWidget.dart';
import 'package:cargoshipping/account/widgets/importlist.dart';
import 'package:cargoshipping/account/widgets/menulist.dart';
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
          preferredSize: Size.fromHeight(130.0), // Set the height of the AppBar
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.redAccent, Colors.red],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only( left: 20), // Adjust padding as needed
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 30,
                            child: Icon(Icons.person, size: 30, color: Colors.grey[700]),
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Girati Sukapat",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "giratisukapat@gmail.com",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              backgroundColor: Colors.transparent, // Make the AppBar background transparent
              elevation: 0, // Remove the shadow under the AppBar
            ),
          ),
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.0001,
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
                  imagespath: oderlist[index],
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
                (index) => Importlist(
                  size: size,
                  title: listImport[index],
                  press: () {},
                  imagespath: importlist[index],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            MenuList(),
          ],
        ),
      ),
    );
  }
}
