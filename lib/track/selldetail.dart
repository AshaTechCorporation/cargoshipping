import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/track/mappage.dart';
import 'package:flutter/material.dart';

class Selldetail extends StatefulWidget {
  const Selldetail({super.key});

  @override
  State<Selldetail> createState() => _SelldetailState();
}

class _SelldetailState extends State<Selldetail> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'รายละเอียดคำสั่งซื้อ',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container(
            color: Colors.grey,
            height: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.07,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'กรุณาชำระเงินภายใน24 ชั่วโมงเพื่อยืนยำคำสั่งซื้อ',
                    style: TextStyle(
                        color: red1, fontWeight: FontWeight.w600, fontSize: 13),
                  ),
                ],
              ),
            ),
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
                            'รูปแบบการขนส่ง',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: size.height * 0.005),
                          Text(
                            'ขนส่งทางรถ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0), // เว้นระยะทางซ้าย
                child: Align(
                  alignment:
                      Alignment.centerLeft, // จัดให้อยู่ซ้าย-กลางของช่องแนวตั้ง
                  child: Text(
                    'รายละเอียดคำสั่งซื้อ',
                    style: TextStyle(
                      color: headingtext,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color: white,
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Container(
                          width: size.width * 0.15,
                          height: size.width * 0.15,
                          color: Colors.grey[300],
                        ),
                      ),
                      SizedBox(width: size.width * 0.03),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ชั้นวางพลาสติกในครัว, ชั้นวางของในห...',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: size.height * 0.01),
                            Text(
                              'สีขาวมวล',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: headingtext,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: size.height * 0.001),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '￥ 4.88',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: headingtext,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'จำนวน 50',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: headingtext,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Container(
                          width: size.width * 0.15,
                          height: size.width * 0.15,
                          color: Colors.grey[300],
                        ),
                      ),
                      SizedBox(width: size.width * 0.03),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ชั้นวางพลาสติกในครัว, ชั้นวางของในห...',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: size.height * 0.01),
                            Text(
                              'สีแดงอิฐ',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: headingtext,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: size.height * 0.001,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '￥ 4.88',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: headingtext,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'จำนวน 50',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: headingtext,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'หมายเหตุจากผู้ซื้อ:',
                        style: TextStyle(
                            fontSize: 13,
                            color: headingtext,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ไม่มี',
                        style: TextStyle(
                            fontSize: 13,
                            color: headingtext,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'ยอดรวมค่าสินค้าทั้งหมด (100 ชิ้น):',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '￥ 488',
                        style: TextStyle(
                            fontSize: 13,
                            color: greyuserinfo,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '฿ 2,345.53',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'บริการเสริม',
                    style: TextStyle(
                      color: headingtext,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color: white,
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ตีลังไม้',
                          style: TextStyle(
                            fontSize: size.width * 0.04,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '￥ 500',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.009),
                  Padding(
                    padding: const EdgeInsets.only(right: 30, left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                '• ชั้นวางพลาสติกในครัว, ชั้นวางของในห...',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text(
                              'สีขาวมวล',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.005),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                '• ชั้นวางพลาสติกในครัว, ชั้นวางของในห...',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text(
                              'สีแดงอิฐ',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'ยอดรวมค่าบริการเสริมทั้งหมด:',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '￥ 500',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        '฿ 2,447.94',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'การขนส่ง',
                    style: TextStyle(
                      color: headingtext,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color: white,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ค่าขนส่งภายในจีน',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        Text(
                          '฿ 2,000',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 15, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ยอดรวมค่าขนส่งในจีนทั้งหมด',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        Text(
                          '฿ 2,000',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: red1,
                              fontSize: 15),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ข้อมูการชำระเงิน',
                    style: TextStyle(
                      color: headingtext,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color: white,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ค่าขนส่งภายในจีน',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        Text(
                          '฿ 2,000',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 15, top: 5),
                    child: Row(
                      children: [
                        Image.asset('assets/icons/money.png'),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Text(
                          'วิธีการชำระเงิน',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontSize: 15),
                        ),
                        Spacer(),
                        Text(
                          'เลือกวิธีการชำระเงิน',
                          style: TextStyle(
                              color: red1, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Image.asset('assets/icons/rightarrow.png')
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(right: 30, left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'ค่าสินค้าทั้งหมด',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text(
                              '฿ 2,345.53',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.005),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'ค่าขนส่งภายในจีน',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text(
                              '฿ 2,000',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: size.height * 0.047,
              width: double.infinity,
              padding: EdgeInsets.only(left: 15, right: 15),
              color: pinkmess,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'ยอดชำระเงินทั้งหมด: ',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '(ยังไม่รวมค่าบริการเสริม)',
                            style: TextStyle(
                              fontSize: 13,
                              color: greyuserinfo,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    '฿ 4,345.53',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.026,
            ),
            Container(
              height: size.height * 0.40,
              width: size.width * 0.95,
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(25)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'อัตราแลกเปลี่ยน ณ วันที่ 00 ส.ค. 00 (00:00:00)',
                    style: TextStyle(
                        color: Colors.blue[800], fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '4.8851 หยวนจีนต่อบาทไทย',
                    style: TextStyle(
                        color: Colors.blue[800], fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    height: size.height * 0.08,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      color: skyorange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ราคาสินค้าอาจคลาดเคลื่อนกับเว็บไซต์ต้นทาง',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: red1,
                              fontSize: 13),
                        ),
                        Text(
                          'ระบบจะแสดงราคาสินค้าที่ต้องชำระหลังออเดอร์ตรวจสอบแล้ว',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: red1,
                              fontSize: 13),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Text(
                        'ขั้นตอนการชำระ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              _buildIconWithLine(
                                  size, 'assets/icons/step1.png'),
                              _buildDividerLine(size),
                              _buildIconWithLine(
                                  size, 'assets/icons/step2.png'),
                              _buildDividerLine(size),
                              _buildIconWithLine(
                                  size, 'assets/icons/step3.png'),
                            ],
                          ),
                          SizedBox(width: size.width * 0.02),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // จัดข้อความให้ตรงกันทางซ้าย
                              children: [
                                Align(
                                  alignment: Alignment
                                      .centerLeft,
                                  child: _buildStepText(
                                    'รอเจ้าหน้าที่ตรวจสอบหลังจากทำการสั่งซื้อ',
                                  ),
                                ),
                                SizedBox(height: size.height * 0.042),
                                Align(
                                  alignment: Alignment
                                      .centerLeft, // จัดข้อความให้อยู่ทางซ้าย
                                  child: _buildStepText(
                                    'ชำระค่าขนส่งในจีน และค่าสินค้าแก่ Supplier',
                                  ),
                                ),
                                SizedBox(height: size.height * 0.042),
                                Align(
                                  alignment: Alignment
                                      .centerLeft, // จัดข้อความให้อยู่ทางซ้าย
                                  child: _buildStepText(
                                    'ชำระค่าขนส่งจากจีนถึงไทย และการจัดส่งในไทย',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              width: size.width * 0.95,
              height: size.height * 0.27,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), 
                  color: pinkmess),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/icons/hello.png'),
                        SizedBox(
                          width: size.width* 0.03,
                        ),
                        Text('ข้อจำกัดการรับผิดชอบ',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: oldred
                        ),)
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    Text(
                        'TEG Cargo เป็นเพียงผู้ช่วยในการสั่งซื้อสินค้ากับร้านค้าจีนตามราย การสินค้าที่ลูกค้าเปิดออเดอร์สั่งซื้อมาเท่านั้นในกรณีที่สินค้ามีปัญหา เช่น ด้านคุณภาพสินค้า สินค้าผิดสเปก หรือปัญหาใน ด้านอื่นๆ ทาง TEG Cargo จะช่วยประสานงานกับทางร้านค้าจีนเพื่อเจรจาให้ ร้านค้า จีนรับผิดชอบต่อความเสียหายต่างๆที่เกิดขึ้น เนื่องจาก TEG Cargo เป็นเพียงผู้ช่วยสั่งซื้อสินค้าเท่านั้น และไม่สามารถรับผิดชอบต่อความ เสียหายต่างๆ ที่เกิดขึ้นจากร้านค้าจีนได้',style: TextStyle(
                          color: oldred,
                          fontWeight: FontWeight.bold
                        ),)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            )
          ],
        ),
      ),
      // bottomNavigationBar: ,
    );
  }
}

Widget _buildIconWithLine(Size size, String imagePath) {
  return Center(
    child: Image.asset(
      imagePath,
      width: size.width * 0.08,
      height: size.height * 0.04,
      color: Colors.orange,
    ),
  );
}

Widget _buildDividerLine(Size size) {
  return Container(
    width: 2,
    height: size.height * 0.02,
    color: Colors.orange,
  );
}

Widget _buildStepText(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 13,
      color: Colors.black,
    ),
  );
}
