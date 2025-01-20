import 'package:cargoshipping/message/widgets/customdivider.dart';
import 'package:cargoshipping/track/widgets/intransitmap.dart';
import 'package:flutter/material.dart';
import 'package:cargoshipping/account/mapTest.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/track/widgets/productcardwidget.dart';

class Intransitdetail extends StatelessWidget {
  const Intransitdetail({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: white,
        title: Text(
          'รายละเอียดคำสั่งซื้อ',
          style: TextStyle(
              fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: white,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(size.height * 0.015),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ข้อมูลการจัดส่ง',
                          style: TextStyle(
                              fontSize: 13,
                              color: headingtext,
                              fontWeight: FontWeight.w600),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Intransitmap()));
                          },
                          child: Container(
                            height: size.height * 0.027,
                            width: size.width * 0.35,
                            decoration: BoxDecoration(
                                border: Border.all(color: red1, width: 1.5),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'สถานะการจัดส่ง',
                                  style: TextStyle(
                                      color: red1,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11),
                                ),
                                Image.asset('assets/icons/redpin.png')
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.035),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/icon_red2.png',
                          height: size.height * 0.05,
                        ),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '31 ก.ค.67 15:34',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: headingtext,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: size.height * 0.005,
                            ),
                            Text(
                              'อยู่ระหว่างการขนส่ง',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: size.height * 0.005,
                            ),
                            Text(
                              'กำหนดประมาณการณ์ถึงไทย วันที่ 15 ส.ค. 67',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: red1,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Container(
                    color: greymess,
                    height: size.height * 0.0025,
                    width: size.width * 0.95,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Row(
                      children: [
                        Text(
                          'เลขที่PO',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: size.width * 0.14,
                        ),
                        Text(
                          'A123456',
                          style: TextStyle(
                              fontSize: 14,
                              color: headingtext,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: size.height * 0.02),
                          child: Text(
                            'ที่อยู่จัดส่ง',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.11,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Girati Sukapat  097 123 4567 111/222 xxxxx xxxxx xxxxxx xxxxxxxxxxxxx ...',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: headingtext,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'เลือกที่อยู่จัดส่ง',
                          style: TextStyle(
                              fontSize: 13,
                              color: red1,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: size.width * 0.025,
                        ),
                        Image.asset('assets/icons/rightredarrow.png')
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Row(
                      children: [
                        Text(
                          'ช่องทางการขนส่งโดย',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Text('รถEK')
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Row(
                      children: [
                        Text(
                          'โกดัง',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: size.width * 0.25,
                        ),
                        Text('กวางโจว')
                      ],
                    ),
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
                          'รวมน้ำหนักทั้งหมด',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '00 kg',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'CBM รวมทั้งหมด',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '00 CBM',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'พัสดุรวมทั้งหมด',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '00 Carton',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.014,
                  ),
                  Container(
                    height: size.height * 0.05,
                    decoration: BoxDecoration(color: red1),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'รายละเอียดรายการสินค้า',
                            style: TextStyle(
                                fontSize: 13,
                                color: white,
                                fontWeight: FontWeight.w600),
                          ),
                          Image.asset('assets/icons/rightarrowwhite.png')
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    color: white,
                    // height: size.height * 0.5,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.06),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'รายการพัสดุเข้าคลัง',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        ProductCardWidget(
                            size: size, greyuserinfo: greyuserinfo, red1: red1),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Container(
                          height: size.height * 0.0002,
                          width: size.width * 0.95,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.05),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'บริการเสริม',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.045,
                              vertical: size.height * 0.01),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/icons/checktookred.png',
                                height: size.height * 0.018,
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              Text(
                                'ตีลังไม้',
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '¥ 500',
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              Text(
                                '(฿ 2,000)',
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: size.height * 0.0005,
                          width: size.width * 0.98,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.05),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'การจัดส่งในไทย',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.01),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Flex 1: รูปภาพ
                              Expanded(
                                flex: 1,
                                child: Image.asset(
                                  'assets/icons/redtruck.png',
                                  height: size.height * 0.03,
                                  width: size.width * 0.04,
                                ),
                              ),
                              SizedBox(width: size.width * 0.03),
                              Expanded(
                                flex: 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'ช่องทางจัดส่ง',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: size.height * 0.005),
                                    Text(
                                      'ค่าขนส่งมากกว่า 2,000 บาทขึ้นไป\nจัดส่งฟรี กทม. ปริมณฑล',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Flex 3: ข้อความด้านขวา
                              Expanded(
                                flex: 4,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {
                                      // กดเพื่อเลือกวิธีการจัดส่ง
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'เลือกวิธีการจัดส่ง',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: red1,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.02,
                                        ),
                                        Image.asset(
                                            'assets/icons/rightredarrow.png')
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Container(
                          height: size.height * 0.0002,
                          width: size.width * 0.95,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: size.width * 0.04),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: red1,
                                    borderRadius: BorderRadius.circular(15)),
                                height: size.height * 0.035,
                                width: size.width * 0.35,
                                child: Center(
                                  child: Text(
                                    'ค่าใช้จ่ายส่วนสินค้า',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: size.width * 0.08,
                              right: size.width * 0.055),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'รวมค่าสินค้าทั้งหมด(100ชิ้น)',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: headingtext,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '฿ 2,345.97',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: headingtext,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.001,
                        ),
                        SizedBox(
                          height: size.height * 0.001,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: size.width * 0.08,
                              right: size.width * 0.055),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'รวมค่าขนส่งในจีนทั้งหมด',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: headingtext,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '฿ 2,000',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: headingtext,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.001,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ยอดรวมที่ชำระแล้วทั้งหมด',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '฿ 4,345.97',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: size.width * 0.04),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: red1,
                                    borderRadius: BorderRadius.circular(15)),
                                height: size.height * 0.035,
                                width: size.width * 0.35,
                                child: Center(
                                  child: Text(
                                    'ค่าใช้จ่ายส่วนบริการ',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: size.width * 0.08,
                              right: size.width * 0.055),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'รวมค่าขนส่ง จีน-ไทย ทั้งหมด (00 CRM/00 kg)',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '฿ 2,000.00',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.001,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: size.width * 0.08,
                              right: size.width * 0.055),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'รวมค่าบริการเสริมทั้งหมด',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: headingtext,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '฿ 2,345.97',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: headingtext,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.001,
                        ),
                        SizedBox(
                          height: size.height * 0.001,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: size.width * 0.08,
                              right: size.width * 0.055),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'รวมค่าขนส่งในไทยทั้งหมด',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: headingtext,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '฿ 2,000',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: headingtext,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.001,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ยอดรวมที่ชำระแล้วทั้งหมด',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '฿ 4,345.97',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'หัก ณ ที่ใช้จ่าย ค่าขนส่ง 1%',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '฿ 0,000.97',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.05),
                          child: Container(
                            height: size.height * 0.03,
                            color: Color(0xfffff0f0),
                            child: Row(
                              children: [
                                Text(
                                  'สรุปยอดรวมที่ชำระแล้ว',
                                  style: TextStyle(
                                      color: red1,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Text(
                                  '฿ 0,000.00',
                                  style: TextStyle(
                                      color: red1,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'หมายเหตุผู้ซื้อ:',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: headingtext,
                                    fontWeight: FontWeight.w600),
                              ),
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
                          height: size.height * 0.01,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'หมายเหตุจัดส่ง:',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: headingtext,
                                    fontWeight: FontWeight.w600),
                              ),
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
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.05),
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
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        CustomDivider(
                          heightFactor: 0.0005,
                          widthFactor: 0.98,
                          color: Colors.grey,
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
              height: size.height * 0.1,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: size.height * 0.05),
                      child: Image.asset(
                        'assets/icons/Shopicon.png',
                        height: size.height * 0.022,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 9, // flex ของ Text
                    child: Text(
                      'การชำระยอดค่าขนส่งเพื่อยืนยันคิวในการจัดส่งพัสดุ หลังจากระบบได้รับยอดโอนแล้วจะมีพนักงานประสานแจ้งกำหนด นัดหมายเพื่อจัดส่งพัสดุโดยปกติพัสดุของท่านจะถูกส่งหลังจาก สถานะพัสดุถึงโกดังไทย ภายในประมาณ 1-3 วันทำการ',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: size.height * 0.08,
        child: BottomAppBar(
          color: white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  // เมื่อปุ่มถูกคลิก
                  // print("ปุ่มส่งรายการสั่งซื้อถูกคลิก");

                  // แสดง dialog
                  // showDialog(
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     Future.delayed(Duration(seconds: 2), () {
                  //       Navigator.of(context)
                  //           .pop(); // ปิด dialog หลังจาก 2 วินาที
                  //     });
                  //     return AlertDialog(
                  //       title: Text('เปิดบิล'),
                  //       content: Text('เปิดบิลเสร็จสิ้น'),
                  //     );
                  //   },
                  // );
                },
                child: Container(
                  height: size.height * 0.06,
                  width: size.width * 0.42,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      width: size.width * 0.003,
                      color: red1
                    )
                  ),
                  child: Center(
                    child: Text(
                      'แจ้งข้อมูลพัสดุผิด',
                      style: TextStyle(
                        color: red1,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: size.width * 0.004,
                height: size.height * 0.1,
                color: greymess,
              ),
              GestureDetector(
                onTap: () {
                  // เมื่อปุ่มถูกคลิก
                  // print("ปุ่มส่งรายการสั่งซื้อถูกคลิก");

                  // แสดง dialog
                  // showDialog(
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     Future.delayed(Duration(seconds: 2), () {
                  //       Navigator.of(context)
                  //           .pop(); // ปิด dialog หลังจาก 2 วินาที
                  //     });
                  //     return AlertDialog(
                  //       title: Text('เปิดบิล'),
                  //       content: Text('เปิดบิลเสร็จสิ้น'),
                  //     );
                  //   },
                  // );
                },
                child: Container(
                  height: size.height * 0.06,
                  width: size.width * 0.42,
                  decoration: BoxDecoration(
                    color: red1,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'ชำระเงินค่านำเข้า',
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
