import 'package:cargoshipping/cart/widget/customcheck.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/track/widgets/CardWarehouseWidget.dart';
import 'package:cargoshipping/track/widgets/CardWarehousedetail.dart';
import 'package:flutter/material.dart';

class ThaiWarehouse extends StatefulWidget {
  const ThaiWarehouse({super.key});

  @override
  State<ThaiWarehouse> createState() => _ThaiWarehouseState();
}

class _ThaiWarehouseState extends State<ThaiWarehouse> {
  List<double> _dragExtents = [];
  List<bool> _isCheckedList = [];
  bool showBottomAppBar = false;

  // ฟังก์ชันเพื่อตรวจสอบว่ามี Checkbox มากกว่า 1 ตัวที่ถูกเลือกหรือไม่
  void checkSelectedItems() {
    int selectedCount = _isCheckedList.where((isChecked) => isChecked).length;
    setState(() {
      showBottomAppBar =
          selectedCount > 1; // แสดง BottomAppBar ถ้ามีการเลือกมากกว่า 1
    });
  }

  @override
  void initState() {
    super.initState();
    // เริ่มต้นค่า _dragExtents และ _isCheckedList ตามจำนวนการ์ด
    for (int i = 0; i < transportdetail.length; i++) {
      _dragExtents.add(0.0); // ทุกการ์ดเริ่มต้นด้วยการไม่เลื่อน
      _isCheckedList.add(false); // ทุกการ์ดเริ่มต้นด้วย Checkbox ไม่ถูกเลือก
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredDetails =
        transportdetail.where((element) => element['status'] == 3).toList();
    // ปรับขนาดของ _dragExtents และ _isCheckedList ตามจำนวน filteredDetails
    if (_dragExtents.length != filteredDetails.length) {
      _dragExtents =
          List.filled(filteredDetails.length, 0.0);
    }
    if (_isCheckedList.length != filteredDetails.length) {
      _isCheckedList =
          List.filled(filteredDetails.length, false);
    }
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: white,
        title: Text(
          'ถึงโกดังไทย',
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
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => Cardwarehousedetail(),
            //       ),
            //     );
            //   },
            //   child: CardWarehouseWidget(
            //     size: size,
            //     status: 3,
            //     isPaid: false,
            //     carback: 'assets/icons/carback.png',
            //     iconPosition1: 'assets/icons/home_icon.png',
            //     iconPosition2: 'assets/icons/icon_red2.png',
            //     iconPosition3: 'assets/icons/icon_red3.png',
            //     iconPosition4: 'assets/icons/icon_grayb3.png',
            //     iconPosition5: 'assets/icons/correctgrey.png',
            //     orderNo: 'Order no. A423456',
            //     press: () {
            //       print('click press');
            //     },
            //   ),
            // ),
            // SizedBox(
            //   height: size.height * 0.01,
            // ),
            // GestureDetector(
            //   onHorizontalDragUpdate: (details) {
            //     setState(() {
            //       // ตรวจสอบทิศทางการลาก และควบคุมการเลื่อนไปทางซ้าย (จากขวาไปซ้าย)
            //       _dragExtent += details.delta.dx;

            //       // ลากไปทางซ้ายได้แค่ 20% ของหน้าจอ (ทำให้ _dragExtent เป็นลบ)
            //       if (_dragExtent < -size.width * 0.2) {
            //         _dragExtent = -size.width * 0.2; // ค้างไว้ที่ 20% จากทางขวา
            //       } else if (_dragExtent > 0) {
            //         _dragExtent = 0; // ไม่ให้ลากกลับไปทางขวามากกว่าจุดเริ่มต้น
            //       }
            //     });
            //   },
            //   onHorizontalDragEnd: (details) {
            //     // เมื่อหยุดลาก ให้ค้างไว้ที่ตำแหน่งปัจจุบัน ไม่กลับไปที่เดิม
            //     setState(() {
            //       // ไม่มีอะไรต้องทำในส่วนนี้ ค้างไว้ที่ตำแหน่งล่าสุด
            //     });
            //   },
            //   child: Stack(
            //     children: [
            //       // Background ที่เป็น Checkbox ตรงกลาง
            //       Positioned.fill(
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.end,
            //           children: [

            //             SizedBox(
            //               width: size.width * 0.02,
            //             ),
            //             Text(
            //               'เลือก',
            //               style: TextStyle(
            //                   fontSize: 15,
            //                   color: Colors.black,
            //                   fontWeight: FontWeight.bold),
            //             ),
            //             SizedBox(
            //               width: size.width * 0.02,
            //             ),
            //           ],
            //         ),
            //       ),
            //       Transform.translate(
            //         offset: Offset(_dragExtent, 0), // ย้าย widget ตามการ drag
            //         child: CardWarehouseWidget(
            //           size: size,
            //           status: 3,
            //           isPaid: false,
            // carback: 'assets/icons/carback.png',
            // iconPosition1: 'assets/icons/home_icon.png',
            // iconPosition2: 'assets/icons/icon_red2.png',
            // iconPosition3: 'assets/icons/icon_red3.png',
            // iconPosition4: 'assets/icons/icon_grayb3.png',
            // iconPosition5: 'assets/icons/correctgrey.png',
            //           orderNo: 'Order no. A423456',
            //           press: () {
            //             print('click press');
            //           },
            //         ),
            //       ),
            //     ],
            //   ),
            // )
            // ...filteredDetails.map((detail) {
            //   return GestureDetector(
            //     onTap: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => Cardwarehousedetail(),
            //         ),
            //       );
            //     },
            //     child: CardWarehouseWidget(
            //       size: size,
            //       sendtothai:
            //           detail['sendtothai'], // ส่งข้อมูลวันที่คาดว่าจะถึงไทย
            //       sended: detail['sended'], // ส่งข้อมูลวันที่จัดส่งแล้ว
            //       status: detail['status'], // ส่งค่า status จากข้อมูล
            //       isPaid: detail['paid'], // ส่งค่าการชำระเงินจากข้อมูล
            //       carback: 'assets/icons/carback.png',
            //       iconPosition1: 'assets/icons/home_icon.png',
            //       iconPosition2: 'assets/icons/icon_red2.png',
            //       iconPosition3: 'assets/icons/icon_red3.png',
            //       iconPosition4: 'assets/icons/icon_grayb3.png',
            //       iconPosition5: 'assets/icons/correctgrey.png',
            //       orderNo:
            //           'Order no. ${detail['order']}', // ส่งข้อมูลเลขที่สั่งซื้อ
            //       press: () {
            //         print('click press');
            //       },
            //     ),
            //   );
            // }).toList(), // สร้าง widget ตามจำนวนรายการที่กรองได้
            ...filteredDetails.asMap().entries.map((entry) {
              int index = entry.key; // ใช้ index จาก key ของ entry
              var detail = entry.value; // ข้อมูลแต่ละการ์ด
              return Stack(
                children: [
                  // Background ที่เป็น Checkbox
                  Positioned.fill(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomCheckbox(
                          value: _isCheckedList[
                              index],
                          onChanged: (bool? value) {
                            setState(() {
                              _isCheckedList[index] = value ??
                                  false;
                              checkSelectedItems();
                            });
                          },
                        ),
                        SizedBox(width: size.width * 0.02),
                        Text(
                          'เลือก',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: size.width * 0.02),
                      ],
                    ),
                  ),

                  // การ์ดที่เลื่อนได้
                  GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      setState(() {
                        // ตรวจสอบทิศทางการลาก และควบคุมการเลื่อนไปทางซ้าย (จากขวาไปซ้าย) สำหรับการ์ดนี้
                        _dragExtents[index] += details.delta.dx;

                        // ลากไปทางซ้ายได้แค่ 20% ของหน้าจอ (ทำให้ _dragExtent เป็นลบ)
                        if (_dragExtents[index] < -size.width * 0.2) {
                          _dragExtents[index] =
                              -size.width * 0.2; // ค้างไว้ที่ 20% จากทางขวา
                        } else if (_dragExtents[index] > 0) {
                          _dragExtents[index] =
                              0; // ไม่ให้ลากกลับไปทางขวามากกว่าจุดเริ่มต้น
                        }
                      });
                    },
                    onHorizontalDragEnd: (details) {
                      // เมื่อหยุดลาก ให้ค้างไว้ที่ตำแหน่งปัจจุบัน ไม่กลับไปที่เดิม
                      setState(() {
                        // ไม่มีอะไรต้องทำในส่วนนี้ ค้างไว้ที่ตำแหน่งล่าสุด
                      });
                    },
                    child: Transform.translate(
                      offset: Offset(
                          _dragExtents[index], 0), // เลื่อนการ์ดตามการ drag
                      child: GestureDetector(
                        onTap: () {
                          // เมื่อการ์ดถูกกด นำทางไปยังหน้า Cardwarehousedetail
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Cardwarehousedetail(),
                            ),
                          );
                        },
                        child: CardWarehouseWidget(
                          size: size,
                          sendtothai: detail[
                              'sendtothai'], // ส่งข้อมูลวันที่คาดว่าจะถึงไทย
                          sended: detail['sended'], // ส่งข้อมูลวันที่จัดส่งแล้ว
                          status: detail['status'], // ส่งค่า status จากข้อมูล
                          isPaid: detail['paid'], // ส่งค่าการชำระเงินจากข้อมูล
                          carback: 'assets/icons/carback.png',
                          iconPosition1: 'assets/icons/home_icon.png',
                          iconPosition2: 'assets/icons/icon_red2.png',
                          iconPosition3: 'assets/icons/icon_red3.png',
                          iconPosition4: 'assets/icons/icon_grayb3.png',
                          iconPosition5: 'assets/icons/correctgrey.png',
                          orderNo:
                              'Order no. ${detail['order']}', // ส่งข้อมูลเลขที่สั่งซื้อ
                          press: () {
                            print('click press');
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ],
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: showBottomAppBar,
        child: SizedBox(
          height: size.height * 0.08,
          child: BottomAppBar(
            color: white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        Future.delayed(Duration(seconds: 2), () {
                          Navigator.of(context).pop();
                        });
                        return AlertDialog(
                          title: Text('เปิดบิล'),
                          content: Text('เปิดบิลเสร็จสิ้น'),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: size.height * 0.06,
                    width: size.width * 0.42,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(15),
                        border:
                            Border.all(width: size.width * 0.003, color: red1)),
                    child: Center(
                      child: Text(
                        'เลือกรวมกระสอบ',
                        style: TextStyle(
                          color: red1,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
