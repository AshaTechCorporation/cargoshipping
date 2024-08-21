import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class itemclosetoyou extends StatelessWidget {
  const itemclosetoyou({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 358,
        height: 200,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
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
                    'Order no. A423456',
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
              height: 55,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: red1,
                        radius: 15,
                        child: Icon(
                          Icons.local_shipping,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      SizedBox(
                        width: 10,
                        child: Divider(
                          color: red1,
                          thickness: 2,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      CircleAvatar(
                        backgroundColor: red1,
                        radius: 15,
                        child: Icon(
                          Icons.store,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      SizedBox(
                        width: 10,
                        child: Divider(
                          color: red1,
                          thickness: 2,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      CircleAvatar(
                        backgroundColor: red1,
                        radius: 15,
                        child: Icon(
                          Icons.payment,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      SizedBox(
                        width: 10,
                        child: Divider(
                          color: red1,
                          thickness: 2,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      CircleAvatar(
                        backgroundColor: red1,
                        radius: 15,
                        child: Icon(
                          Icons.fire_truck,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Text(
                        'กำลังจัดส่งถึงคุณ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: red1),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        radius: 15,
                        child: Icon(
                          Icons.check_circle,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
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
                  Image.asset('assets/icons/icon_car.png'),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Text('ขนส่งทางรถ'),
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
