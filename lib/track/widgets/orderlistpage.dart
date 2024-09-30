import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/message/widgets/customdivider.dart';
import 'package:cargoshipping/track/widgets/productcardwidget.dart';
import 'package:flutter/material.dart';

class Orderlistpage extends StatelessWidget {
  const Orderlistpage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'รายละเอียดรายการสินค้า',
          style: TextStyle(
              fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: white,
              // height: size.height * 0.3,
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'รายละเอียดคำสั่งซื้อ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
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
                                    fontSize: 12, fontWeight: FontWeight.bold),
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
                                '¥ 4.88',
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
                                style:
                                    TextStyle(fontSize: 12, color: headingtext),
                              ),
                              SizedBox(
                                height: size.height * 0.028,
                              ),
                              Text(
                                'จำนวน 50',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
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
                                    fontSize: 12, fontWeight: FontWeight.bold),
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
                                '¥ 4.88',
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
                                style:
                                    TextStyle(fontSize: 12, color: headingtext),
                              ),
                              SizedBox(
                                height: size.height * 0.028,
                              ),
                              Text(
                                'จำนวน 50',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ยอดรวมค่าสินค้าทั้งหมด (100 ชิ้น)',
                          style: TextStyle(
                              fontSize: 13,
                              color: headingtext,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
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
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ยอดรวมค่าขนส่งในจีนทั้งหมด',
                          style: TextStyle(
                              fontSize: 13,
                              color: headingtext,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
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
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ยอดรวมค่าที่ชำระแล้ว',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
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
                    height: size.height * 0.009,
                  ),
                  CustomDivider(
                    heightFactor: 0.0003,
                    widthFactor: 0.95,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
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
                    height: size.height * 0.01,
                  ),
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
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'รายละเอียดสินค้าในคลัง',
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
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '1688严选店',
                        style: TextStyle(
                            fontSize: 13,
                            color: headingtext,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.009,
                  ),
                  ProductCardWidget(size: size, greyuserinfo: greyuserinfo, red1: red1),
                  SizedBox(
                    height: size.height * 0.009,
                  ),
                  ProductCardWidget(size: size, greyuserinfo: greyuserinfo, red1: red1),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
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
                        Spacer(),
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
                    height: size.height * 0.004,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'รวม CBM ทั้งหมด',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
