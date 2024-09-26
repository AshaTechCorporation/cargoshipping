import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Detailordertrackpage extends StatelessWidget {
  const Detailordertrackpage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text('รายละเอียดคำสั่งซื้อ',style: TextStyle(
          fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold
        ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height:size.height * 0.01,
                ),
                Center(
                  child: Text('คำสั่งซื้อนี้กำลังอยู่ในขั้นตอนการติดต่อกับผู้ขาย',style: TextStyle(
                    fontSize: 13,color: red1
                  ),),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  height: size.height * 0.25,
                  decoration: BoxDecoration(
                    color: white
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/icons/redpin.png'),
                          Text('รหัสนำเข้า AA',style: TextStyle(
                            fontSize: 14,color: red1,fontWeight: FontWeight.bold
                          ),),
                          Spacer(),
                          Container(
                            height: size.height * 0.02,
                            width: size.width * 0.26,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1.0
                              ),
                              borderRadius: BorderRadius.circular(5)
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}