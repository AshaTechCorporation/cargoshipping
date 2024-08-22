import 'package:cargoshipping/track/mappage.dart';
import 'package:flutter/material.dart';

class Selldetail extends StatefulWidget {
  const Selldetail({super.key});

  @override
  State<Selldetail> createState() => _SelldetailState();
}

class _SelldetailState extends State<Selldetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'รายละเอียดคำสั่งซื้อ',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(14.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.location_on, color: Colors.redAccent),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ที่อยู่สำหรับจัดส่ง',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0)),
                            SizedBox(height: 8.0),
                            Text('Girati Sukapat  097 123 4567'),
                            Text('111/222 xxxx'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // เส้น Divider ระหว่าง Container ทั้งสอง
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                    height: 14.0,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  // decoration: BoxDecoration(
                  //   color: Colors.white,
                  //   borderRadius: BorderRadius.circular(8.0),
                  //   boxShadow: [
                  //     BoxShadow(
                  //       color: Colors.grey.withOpacity(0.5),
                  //       spreadRadius: 2,
                  //       blurRadius: 5,
                  //     ),
                  //   ],
                  // ),
                  child: InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) =>  MapSample()),
                      // );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.directions_boat, color: Colors.redAccent),
                        SizedBox(width: 8.0),
                        Column(
                          children: [
                            Text('รูปแบบการขนส่ง'),
                            Text('ขนส่งทางเรือ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),

          // รายละเอียดการสั่งซื้อ
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('รายละเอียดคำสั่งซื้อ',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                SizedBox(height: 16.0),
                // สินค้า 1
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      color: Colors.grey[300],
                      child: Image.asset(
                          'assets/images/image 23.png'), // ใส่รูปภาพสินค้า
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ชั้นวางพลาสติกในครัว, ชั้นวางของในครัว',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('168฿/ชิ้น จำนวน 50'),
                          Text('คะแนน 4.88',
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                // สินค้า 2
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      color: Colors.grey[300],
                      child: Image.asset(
                          'assets/images/image 23.png'), // ใส่รูปภาพสินค้า
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ชั้นวางพลาสติกในครัว, ชั้นวางของในครัว',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('168฿/ชิ้น จำนวน 50'),
                          Text('คะแนน 4.88',
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),

          // ยอดรวมคำสั่งซื้อทั้งหมด
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ยอดรวมคำสั่งซื้อทั้งหมด (100 ชิ้น): 48.18 ฿',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ค่าบริการ 1'),
                    Text('฿ 100'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ค่าบริการ 2'),
                    Text('฿ 100'),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ยอดรวมการสั่งซื้อทั้งหมด',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('฿ 200',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),

          // ปุ่มเลือกวิธีการชำระเงิน
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(),
              onPressed: () {
                // การกระทำเมื่อกดปุ่ม
              },
              child: Text(
                'เลือกวิธีการชำระเงิน',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
