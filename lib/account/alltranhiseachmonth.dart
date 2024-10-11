import 'package:cargoshipping/account/widgets/alltranhiseachmontwidget.dart';
import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Alltranhiseachmonth extends StatelessWidget {
  final int index; // รับ index มาจากหน้าก่อน
  const Alltranhiseachmonth({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final detailMonth = transport[index]
        ['detailmonth']; // ดึงข้อมูล detailmonth ของ index นั้นๆ

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: Text(
          'สรุปการสั่งซื้อ',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 17),
        ),
      ),
      body: ListView.builder(
        itemCount: detailMonth.length, // ใช้ length ของ detailmonth
        shrinkWrap: true,
        itemBuilder: (context, detailIndex) {
          final detail =
              detailMonth[detailIndex]; // ดึงข้อมูลแต่ละรายการจาก detailmonth
          return Alltranhiseachmontwidget(
            po: detail['po'],
            succes: detail['succes'],
            cbm: detail['cbm'],
          );
        },
      ),
    );
  }
}
