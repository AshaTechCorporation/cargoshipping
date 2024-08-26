import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Ordersumpage extends StatefulWidget {
  const Ordersumpage({super.key});

  @override
  State<Ordersumpage> createState() => _OrdersumpageState();
}

class _OrdersumpageState extends State<Ordersumpage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'สรุปการสั่งซื้อ',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('รายการสั่งซื้อ'),
                  Spacer(),
                  Text('สิงหาคม 2567'),
                  Icon(Icons.arrow_drop_down_outlined)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: size.height * 0.08,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(
                                text: 'Order no.',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                                children: <TextSpan>[
                              TextSpan(
                                text: ' A523456',
                                style: TextStyle(
                                    color: red1,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 15),
                              )
                            ])),
                        Spacer(),
                        Icon(Icons.arrow_right_alt_outlined)
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      children: [
                        Text('สำเร็จเมื่อ'),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Text('20 ส.ค. 67'),
                        Spacer(),
                        Text('ยอดทั้งหมด ฿ 00,000')
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: size.height * 0.08,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(
                                text: 'Order no.',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                                children: <TextSpan>[
                              TextSpan(
                                text: ' A523456',
                                style: TextStyle(
                                    color: red1,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 15),
                              )
                            ])),
                        Spacer(),
                        Icon(Icons.arrow_right_alt_outlined)
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      children: [
                        Text('สำเร็จเมื่อ'),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Text('20 ส.ค. 67'),
                        Spacer(),
                        Text('ยอดทั้งหมด ฿ 00,000')
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: size.height * 0.08,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(
                                text: 'Order no.',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                                children: <TextSpan>[
                              TextSpan(
                                text: ' A523456',
                                style: TextStyle(
                                    color: red1,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 15),
                              )
                            ])),
                        Spacer(),
                        Icon(Icons.arrow_right_alt_outlined)
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      children: [
                        Text('สำเร็จเมื่อ'),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Text('20 ส.ค. 67'),
                        Spacer(),
                        Text('ยอดทั้งหมด ฿ 00,000')
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: size.height * 0.08,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(
                                text: 'Order no.',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                                children: <TextSpan>[
                              TextSpan(
                                text: ' A523456',
                                style: TextStyle(
                                    color: red1,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 15),
                              )
                            ])),
                        Spacer(),
                        Icon(Icons.arrow_right_alt_outlined)
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      children: [
                        Text('สำเร็จเมื่อ'),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Text('20 ส.ค. 67'),
                        Spacer(),
                        Text('ยอดทั้งหมด ฿ 00,000')
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: size.height * 0.08,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(
                                text: 'Order no.',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                                children: <TextSpan>[
                              TextSpan(
                                text: ' A523456',
                                style: TextStyle(
                                    color: red1,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 15),
                              )
                            ])),
                        Spacer(),
                        Icon(Icons.arrow_right_alt_outlined)
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      children: [
                        Text('สำเร็จเมื่อ'),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Text('20 ส.ค. 67'),
                        Spacer(),
                        Text('ยอดทั้งหมด ฿ 00,000')
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: size.height * 0.08,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(
                                text: 'Order no.',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                                children: <TextSpan>[
                              TextSpan(
                                text: ' A523456',
                                style: TextStyle(
                                    color: red1,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 15),
                              )
                            ])),
                        Spacer(),
                        Icon(Icons.arrow_right_alt_outlined)
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      children: [
                        Text('สำเร็จเมื่อ'),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Text('20 ส.ค. 67'),
                        Spacer(),
                        Text('ยอดทั้งหมด ฿ 00,000')
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: size.height * 0.08,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(
                                text: 'Order no.',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                                children: <TextSpan>[
                              TextSpan(
                                text: ' A523456',
                                style: TextStyle(
                                    color: red1,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 15),
                              )
                            ])),
                        Spacer(),
                        Icon(Icons.arrow_right_alt_outlined)
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      children: [
                        Text('สำเร็จเมื่อ'),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Text('20 ส.ค. 67'),
                        Spacer(),
                        Text('ยอดทั้งหมด ฿ 00,000')
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
