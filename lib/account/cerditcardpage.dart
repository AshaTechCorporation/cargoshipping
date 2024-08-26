import 'package:flutter/material.dart';

class Cerditcardpage extends StatefulWidget {
  const Cerditcardpage({super.key});

  @override
  State<Cerditcardpage> createState() => _CerditcardpageState();
}

class _CerditcardpageState extends State<Cerditcardpage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'บัตรเครดิต/บัตรเดบิต',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: SizedBox(
              height: size.height * 0.25,
              width: size.width * 0.93,
              // color: Colors.blueGrey,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      ),
                      hintText: 'หมายเลขบัตร',
                    ),
                  ),
                  SizedBox(height: size.height * 0.01,),
                  TextField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      ),
                      hintText: 'ชื่อผู้ถือบ้ตร',
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
