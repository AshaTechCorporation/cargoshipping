import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Shippingcalpage extends StatefulWidget {
  const Shippingcalpage({super.key});

  @override
  State<Shippingcalpage> createState() => _ShippingcalpageState();
}

class _ShippingcalpageState extends State<Shippingcalpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('วิธีคำนวณค่าขนส่ง'),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              width: 358,
              height: 54,
              decoration: BoxDecoration(
                  color: Colors.pink[300],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Center(
                  child: Text(
                'วิธีคำนวณค่าขนส่ง',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Container(
            height: 230,
            width: 358,
            child: Column(
              children: [
                Row(
                  children: [
                    Text('คำนวณปริมาตร (CBM)'),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'ความกว้าง(cm)',
                    border: UnderlineInputBorder(),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'ความยาว(cm)',
                    border: UnderlineInputBorder(),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'ความสูง(cm)',
                    border: UnderlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'ราคาขนส่ง',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      '0 บาท',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: red1),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text('หรือ'),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 150,
            width: 358,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'คำนวณน้ำหนัก (kg)',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'น้ำหนักจริง(kg)',
                    border: UnderlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'ราคาขนส่ง',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      '0 บาท',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: red1),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.end, // จัดให้ข้อความอยู่ชิดขวา
              children: [
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.end, // จัดให้ข้อความใน Column ชิดขวา
                  children: [
                    Text(
                      '**น้ำหนัก / CBM ถ้าผลลัพธ์ มากกว่า 250 kg/CBM',
                      textAlign: TextAlign.end, // จัดให้ข้อความชิดขวา
                    ),
                    Text(
                      'สินค้าชิ้นนั้นจะถูกคิดเป็น เรทกิโล',
                      textAlign: TextAlign.end, // จัดให้ข้อความชิดขวา
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.end, // จัดให้ข้อความอยู่ชิดขวา
              children: [
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.end, // จัดให้ข้อความใน Column ชิดขวา
                  children: [
                    Text(
                      '**น้ำหนัก / CBM ถ้าผลลัพธ์ น้อยกว่า 250 kg/CBM',
                      textAlign: TextAlign.end, // จัดให้ข้อความชิดขวา
                    ),
                    Text(
                      'สินค้าชิ้นนั้นจะถูกคิดเป็น เรทกิโล',
                      textAlign: TextAlign.end, // จัดให้ข้อความชิดขวา
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
