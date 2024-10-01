import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Paperlesswidget extends StatelessWidget {
  Paperlesswidget(
      {super.key,
      required this.size,
      required this.press,
      required this.carback,
      required this.cusNo,
      required this.iconPosition1,
      required this.status,
      required this.iconPosition2,
      required this.iconPosition3,
      required this.iconPosition4,
      required this.iconPosition5});

  final Size size;
  VoidCallback press;
  final String carback;
  final String cusNo;
  final String iconPosition1;
  final String iconPosition2;
  final String iconPosition3;
  final String iconPosition4;
  final String iconPosition5;
  final int status;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.21,
      child: Center(
        child: Stack(
          children: [
            Positioned(
              bottom: size.height * 0.01,
              right: size.width * 0.02,
              child: Opacity(
                opacity: 0.5,
                child: Image.asset(
                  carback,
                  width: size.width * 0.28,
                  height: size.height * 0.1,
                ),
              ),
            ),
            Container(
              width: size.width * 0.95,
              height: status == 1 || status == 5 ? size.height * 0.23 : size.height * 0.3,
              decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: 0.5)),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Container(
                    width: size.width * 0.85,
                    height: size.height * 0.045,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.black,
                          width: 0.5,
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          cusNo,
                          style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            iconPosition1,
                            height: size.height * 0.037,
                          ),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          status == 1
                              ? SizedBox()
                              : SizedBox(
                                  width: 10,
                                  child: Divider(
                                    color: red1,
                                    thickness: 2,
                                  ),
                                ),
                          status == 1
                              ? SizedBox(
                                  width: size.width * 0.26,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'นำเข้าเอกสาร',
                                        style: TextStyle(fontSize: 12, color: red1, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'PO no. 098872231',
                                        style: TextStyle(fontSize: 12, color: greyuserinfo, fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )
                              : SizedBox(),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          Image.asset(iconPosition2, height: size.height * 0.037),
                          SizedBox(
                            width: status == 2 ? size.width * 0.02 : size.width * 0.01,
                          ),
                          status == 2
                              ? SizedBox()
                              : status == 3 || status == 4 || status == 5
                                  ? SizedBox(
                                      width: 10,
                                      child: Divider(
                                        color: red1,
                                        thickness: 2,
                                      ),
                                    )
                                  : SizedBox(
                                      width: 10,
                                      child: Divider(
                                        color: Colors.grey[500],
                                        thickness: 2,
                                      ),
                                    ),
                          status == 2
                              ? SizedBox(
                                  width: size.width * 0.3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'รอตรวจสอบเอกสาร',
                                        style: TextStyle(fontSize: 12, color: red1, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'วันที่รับเรื่อง 26 ก.ค. 67',
                                        style: TextStyle(fontSize: 12, color: greyuserinfo, fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )
                              : SizedBox(),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          Image.asset(iconPosition3, height: size.height * 0.037),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          status == 3
                              ? SizedBox()
                              : status == 4 || status == 5
                                  ? SizedBox(
                                      width: 10,
                                      child: Divider(
                                        color: red1,
                                        thickness: 2,
                                      ),
                                    )
                                  : SizedBox(
                                      width: 10,
                                      child: Divider(
                                        color: Colors.grey[500],
                                        thickness: 2,
                                      ),
                                    ),
                          status == 3
                              ? SizedBox(
                                  width: size.width * 0.21,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'รอชำระค่าภาษี',
                                        style: TextStyle(fontSize: 12, color: red1, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'ยอด 0,000 บาท',
                                        style: TextStyle(fontSize: 12, color: greyuserinfo, fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )
                              : SizedBox(),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          Image.asset(iconPosition4, height: size.height * 0.037),
                          SizedBox(
                            width: status == 4 ? size.width * 0.02 : size.width * 0.01,
                          ),
                          status == 4
                              ? SizedBox()
                              : status == 5
                                  ? SizedBox(
                                      width: 10,
                                      child: Divider(
                                        color: red1,
                                        thickness: 2,
                                      ),
                                    )
                                  : SizedBox(
                                      width: 10,
                                      child: Divider(
                                        color: Colors.grey[500],
                                        thickness: 2,
                                      ),
                                    ),
                          status == 4
                              ? SizedBox(
                                  width: size.width * 0.251,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'อยู่ระหว่างดำเนินการ',
                                        style: TextStyle(fontSize: 12, color: red1, fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )
                              : SizedBox(),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          Image.asset(iconPosition5, height: size.height * 0.037),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          status == 5
                              ? SizedBox(
                                  width: size.width * 0.25,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'เสร็จสิ้น',
                                        style: TextStyle(fontSize: 12, color: red1, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'เลขที่พัสดุ 012345',
                                        style: TextStyle(fontSize: 12, color: headingtext, fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                    child: Row(
                      children: [
                        Text(
                          'ประเภท นำเข้าถูกต้อง ',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        Spacer(),
                        Text(
                          'นำเข้าวันที่ 25 ก.ค. 67',
                          style: TextStyle(fontSize: 13),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/byredcar.png',
                          height: size.height * 0.03,
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Text(
                          'ขนส่งทางรถ',
                          style: TextStyle(fontSize: 13, color: greyuserinfo, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: press,
                          child: Row(
                            children: [
                              Text(
                                'รายละเอียด',
                                style: TextStyle(color: red1, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              Image.asset('assets/icons/rightarrow.png'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: size.height * 0.02,
                  // ),
                  // status == 1 || status == 5
                  //     ? SizedBox()
                  //     : Padding(
                  //         padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Column(
                  //               mainAxisAlignment: MainAxisAlignment.start,
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Text(
                  //                   'สินค้าประเภท A จำนวน 5 ชิ้น',
                  //                   style: TextStyle(fontSize: 13, color: greyuserinfo, fontWeight: FontWeight.bold),
                  //                 ),
                  //                 Text(
                  //                   'ค่าขนส่ง 0,000 บาท',
                  //                   style: TextStyle(fontSize: 13, color: red1, fontWeight: FontWeight.bold),
                  //                 ),
                  //               ],
                  //             ),
                  //             // GestureDetector(
                  //             //   onTap: () {},
                  //             //   child: Container(
                  //             //     height: size.height * 0.05,
                  //             //     width: size.width * 0.18,
                  //             //     decoration: BoxDecoration(
                  //             //       borderRadius: BorderRadius.circular(10),
                  //             //       color: red1,
                  //             //     ),
                  //             //     child: Center(
                  //             //       child: Text(
                  //             //         'ชำระเงิน',
                  //             //         style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                  //             //       ),
                  //             //     ),
                  //             //   ),
                  //             // ),
                  //           ],
                  //         ),
                  //       ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
