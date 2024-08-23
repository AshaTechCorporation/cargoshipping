import 'package:cargoshipping/account/topuppage.dart';
import 'package:cargoshipping/account/widgets/CardlistWidget.dart';
import 'package:cargoshipping/account/widgets/howto.dart';
import 'package:cargoshipping/account/widgets/importlist.dart';
import 'package:cargoshipping/account/widgets/menulist.dart';
import 'package:cargoshipping/account/widgets/topupwidget.dart';
import 'package:cargoshipping/account/widgets/withdrawpage.dart';
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
        preferredSize: Size.fromHeight(200.0),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.redAccent, red1],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'A123456',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Name Surname',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Spacer(),
                        Container(
                          width: 150,
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [color1, color2],
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              stops: [0.3, 0.7],
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Bronze',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                  width:
                                      10),
                              CircleAvatar(
                                backgroundColor: Colors.grey[300],
                                radius: 20,
                                child: Icon(
                                  Icons.person,
                                  size: 20,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.009,),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'TEG+ Point ',
                              style:
                                  TextStyle(color: Colors.yellow[500], fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '150 คะแนน ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text(
                              'Wallet ',
                              style:
                                  TextStyle(color: Colors.yellow, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'คงเหลือ 1025 บาท',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(
                          fistpagewidget.length,
                          (index) => Topupwidget(
                              size: size,
                              title: topup[index],
                              press: () {
                                if (index == 0) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Topuppage()
                                    ),
                                  );
                                }
                                if (index == 1) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Withdrawpage()
                                    ),
                                  );
                                }
                              })),
                    ),
                  ],
                ),
              ),
            ),
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
                      color:red1,
                    ),
                    onPressed: () {
                    },
                  ),
                ],
              ),
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
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
            GridView.builder(
              shrinkWrap: true,
              itemCount: importlist.length,
              physics: ClampingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                return Importlist(
                  size: size,
                  press: () {},
                  imagespath: importlist[index],
                );
              },
            ),
            SizedBox(
              height: size.height * 0.001,
            ),
            Image.asset('assets/images/freight.png'),

            // Wrap(
            //   spacing: 15,
            //   runSpacing: 10,
            //   children: List.generate(
            //     importlist.length,
            //     (index) => Importlist(
            //       size: size,
            //       press: () {},
            //       imagespath: importlist[index],
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 15,
            ),
            Column(
              children: List.generate(
                  howto.length,
                  (index) => Howto(
                        size: size,
                        press: () {},
                        title: howto[index],
                      )),
            ),
            MenuList(),
          ],
        ),
      ),
    );
  }
}
