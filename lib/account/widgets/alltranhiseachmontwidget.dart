import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Alltranhiseachmontwidget extends StatelessWidget {
  final String po; // ค่า PO
  final String succes; // ค่า succes
  final String cbm; // ค่า cbm

  const Alltranhiseachmontwidget({
    super.key,
    required this.po,
    required this.succes,
    required this.cbm,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Container(
        height: size.height * 0.085,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 0.1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.015,
                  left: size.width * 0.03,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'PO NO. ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: po, // ใช้ค่า po ที่รับมา
                                style: TextStyle(
                                  color: red1,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.012), // เว้นระยะห่าง
                    Text(
                      'สำเร็จเมื่อ $succes',
                      style: TextStyle(
                        fontSize: 13,
                        color: headingtext,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // ข้อความทางขวา (CBM)
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: size.width * 0.02),
                  child: Image.asset(
                    'assets/icons/rightredarrow.png',
                    width: size.width * 0.06,
                    height: size.height * 0.03,
                  ),
                ),
                SizedBox(height: size.height * 0.005), // เว้นบรรทัด
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'CBM ทั้งหมด $cbm CBM', // ใช้ค่า cbm ที่รับมา
                      style: TextStyle(
                        fontSize: 13,
                        color: headingtext,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
