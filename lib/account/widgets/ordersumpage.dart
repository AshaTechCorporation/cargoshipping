import 'package:cargoshipping/account/widgets/ordersumwidget.dart';
import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Ordersumpage extends StatefulWidget {
  const Ordersumpage({super.key});

  @override
  State<Ordersumpage> createState() => _OrdersumpageState();
}

class _OrdersumpageState extends State<Ordersumpage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: Text(
          'สรุปการสั่งซื้อ',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'รายการสั่งซื้อ',
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
            OrderSum(),
          ],
        ),
      ),
    );
  }
}
