import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Detailorderpage extends StatelessWidget {
  const Detailorderpage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('ข้อมูลการจัดส่ง'),
                Container(
                  height: size.height * 0.025,
                  width: size.width * 0.44,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: red1,
                      width: 1.5
                    ),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Row(
                    children: [
                      Text('ดูหลักฐานการจัดส่งสินค้า',style: TextStyle(
                        color: red1,fontWeight: FontWeight.w600,fontSize: 13
                      ),)
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
