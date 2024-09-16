import 'package:cargoshipping/account/widgets/Detailordersumwidget.dart';
import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Detailordersumpage extends StatelessWidget {
  const Detailordersumpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'สรุปการสั่งซื้อ',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 17),
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Detailordersumwidget();
        },
        
      ),
    );
  }
}
