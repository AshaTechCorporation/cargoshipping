import 'package:cargoshipping/account/alltranhisdetail.dart';
import 'package:cargoshipping/account/widgets/ordersumwidget.dart';
import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Alltranspothis extends StatefulWidget {
  const Alltranspothis({super.key});

  @override
  State<Alltranspothis> createState() => _AlltranspothisState();
}

class _AlltranspothisState extends State<Alltranspothis> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: Text(
          'สรุปรายการขนส่ง',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: backgroundColor,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 0.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(size.width * 0.04),
              child: Row(
                children: [
                  Text(
                    'รายการขนส่งนำเข้า',
                    style: TextStyle(
                        fontSize: 13,
                        color: headingtext,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    '2567',
                    style: TextStyle(
                        fontSize: 13,
                        color: headingtext,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: size.width * 0.024,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Image.asset('assets/icons/downarrow.png'),
                  )
                ],
              ),
            ),
            Alltranhisdetail(),
          ],
        ),
      ),
    );
  }
}
