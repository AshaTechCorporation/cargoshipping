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
              padding: EdgeInsets.all(size.height * 0.014),
              child: Row(
                children: [
                  Text('รายการขนส่งนำเข้า',style: TextStyle(fontSize: 13,color: headingtext,fontWeight: FontWeight.bold),),
                  Spacer(),
                  Text('2567',style: TextStyle(fontSize: 13,color: headingtext,fontWeight: FontWeight.bold),),
                  SizedBox(width: size.width * 0.024,),
                  Padding(
                    padding: EdgeInsets.only(right: size.width * 0.025),
                    child: Image.asset('assets/icons/downarrow.png'),
                  )
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
