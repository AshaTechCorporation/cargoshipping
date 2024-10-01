import 'package:cargoshipping/track/widgets/sendcompletemap.dart';
import 'package:flutter/material.dart';
import 'package:cargoshipping/constants.dart';

class Sendcomplete extends StatelessWidget {
  const Sendcomplete({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'รายละเอียดคำสั่งซื้อ',
          style: TextStyle(
              fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: size.height * 0.29,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(size.height * 0.02),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ข้อมูลการจัดส่ง',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: headingtext,
                                      fontWeight: FontWeight.bold),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Sendcompletemap(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: size.height * 0.027,
                                    width: size.width * 0.55,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: red1, width: 1.0),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'คาดว่าจะถึงโกดังจีนใน 25 ก.ค. 67',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: red1,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Image.asset('assets/icons/redpin.png')
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.009,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Image.asset(
                                    'assets/icons/packingtrack.png',
                                    height: size.height * 0.05,
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.02,
                                ),
                                Expanded(
                                  flex: 8,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '31 ก.ค. 67  15:34',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: headingtext,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'ร้านค้ากำลังเตรียมส่ง',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.009,
                            ),
                            Container(
                              color: Colors.grey,
                              width: size.width * 0.95,
                              height: size.height * 0.0007,
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.01),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'เลขออร์เดอร์',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.03,
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Text(
                                      'A123456',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: headingtext,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.01),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'เลขที่คำสั่งซื้อ',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(width: size.width * 0.01),
                                  Expanded(
                                    flex: 7,
                                    child: Text(
                                      '012345623',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: headingtext,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.01),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'รหัสผู้นำเข้า',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.07,
                                  ),
                                  Expanded(
                                    flex: 9,
                                    child: Text(
                                      '012345623',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: headingtext,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.01),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'จัดส่งทางรถ',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Container(
                              height: size.height * 0.001,
                              width: size.width * 0.99,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.01),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      'เลขที่ติดตามพัสดุ',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 9,
                                    child: Text(
                                      'A013245678',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: headingtext,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 60,
                        right: 20,
                        child: Opacity(
                          opacity: 0.5,
                          child: Image.asset(
                            'assets/icons/carback.png',
                            width: size.width * 0.2,
                            height: size.height * 0.1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  color: white,
                  height: size.height * 0.35,
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'รายละเอียดคำสั่งซื้อ',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(size.height * 0.01),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: size.height * 0.075,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                            SizedBox(width: size.width * 0.02),
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ชั้นวางพลาสติกในครัว, ชั้นวางของในห้องน้ำ...',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.005,
                                  ),
                                  Text(
                                    'สีขาวมล',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: headingtext,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.005,
                                  ),
                                  Text(
                                    '¥ 4.88 (฿ 00)',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: headingtext),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: size.width * 0.02),
                            Expanded(
                              flex: 2,
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '1688严选店',
                                    style: TextStyle(
                                        fontSize: 12, color: headingtext),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.028,
                                  ),
                                  Text(
                                    'จำนวน 50',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(size.height * 0.01),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: size.height * 0.075,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                            SizedBox(width: size.width * 0.02),
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ชั้นวางพลาสติกในครัว, ชั้นวางของในห้องน้ำ...',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.005,
                                  ),
                                  Text(
                                    'สีขาวมล',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: headingtext,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.005,
                                  ),
                                  Text(
                                    '¥ 4.88 (฿ 00)',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: headingtext),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: size.width * 0.02),
                            Expanded(
                              flex: 2,
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '1688严选店',
                                    style: TextStyle(
                                        fontSize: 12, color: headingtext),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.028,
                                  ),
                                  Text(
                                    'จำนวน 50',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.009,
                      ),
                      Container(
                        color: Colors.grey,
                        width: size.width * 0.95,
                        height: size.height * 0.0007,
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'หมายเหตุจากผู้ซื้อ:',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: headingtext,
                                  fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            Text(
                              'ไม่มี',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: headingtext,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Container(
                        color: Colors.grey,
                        width: size.width * 0.95,
                        height: size.height * 0.0007,
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        child: Row(
                          children: [
                            Text(
                              'ภาพระหว่างการขนส่ง',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            Container(
                              height: size.height * 0.04,
                              width: size.width * 0.08,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            Container(
                              height: size.height * 0.04,
                              width: size.width * 0.08,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            Container(
                              height: size.height * 0.04,
                              width: size.width * 0.08,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            Container(
                              height: size.height * 0.04,
                              width: size.width * 0.08,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'บริการเสริม',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  height: size.height * 0.237,
                  color: white,
                  child: Padding(
                    padding: EdgeInsets.all(size.height * 0.01),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/checktookred.png',
                              height: size.height * 0.02,
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Text(
                              'ตีลังไม้',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              '¥ 500',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Text(
                              '(฿ 2,000)',
                              style: TextStyle(
                                  color: headingtext,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.008,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.065),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'ชั้นวางพลาสติกในครัว, ชั้นวาง... สีขาวมวล',
                                  style: TextStyle(fontSize: 13),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: size.height * 0.001),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.065),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'ชั้นวางพลาสติกในครัว, ชั้นวาง... สีแดงอิฐ',
                                  style: TextStyle(fontSize: 14),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.008,
                        ),
                        Container(
                          color: Colors.grey,
                          height: size.height * 0.001,
                          width: double.infinity,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Row(
                          children: [
                            Container(
                              height: size.height * 0.035,
                              width: size.width * 0.3,
                              decoration: BoxDecoration(
                                  color: red1,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  'ค่าใช้จ่ายส่วนสินค้า',
                                  style: TextStyle(
                                      color: white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.065),
                          child: Row(
                            children: [
                              Text(
                                'รวมค่าสินค้าทั้งหมด (100 ชิ้น)',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: headingtext),
                              ),
                              Spacer(),
                              Text(
                                '฿ 2,345.53',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: headingtext),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: size.height * 0.001),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.065),
                          child: Row(
                            children: [
                              Text(
                                'รวมค่าขนส่งในจีนรวมทั้งหมด',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: headingtext),
                              ),
                              Spacer(),
                              Text(
                                '฿ 2,345.53',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: headingtext),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: size.width * 0.025,
                              right: size.width * 0.066),
                          child: Row(
                            children: [
                              Text(
                                'ยอดรวมที่ชำระแล้วทั้งหมด',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Spacer(),
                              Text(
                                '฿ 4,691.6',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.1,
                  color: white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        child: Row(
                          children: [
                            Text(
                              'เวลาสั่งซื้อ',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: headingtext,
                                  fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            Text(
                              '28 ก.ค. 2567',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: headingtext,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Text(
                              '11:09',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: headingtext,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: size.height * 0.001,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        child: Row(
                          children: [
                            Text(
                              'เวลาที่ชำระเงินค่าใช้จ่ายส่วนสินค้า',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: headingtext,
                                  fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            Text(
                              '28 ก.ค. 2567',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: headingtext,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Text(
                              '13:00',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: headingtext,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: size.height * 0.001,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        child: Row(
                          children: [
                            Text(
                              'ช่องทางชำระเงินค่าใช้จ่ายส่วนสินค้า',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: headingtext,
                                  fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            Text(
                              'QR พร้อมเพย์',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: headingtext,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: size.height * 0.08,
        child: BottomAppBar(
          color: white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  // เมื่อปุ่มถูกคลิก
                  // print("ปุ่มส่งรายการสั่งซื้อถูกคลิก");

                  // แสดง dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.of(context)
                            .pop(); // ปิด dialog หลังจาก 2 วินาที
                      });
                      return AlertDialog(
                        title: Text('เปิดบิล'),
                        content: Text('เปิดบิลเสร็จสิ้น'),
                      );
                    },
                  );
                },
                child: Container(
                  height: size.height * 0.06,
                  width: size.width * 0.5,
                  decoration: BoxDecoration(
                    color: red1,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'เปิดบิล',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
