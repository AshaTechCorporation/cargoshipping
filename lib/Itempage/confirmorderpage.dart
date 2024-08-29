import 'package:flutter/material.dart';

class Confirmorderpage extends StatefulWidget {
  const Confirmorderpage({super.key});

  @override
  State<Confirmorderpage> createState() => _ConfirmorderpageState();
}

class _ConfirmorderpageState extends State<Confirmorderpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ยืนยันการสั่งซื้อ',style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),),
         bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 1.0,
          ),
        ),
      ),
    );
  }
}