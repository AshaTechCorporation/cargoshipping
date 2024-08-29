import 'package:cargoshipping/account/widgets/transportwidget.dart';
import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Transportpage extends StatefulWidget {
  const Transportpage({super.key});

  @override
  State<Transportpage> createState() => _TransportpageState();
}

class _TransportpageState extends State<Transportpage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: Text(
          'สรุปการขนส่ง',
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
                  Text('รายการขนส่งนำเข้า'),
                  Spacer(),
                  Text(' 2567'),
                  Icon(Icons.arrow_drop_down_outlined)
                ],
              ),
            ),
            Transportwidget(),
          ],
        ),
      ),
    );
  }
}
