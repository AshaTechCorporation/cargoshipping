import 'package:cargoshipping/account/widgets/shipreceiptpage.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/track/widgets/CardWarehouseWidget.dart';
import 'package:flutter/material.dart';

class SuccessfulDelivery extends StatefulWidget {
  const SuccessfulDelivery({super.key});

  @override
  State<SuccessfulDelivery> createState() => _SuccessfulDeliveryState();
}

class _SuccessfulDeliveryState extends State<SuccessfulDelivery> {
  @override
  Widget build(BuildContext context) {
    final filteredDetails =
        transportdetail.where((element) => element['status'] == 5).toList();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: white,
        title: Text(
          'จัดส่งสำเร็จ',
          style: TextStyle(
              fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(30.0),
            child: Column(
              children: [
                Container(
                  width: size.width * 0.95,
                  height: size.height * 0.04,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(color: greyuserinfo, width: 0.5)),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'ค้นหาเลข Tracking, Order, Container ',
                            hintStyle: TextStyle(
                                fontSize: 13,
                                color: greyuserinfo,
                                fontWeight: FontWeight.bold),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                bottom: size.height * 0.018,
                                left: size.width * 0.03),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: size.height * 0.037,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: red1,
                            ),
                            child: Center(
                              child: Text(
                                'ค้นหา',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  color: Colors.grey,
                  height: size.height * 0.0003,
                  // width: size.width * 0.9,
                )
              ],
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.015,
            ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => Shipreceiptpage()));
            //   },
            //   child: CardWarehouseWidget(
            //     size: size,
            //     status: 5,
            //     isPaid: false,
            //     carback: 'assets/icons/carback.png',
            //     iconPosition1: 'assets/icons/home_icon.png',
            //     iconPosition2: 'assets/icons/icon_red2.png',
            //     iconPosition3: 'assets/icons/icon_red3.png',
            //     iconPosition4: 'assets/icons/icon_red4.png',
            //     iconPosition5: 'assets/icons/delivery.png',
            //     orderNo: 'Order no. A423456',
            //     press: () {
            //       print('click press');
            //     },
            //   ),
            // ),
            ...filteredDetails.map((detail) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Shipreceiptpage()));
                },
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
                  pressPrice: (){},
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
