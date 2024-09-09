import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Confirmorderpage extends StatefulWidget {
  const Confirmorderpage({
    super.key,
  });

  @override
  State<Confirmorderpage> createState() => _ConfirmorderpageState();
}

class _ConfirmorderpageState extends State<Confirmorderpage> {
  bool carSelected = false;
  bool boatSelected = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'ยืนยันการสั่งซื้อ',
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: white,
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/icons/redpin.png',
                      ),
                      SizedBox(width: size.width * 0.03),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ที่อยู่สำหรับจัดส่ง',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: size.height * 0.005),
                          Row(
                            children: [
                              Text(
                                'Girati Sukapat',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: size.width * 0.04),
                              Text(
                                '097 123 4567',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            '111/222 xxxx',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    height: size.height * 0.002,
                    width: size.width * 0.92,
                    color: greymess,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/icons/redcar.png'),
                            SizedBox(width: size.width * 0.02),
                            Text(
                              'รูปแบบการขนส่ง',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.005),
                        SizedBox(
                          height: size.height * 0.02,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text('ขนส่งทางรถ'),
                              ),
                              Spacer(),
                              Checkbox(
                                value: carSelected,
                                onChanged: (bool? value) {
                                  setState(() {
                                    carSelected = value ?? false;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.008,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text('ขนส่งทางเรือ'),
                              ),
                              Spacer(),
                              Checkbox(
                                value: boatSelected,
                                onChanged: (bool? value) {
                                  setState(() {
                                    boatSelected = value ?? false;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: size.height * 0.0001),
                        Row(
                          children: [
                            Text('เงื่อนไขการขนส่ง'),
                            Spacer(),
                            TextButton(
                              onPressed: () {
                                // Handle the press action here
                              },
                              child: Text(
                                'เลือกเงื่อนไขการขนส่ง',
                                style: TextStyle(
                                    color: red1, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Image.asset('assets/icons/rightarrow.png'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              color: white,
              height: size.height * 0.06,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      'รายการสั่งซื้อสินค้า',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: red1,
              height: size.height * 0.25,
              child: Row(
                children: [
                  Align(
                    alignment: Alignment
                        .topCenter,
                    child: Container(
                      color: background,
                      height: size.height * 0.13,
                      width: size.width * 0.999,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image.asset(
                              'assets/images/box.png',
                              width: size.width * 0.19,
                              height:size.height * 0.1,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.035,
                          ),
                          Column(
                            children: [
                              SizedBox(height: size.height * 0.022,),
                              Text('data'),
                            ],
                          )
                        ],
                      ),
                    ),
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
