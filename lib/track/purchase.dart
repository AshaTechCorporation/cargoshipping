import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class purchase extends StatelessWidget {
  const purchase({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 358,
        height: 168,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.015,
            ),
            Container(
              width: 334,
              height: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Order no. A223456',
                    style: TextStyle(
                        fontSize: 14,
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
              width: 308,
              height: 33,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              color: red1
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'ชำระเงินการสั่งซื้อ',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              width: 334,
              height: 21,
              child: Row(
                children: [
                  Text('ประเภท สินค้าสั่งซื้อ '),
                  Spacer(),
                  Text('สั่งซื้อเมื่อ 28 ก.ค.  67')
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              width: 334,
              height: 25,
              child: Row(
                children: [
                  Image.asset('assets/icons/ship_icon.png'),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Text('ขนส่งทางเรือ'),
                  Spacer(),
                  Text('รายละเอียด'),
                  Icon(Icons.arrow_forward_ios,color: arrowcolor,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}