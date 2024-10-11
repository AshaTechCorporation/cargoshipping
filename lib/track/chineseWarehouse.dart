import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/track/widgets/CardWarehouseWidget.dart';
import 'package:cargoshipping/track/widgets/werehousechipage.dart';
import 'package:flutter/material.dart';

class ChineseWarehouse extends StatefulWidget {
  const ChineseWarehouse({super.key});

  @override
  State<ChineseWarehouse> createState() => _ChineseWarehouseState();
}

class _ChineseWarehouseState extends State<ChineseWarehouse> {
  @override
  Widget build(BuildContext context) {
    // กรองข้อมูลให้เฉพาะที่มี status == 1
    final filteredDetails =
        transportdetail.where((element) => element['status'] == 1).toList();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: white,
        title: Text(
          'ถึงโกดังจีน',
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
      // body: SingleChildScrollView(
      //   child: GestureDetector(
      //     onTap: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => Werehousechipage(),
      //         ),
      //       );
      //     },
      //     child: Column(
      //       children: [
      //         SizedBox(
      //           height: size.height * 0.015,
      //         ),
      //         CardWarehouseWidget(
      //           size: size,
      //           status: 1,
      //           isPaid: false,
      //           carback: 'assets/icons/carback.png',
      //           iconPosition1: 'assets/icons/home_icon.png',
      //           iconPosition2: 'assets/icons/icon_grayb1.png',
      //           iconPosition3: 'assets/icons/icon_grayb2.png',
      //           iconPosition4: 'assets/icons/icon_grayb3.png',
      //           iconPosition5: 'assets/icons/correctgrey.png',
      //           orderNo: 'Order no. A423456',
      //           press: () {
      //             print('click press');
      //           },
      //         )
      //       ],
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.015),
            ...filteredDetails.map((detail) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Werehousechipage(),
                    ),
                  );
                },
                child: CardWarehouseWidget(
                  size: size,
                  status: detail['status'],
                  isPaid: detail['paid'],
                  carback: 'assets/icons/carback.png',
                  iconPosition1: 'assets/icons/home_icon.png',
                  iconPosition2: 'assets/icons/icon_grayb1.png',
                  iconPosition3: 'assets/icons/icon_grayb2.png',
                  iconPosition4: 'assets/icons/icon_grayb3.png',
                  iconPosition5: 'assets/icons/correctgrey.png',
                  orderNo: 'Order no. ${detail['order']}',
                  sendtothai:
                      detail['sendtothai'],
                  sended: detail[
                      'sended'],
                  press: () {
                    print('click press');
                  },
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
