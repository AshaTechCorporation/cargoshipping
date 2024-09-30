import 'package:cargoshipping/account/widgets/shipreceiptpage.dart';
import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Detailordersumwidget extends StatelessWidget {
  const Detailordersumwidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.23,
      width: size.width * 0.9,
      child: Padding(
        padding: EdgeInsets.all(size.height * 0.022),
        child: Container(
          height: size.height * 0.18,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: white),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '00/08/67',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'สำเร็จ',
                      style: TextStyle(
                          fontSize: 13, color: red1, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: size.height * 0.06,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Container(
                        color: Colors.transparent,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ชั้นวางพลาสติกในครัว, ชั้นวางของในห้องน้ําแบบไม่มี รูพรุน, สุขโครกติดผนัง, เครื่องใช้ในห้องน้ํา',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              'สีขาวนวล',
                              style: TextStyle(fontSize: 13, color: headingtext),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '¥ 4.88',
                                  style:
                                      TextStyle(fontSize: 13, color: headingtext),
                                ),
                                Text(
                                  'จำนวน50',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Shipreceiptpage()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('ดูเพิ่มเติม'),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Image.asset('assets/icons/downarrowgrey.png')
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.005,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ขนส่งทางรถ',style: TextStyle(
                      color: Colors.black,fontWeight: FontWeight.w600
                    ),),
                    Text('รวมทั้งสิ้น (2 รายการ): ฿ 000',style: TextStyle(
                      color: Colors.black,fontWeight: FontWeight.w600
                    ),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
