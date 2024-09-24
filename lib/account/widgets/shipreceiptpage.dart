import 'package:cargoshipping/account/mapTest.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/widgets/CardImportProductWidget.dart';
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
                        Text('รายการพัสดุเข้าคลัง',style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  CardImportProductWidget(size: size),
                ],
              )),
          ],
        ),
      ),
    );
  }
}
