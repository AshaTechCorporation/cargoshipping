import 'package:flutter/material.dart';

class Importrate extends StatelessWidget {
  const Importrate({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('เรทราคานำเข้า'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              width: 358,
              child: Column(
                children: [
                  Text('เรทราคานำเข้า'),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    width: 310,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red),
                    child: Center(
                        child: Text(
                      'กวางโจว,เซินเจิ้น > กรุงเทพ ทางรถ 4-7 วัน (LCL)',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    width: 310,
                    height: 270,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange),
                    // child: Center(
                    //     child: Text(
                    //   'กวางโจว,เซินเจิ้น > กรุงเทพ ทางรถ 4-7 วัน (LCL)',
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.bold, color: Colors.white),
                    // )),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    width: 310,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red),
                    child: Center(
                        child: Text(
                      'อี้อู > กรุงเทพ ทางรถ 5-10 วัน (LCL)',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    width: 310,
                    height: 240,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    width: 310,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        color: Colors.red),
                    child: Center(
                        child: Text(
                      'บริการพิธีการศุลกากร',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )),
                  ),
                  SizedBox(
                    height: size.height * 0.001,
                  ),
                  Container(
                    width: 310,
                    height: 50,
                    decoration: BoxDecoration(color: Colors.red),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'ค่าบริการ ดำเนินพิธีการศุลกากรไทย',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                            SizedBox(width: 10), // เพิ่มระยะห่างระหว่างข้อความ
                            Text(
                              '3000 บาท/ใบ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '5 รายการ ส่วนเกิน 200 บาท/รายการ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
