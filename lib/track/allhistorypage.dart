import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/message/widgets/customdivider.dart';
import 'package:cargoshipping/track/widgets/CardWarehouseWidget.dart';
import 'package:flutter/material.dart';

class Allhistorypage extends StatelessWidget {
  Allhistorypage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              itemCount: transportdetail.length,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                final detail = transportdetail[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: CardWarehouseWidget(
                    size: size,
                    sendtothai:
                        detail['sendtothai'], // ส่งข้อมูลวันที่คาดว่าจะถึงไทย
                    sended: detail['sended'], // ส่งข้อมูลวันที่จัดส่งแล้ว
                    status: detail['status'], // ส่งค่า status จากข้อมูล
                    isPaid: detail['paid'], // ส่งค่าการชำระเงินจากข้อมูล
                    carback: 'assets/icons/carback.png',
                    iconPosition1: 'assets/icons/home_icon.png',
                    iconPosition2: 'assets/icons/icon_red2.png',
                    iconPosition3: 'assets/icons/icon_red3.png',
                    iconPosition4: 'assets/icons/icon_red4.png',
                    iconPosition5: 'assets/icons/delivery.png',
                    orderNo:
                        'Order no. ${detail['order']}', // ส่งข้อมูลเลขที่สั่งซื้อ
                    press: () {
                      print('click press');
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            CustomDivider(),
            SizedBox(
              height: size.height * 0.12,
            ),
          ],
        ),
      ),
    );
  }
}
