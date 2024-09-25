import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Tagunlimited extends StatelessWidget {
  const Tagunlimited({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TEG UNLIMITED',
          style: TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // จัดชิดซ้าย
          children: [
            Container(
              height: size.height * 0.14,
              color: pinkmessSixper.withOpacity(0.06),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'สิทธิประโยชน์',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                        height: size.height * 0.01), // ระยะห่างระหว่างสองบรรทัด
                    Text(
                      'รับส่วนลดทุกบริการ TEG CARGO สิทธิประโยชน์พิเศษ และอีกมากมาย',
                      style: TextStyle(
                          fontSize: 13,
                          color: greyuserinfo,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/freeshipping.png',
                          height: size.height * 0.06,
                        ),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        Text(
                          'ส่งในกทม. และปริมณฑล ฟรี',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Image.asset('assets/icons/freevax.png',
                        height: size.height * 0.06,),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        Text(
                          'ฟรีค่าธรรมเนียมฝากสั่ง',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Image.asset('assets/icons/freeopening.png',
                        height: size.height * 0.06,),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        Text(
                          'ฟรีค่าเปิดกระสอบขั้นต่ำการนำเข้า',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Image.asset('assets/icons/tegreward.png',
                        height: size.height * 0.06,),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        Expanded(
                          child: Text(
                            'รับ TEG REWARDS 1 คะแนน เมื่อนำเข้าครบทุกๆ 5,000 บาท',
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Container(
                      height: size.height * 0.15,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 2.5,
                        ),
                      ),
                      padding: EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child:
                                    Image.asset('assets/images/greencheck.png',
                                    height: size.height * 0.025,),
                              ),
                              SizedBox(width: size.width * 0.03),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'ทดลองใช้งานฟรี 3 เดือน',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: size.height * 0.004),
                                    Text(
                                      'เราจะแจ้งให้คุณทราบก่อนสิ้นสุดการทดลองใช้ 7 วัน',
                                      style: TextStyle(
                                        color: greyuserinfo,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.019),
                          Row(
                            children: [
                              Image.asset('assets/images/greencheck.png',
                              height: size.height * 0.025,),
                              SizedBox(width: size.width * 0.03),
                              Text(
                                'ยกเลิกได้ทุกเมื่อ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    Container(
                      height: size.height * 0.07,
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                          color: red1, borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'ลองใช้เลย',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: white),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
