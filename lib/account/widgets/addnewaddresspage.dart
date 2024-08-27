import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Addnewaddresspage extends StatefulWidget {
  const Addnewaddresspage({super.key});

  @override
  State<Addnewaddresspage> createState() => _AddnewaddresspageState();
}

class _AddnewaddresspageState extends State<Addnewaddresspage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'เพิ่มที่อยู่ใหม่',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.grey[300],
              height: 50,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  'ข้อมูลทางติดต่อ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              height: size.height * 0.048,
              color: white,
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'ชื่อ',
                  labelStyle: const TextStyle(),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 10.0),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.004),
            Container(
              height: size.height * 0.048,
              color: white,
              child: TextField(
                controller: _telController,
                decoration: InputDecoration(
                  hintText: 'หมายเลขโทรศัพท์',
                  labelStyle: const TextStyle(),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 10.0),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
