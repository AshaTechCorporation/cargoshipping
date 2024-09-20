import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Detailorderpage extends StatelessWidget {
  const Detailorderpage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: Text(
          'รายะเอียดคำสั่งซื้อ',
          style: TextStyle(
              fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 0.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
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
                            print('object');
                          },
                          child: Container(
                            height: size.height * 0.027,
                            width: size.width * 0.44,
                            decoration: BoxDecoration(
                                border: Border.all(color: red1, width: 1.5),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'ดูหลักฐานการจัดส่งสินค้า',
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
                        Image.asset('assets/icons/delivery.png'),
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
                            Text(
                              'จัดส่งสำเร็จ',
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
                          'เลขออเดอร์',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: size.width * 0.024,
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
                        Text(
                          'เลขที่ตู้',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: size.width * 0.024,
                        ),
                        Text(
                          'ABC123456',
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
                          padding:
                              EdgeInsets.only(bottom: size.height * 0.02),
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
                          width: size.width * 0.024,
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
                      children: [
                        Text(
                          'จัดส่งทางรถ',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
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
                          'รวมCBMทั้งหมด',
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
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
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
                          'บริการเสริม',
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ตีลังไม้',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'ชั้นวางพลาสติกในครัว, ชั้นวาง... สีขาวมวล',
                                style: TextStyle(fontSize: 13),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            Text(
                              'จำนวน 50',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.001),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'ชั้นวางพลาสติกในครัว, ชั้นวาง... สีแดงอิฐ',
                                style: TextStyle(fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            Text(
                              'จำนวน 50',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    color: greymess,
                    height: size.height * 0.0025,
                    width: size.width * 0.95,
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Row(
                      children: [
                        Text(
                          'การขนส่ง',
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
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'การขนส่ง Express',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: size.height * 0.005),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'DHL',
                                style: TextStyle(fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            Text(
                              'ส่วนลดค่าขนส่ง ฿ 0',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
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
                          'รวมค่าสินค้าทั้งหมด (100 ชิ้น)',
                          style: TextStyle(
                              fontSize: 13,
                              color: headingtext,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '฿ 2,345.53',
                          style: TextStyle(
                              fontSize: 13,
                              color: headingtext,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.004,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
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
                    height: size.height * 0.004,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ยอดรวมค่าสินค้า และค่าขนส่งในจีนที่ชำระแล้ว',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '฿ 4,345.53',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        )
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
                          'รวมค่าบริการ ค่าขนส่งมาไทย และ ในไทยทั้งหมด',
                          style: TextStyle(
                              fontSize: 13,
                              color: headingtext,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '฿ 2,000.00',
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
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'หัก ณ ที่จ่าย ค่าขนส่ง 1%',
                          style: TextStyle(
                              fontSize: 13,
                              color: headingtext,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '฿ 2,000.00',
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
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ยอดรวมค่าบริการ และค่าขนส่งไทยที่ชำระแล้ว',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '฿ 4,345.53',
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
                          'ยอดรวมทั้งหมดที่ชำระแล้ว',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '฿ 0,000.00',
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
                  Container(
                    color: greymess,
                    height: size.height * 0.0025,
                    width: size.width * 0.95,
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
                          'หมายเหตุจากผู้ซื้อ:',
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
                  Container(
                    color: greymess,
                    height: size.height * 0.0025,
                    width: size.width * 0.95,
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
                          'หมายเหตุจากผู้จัดส่ง:',
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
                  Container(
                    color: greymess,
                    height: size.height * 0.0025,
                    width: size.width * 0.95,
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
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              color: white,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.02,
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
                        Text(
                          'เวลาที่ชำระเงินค่าสินค้าแ ละค่าขนส่งในจีน',
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
                        Text(
                          'ชำระเงินค่าสินค้า และค่าขนส่งในจีนผ่าน',
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
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Row(
                      children: [
                        Text(
                          'เวลาที่ชำระเงินค่าบริการ และค่าขนส่งในไทย',
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
                        Text(
                          'ชำระเงินค่าบริการ และค่่าขนส่งในไทยผ่าน',
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
                  SizedBox(
                    height: size.height * 0.015,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: white,
        elevation: 10,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/icons/bottomreport.png',
                      height: size.height * 0.03,
                    ),
                    SizedBox(height: size.height * 0.008),
                    Text('แจ้งปัญหา',
                        style: TextStyle(
                            fontSize: 12,
                            color: headingtext,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
                SizedBox(
                  width: size.width * 0.06,
                ),
                Container(
                  height: size.height * 0.1,
                  width: size.width * 0.002,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: size.width * 0.06,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/icons/printreport.png',
                      height: size.height * 0.03,
                    ),
                    SizedBox(height: size.height * 0.008),
                    Text('พิมใบเสร็จส่งของ',
                        style: TextStyle(
                            fontSize: 12,
                            color: headingtext,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
                SizedBox(
                  width: size.width * 0.04,
                ),
                Container(
                  height: size.height * 0.068,
                  width: size.width * 0.42,
                  decoration: BoxDecoration(
                      color: red1, borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ยืนยันการรับสินค้า',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: white),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
