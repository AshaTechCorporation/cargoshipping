import 'package:cargoshipping/cart/widget/customcheck.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/message/widgets/customdivider.dart';
import 'package:cargoshipping/track/widgets/paperlesslistwidget.dart';
import 'package:flutter/material.dart';

class Duringprocesspaper extends StatefulWidget {
  const Duringprocesspaper({super.key});

  @override
  State<Duringprocesspaper> createState() => _DuringprocesspaperState();
}

class _DuringprocesspaperState extends State<Duringprocesspaper> {
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text('นำเข้าถูกต้อง'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: backgroundColor,
          ),
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
              height: size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/redduring.png',
                  height: size.height * 0.04,
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Text(
                  'อยู่ระหว่างนำเนินการ',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Center(
              child: Container(
                height: size.height * 0.053,
                width: size.width * 0.94,
                decoration: BoxDecoration(
                    color: red1, borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.06),
                      child: Text(
                        'Custom no. A99999',
                        style: TextStyle(
                            fontSize: 16,
                            color: white,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'สถานะ:   ',
                      style: TextStyle(
                          color: greyuserinfo,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SukhumvitSet'),
                      children: const <TextSpan>[
                        TextSpan(
                            text: 'xxxxx',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: 'SukhumvitSet')),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    'เข้าโกดังเมื่อ 00 ส.ค. 67',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff004AAD)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            paperlesslistwidget(size: size),
            SizedBox(
              height: size.height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'วันที่รับเรื่อง',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '10 ก.ย. 2567',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'วันที่ส่งฉบับร่าง',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '15 ก.ย. 2567',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'วันที่ส่งฉบับร่าง',
                    style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff004aad),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: size.width * 0.04,
                  ),
                  Text(
                    '15 ก.ย. 2567',
                    style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff004aad),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'วันที่ชำระเงิน',
                    style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff004aad),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: size.width * 0.04,
                  ),
                  Text(
                    '15 ก.ย. 2567',
                    style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff004aad),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomDivider(
              heightFactor: size.height * 0.0000008,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Row(
                children: [
                  Text(
                    'ชื่อผู้นำเข้า',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: size.width * 0.04,
                  ),
                  Text(
                    'บจก. ABCD',
                    style: TextStyle(
                        fontSize: 13, color: red1, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomDivider(
              heightFactor: size.height * 0.0000007,
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.all(size.height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'จัดส่งเอกสารเพื่อนำเข้าถูกต้อง',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text('1. Invoice',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                      Container(
                        height: size.height * 0.034,
                        width: size.width * 0.35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'แสดงเอกสาร Invoice',
                            style: TextStyle(
                                fontSize: 12,
                                color: greyuserinfo,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text('2. Packing list',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                      Container(
                        height: size.height * 0.034,
                        width: size.width * 0.35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'แสดงเอกสาร Packing list',
                            style: TextStyle(
                                fontSize: 12,
                                color: greyuserinfo,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text('3. ฉบับร่าง',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                      Container(
                        height: size.height * 0.034,
                        width: size.width * 0.35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'แสดงเอกสาร ฉบับร่าง',
                            style: TextStyle(
                                fontSize: 12,
                                color: greyuserinfo,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  CustomDivider(),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text(
                    'ค่าบริการในการดำเนินการ',
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff004aad),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text(
                    'ค่าบริการส่วนที่1: ชำระก่อนเริ่มจัดทำ',
                    style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff004aad),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Text(
                        '1. ค่าธรรมเนียมศุลกากร',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        '3,000 บาท',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Row(
                    children: [
                      CustomCheckbox(
                        value: isChecked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            isChecked = newValue!;
                          });
                        },
                      ),
                      Text(
                        '  ทำ FORM E',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        '2,000 บาท',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'ค่าบริการส่วนที่2: ชำระเมื่อได้รับฉบับร่าง',
                    style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff004aad),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Text(
                        '3. ค่าภาษีมูลค่าเพิ่ม',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        '0 บาท',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.007,
                  ),
                  Row(
                    children: [
                      Text(
                        '4. ค่าอากรค่าเข้า',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        '0 บาท',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.007,
                  ),
                  Row(
                    children: [
                      Text(
                        '5. ค่าธรรมเนียมลงทะเบียน',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        '0 บาท',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    height: size.height * 0.035,
                    width: size.width * 0.95,
                    decoration: BoxDecoration(
                        color: Color(0xffccdbef),
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'รวมค่าใช้จ่ายค่าดำเนินพิธีการทั้งหมด (ชำระแล้ว)',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '5,000 บาท',
                            style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff004aad),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    width: size.width * 0.9,
                    height: size.height * 0.2,
                    decoration: BoxDecoration(
                        color: background,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: EdgeInsets.all(size.height * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/icons/alertwarn.png',
                                height: size.height * 0.02,
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              Text(
                                'หมายเหตุ',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            ': หลังจากที่ยืนยันใบขนส่งสินค้าแล้ว จะไม่สามารถแก้ไขได้',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            ': ระยะเวลาดำเนินการ 10-20 วัน ยังไม่รวมระยะเวลาขึ้นทะเบียน Paperless',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            ': ติดตามเอกสารได้ที่ Line: @Tegcargo',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
