import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Cerditcardpage extends StatefulWidget {
  const Cerditcardpage({super.key});

  @override
  State<Cerditcardpage> createState() => _CerditcardpageState();
}

bool _isChecked = false;

class _CerditcardpageState extends State<Cerditcardpage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'บัตรเครดิต/บัตรเดบิต',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 1.0,
          ),
        ),
        backgroundColor: background,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.02,),
            Container(
              height: size.height * 0.28,
              width: size.width * 0.95,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'หมายเลขบัตร',
                      labelStyle: TextStyle(fontSize: 15),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                           Image.asset('assets/icons/allcreditcard.png'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.009,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'ชื่อผู้ถือบัตร',
                      labelStyle: TextStyle(fontSize: 15)
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.002,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Expiration (MM/YY)',
                            labelStyle: TextStyle(fontSize: 15)
                          ),
                        ),
                      ),
                      SizedBox(width: size.width * 0.09),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'CVV (เลข 3 ตัวด้านหลังบัตร)',
                            labelStyle: TextStyle(fontSize: 15)
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02,),
            Container(
              height: size.height * 0.07,
              width: size.width * 0.95,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'บันทึกบัตรไว้ภายหลัง',
                      style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),
                    ),
                  ),
                  Checkbox(
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value ?? false;
                      });
                    },
                    side: BorderSide(color: red1 , width: size.width * 0.041),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
