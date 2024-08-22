import 'package:flutter/material.dart';

class Addnewaddresspage extends StatefulWidget {
  const Addnewaddresspage({super.key});

  @override
  State<Addnewaddresspage> createState() => _AddnewaddresspageState();
}

class _AddnewaddresspageState extends State<Addnewaddresspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'เพิ่มที่อยู่ใหม่',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
        ),
      ),
    );
  }
}
