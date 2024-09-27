import 'package:cargoshipping/account/mapTest.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/widgets/reportformpage.dart';
import 'package:flutter/material.dart';

class Shipreceiptpage extends StatelessWidget {
  const Shipreceiptpage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'รายละเอียดคำสั่งซื้อ',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: white,
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
                                    builder: (context) => MapTest()));
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
                        Image.asset(
                          'assets/icons/delivery.png',
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
                        Text(
                          'เลขที่Shipment',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: size.width * 0.045,
                        ),
                        Text(
                          'EK099',
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
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
                color: white,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.06),
                      child: Row(
                        children: [
                          Text(
                            'รายการพัสดุเข้าคลัง',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      height: size.height * 0.24,
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: size.height * 0.12,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xfff7f3e9),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        Text(
                                          '1. ชั้นวางพลาสติกในครัว, ชั้นวางของในห้องน้ําแบบไม่มี รูพรุน, สุขโครกติดผนัง, เครื่องใช้ในห้องน้ํา',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              'สีแดงอิฐ',
                                              style: TextStyle(
                                                color: greyuserinfo,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.right,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: size.height * 0.0001,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: size.width * 0.045),
                                          child: RichText(
                                            text: TextSpan(
                                              text: 'ประเภท ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                              ),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: 'A',
                                                  style: TextStyle(
                                                    color: greyuserinfo,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.006,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: size.width * 0.045),
                                          child: RichText(
                                            text: TextSpan(
                                              text: 'Shop Tracking ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                              ),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: '  xxxxxx',
                                                  style: TextStyle(
                                                    color: greyuserinfo,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: size.height * 0.07,
                                    width: size.width * 0.1,
                                    margin: const EdgeInsets.all(5),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: size.height * 0.003,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: 'unit ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'กล่องลังจำนวน1',
                                                style: TextStyle(
                                                  color: greyuserinfo,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 7,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 5,
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'น้ำหนัก',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        width:
                                                            size.width * 0.02),
                                                    Text(
                                                      '2.5 กก.',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: greyuserinfo,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                flex: 8,
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'จำนวน',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        width:
                                                            size.width * 0.02),
                                                    Text(
                                                      '000',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: greyuserinfo,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: size.height * 0.01),
                                          Row(
                                            children: [
                                              Text(
                                                'ขนาด',
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                  width: size.width * 0.02),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'ยาว 50 x สูง 60 x กว้าง 40 cm',
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: greyuserinfo,
                                                      ),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    Text(
                                                      '(30 CBM)',
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: greyuserinfo,
                                                      ),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        height: size.height * 0.098,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.07),
                      child: Row(
                        children: [
                          Text(
                            'บริการเสริม',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.07),
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(bottom: size.height * 0.005),
                            child: Image.asset(
                              'assets/icons/checktookred.png',
                              height: size.height * 0.02,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Text(
                            'ตีลังไม้',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            '¥ 500 (฿ 2,000)',
                            style: TextStyle(
                                fontSize: 13,
                                color: greyuserinfo,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      color: greyuserinfo,
                      height: size.height * 0.0005,
                      width: size.width * 0.9,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.07),
                      child: Row(
                        children: [
                          Text(
                            'การขนส่งในไทย',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.07),
                      child: Row(
                        children: [
                          Text(
                            'การขนส่ง Express',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: size.width * 0.1),
                              child: Text(
                                '• DHL',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: headingtext,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 4),
                            Padding(
                              padding: EdgeInsets.only(left: size.width * 0.13),
                              child: Text(
                                'เลขที่ติดตามพัสดุ TH12345678',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: headingtext,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: size.width * 0.08),
                          child: Text(
                            '฿ 180',
                            style: TextStyle(
                                fontSize: 13,
                                color: headingtext,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right, // จัดข้อความให้ชิดขวา
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      color: greyuserinfo,
                      height: size.height * 0.0005,
                      width: size.width * 0.9,
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
                                color: Color(0xff004aad),
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
                          left: size.width * 0.08, right: size.width * 0.055),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'รวมค่าสินค้าทั้งหมด',
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
                          left: size.width * 0.08, right: size.width * 0.055),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.05),
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
                                color: Color(0xff004aad),
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
                          left: size.width * 0.08, right: size.width * 0.055),
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
                          left: size.width * 0.08, right: size.width * 0.055),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'รวมบริการเสริมทั้งหมด',
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
                          left: size.width * 0.08, right: size.width * 0.055),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.05),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.05),
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
                      padding:EdgeInsets.symmetric(horizontal: size.width * 0.05),
                      child: Row(
                        children: [
                          Text(
                            'สรปุยอดรวมที่ชำระแล้ว',
                            style: TextStyle(
                                color: Color(0xff004aad),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            '฿ 0,000.00',
                            style: TextStyle(
                                color: Color(0xff004aad),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
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
                  SizedBox(
                    height: size.height * 0.018,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Row(
                      children: [
                        Text(
                          'เวลาที่ชำระเงินค่าใช้จ่ายส่วนบริการ',
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
                    height: size.height * 0.006,
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
                )),
          ],
        ),
      ),
       bottomNavigationBar: SizedBox(
        height: size.height * 0.08,
        child: BottomAppBar(
          color: white,
          elevation: 10,
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReportFormPage(),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/icons/bottomreport.png',
                          height: size.height * 0.022,
                        ),
                        SizedBox(height: size.height * 0.008),
                        Text('แจ้งปัญหา',
                            style: TextStyle(
                                fontSize: 12,
                                color: headingtext,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
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
                  SizedBox(
                    width: size.width * 0.15,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/icons/printreport.png',
                          height: size.height * 0.022,
                        ),
                        SizedBox(height: size.height * 0.008),
                        Text('เปิดบิล',
                            style: TextStyle(
                                fontSize: 12,
                                color: headingtext,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.04,
                  ),
                  InkWell(
                    onTap: () {
                        //
                    },
                    child: Container(
                      height: size.height * 0.065,
                      width: size.width * 0.485,
                      decoration: BoxDecoration(
                          color: red1, borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'พิมใบเสร็จค่าขนส่ง',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: white),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
