import 'dart:developer';

import 'package:cargoshipping/cart/widget/customcheck.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/widgets/WaitPurchase.dart';
import 'package:flutter/material.dart';

class WaitPurchasePage extends StatefulWidget {
  const WaitPurchasePage({super.key});

  @override
  State<WaitPurchasePage> createState() => _WaitPurchasePageState();
}

class _WaitPurchasePageState extends State<WaitPurchasePage> {
  List<double> _dragExtents = [];
  List<bool> _isCheckedList = [];
  bool showBottomAppBar = true;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    // เริ่มต้นค่า _dragExtents และ _isCheckedList ตามจำนวนการ์ด
    final intlength = transportdetail.where((element) => element['status'] == 3).toList();
    for (int i = 0; i < intlength.length; i++) {
      _dragExtents.add(0.0); // ทุกการ์ดเริ่มต้นด้วยการไม่เลื่อน
      _isCheckedList.add(false); // ทุกการ์ดเริ่มต้นด้วย Checkbox ไม่ถูกเลือก
    }
    inspect(_isCheckedList);
  }

  // ฟังก์ชันเพื่อตรวจสอบว่ามี Checkbox มากกว่า 1 ตัวที่ถูกเลือกหรือไม่
  void checkSelectedItems() {
    int selectedCount = _isCheckedList.where((isChecked) => isChecked).length;
    setState(() {
      showBottomAppBar = selectedCount > 1; // แสดง BottomAppBar ถ้ามีการเลือกมากกว่า 1
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredDetails = transportdetail.where((element) => element['status'] == 3).toList();
    // ปรับขนาดของ _dragExtents และ _isCheckedList ตามจำนวน filteredDetails
    if (_dragExtents.length != filteredDetails.length) {
      _dragExtents = List.filled(filteredDetails.length, 0.0);
    }
    if (_isCheckedList.length != filteredDetails.length) {
      _isCheckedList = List.filled(filteredDetails.length, false);
    }
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: white,
        title: Text(
          'รอชำระค่าขนส่ง',
          style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(30.0),
            child: Column(
              children: [
                Container(
                  width: size.width * 0.95,
                  height: size.height * 0.04,
                  decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(13), border: Border.all(color: greyuserinfo, width: 0.5)),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'ค้นหาเลข Tracking, Order, Container ',
                            hintStyle: TextStyle(fontSize: 13, color: greyuserinfo, fontWeight: FontWeight.bold),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(bottom: size.height * 0.018, left: size.width * 0.03),
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
                                style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                            value: _isCheckedList[index],
                            onChanged: (bool? value) {
                              setState(() {
                                _isCheckedList[index] = value ?? false;
                                //checkSelectedItems();
                              });
                            },
                          ),
                          SizedBox(width: size.width * 0.02),
                          Text(
                            'เลือก',
                            style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
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
                            _dragExtents[index] = -size.width * 0.2; // ค้างไว้ที่ 20% จากทางขวา
                            //print(-size.width * 0.2);
                          } else if (_dragExtents[index] > 0) {
                            _dragExtents[index] = 0; // ไม่ให้ลากกลับไปทางขวามากกว่าจุดเริ่มต้น
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
                        offset: Offset(_dragExtents[index], 0), // เลื่อนการ์ดตามการ drag
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                          child: WaitPurchase(
                            size: size,
                            press: () {},
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
                    setState(() {
                      if (isSelected == false) {
                        isSelected = true;
                        for (var i = 0; i < _isCheckedList.length; i++) {
                          _isCheckedList.removeAt(i);
                          _isCheckedList.insert(i, true);
                          _dragExtents.removeAt(i);
                          _dragExtents.insert(i, -82.28571428571429);
                        }
                      } else {
                        isSelected = false;
                        for (var i = 0; i < _isCheckedList.length; i++) {
                          _isCheckedList.removeAt(i);
                          _isCheckedList.insert(i, false);
                          _dragExtents.removeAt(i);
                          _dragExtents.insert(i, 0.0);
                        }
                      }
                    });
                  },
                  child: Container(
                    height: size.height * 0.06,
                    width: size.width * 0.42,
                    decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(15), border: Border.all(width: size.width * 0.003, color: red1)),
                    child: Center(
                      child: Text(
                        'เลือกทั้งหมด',
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
