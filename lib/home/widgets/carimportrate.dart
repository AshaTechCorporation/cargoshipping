import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Carimportratewidget extends StatelessWidget {
  const Carimportratewidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 7,
            child: Container(
              height: size.height * 0.4,
              width: size.width * 0.35,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xfff7cd74), Color(0xfffef7e9)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // หัวข้อ "ทางรถ EK"
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: size.height * 0.025,
                      width: size.width * 0.19,
                      decoration: BoxDecoration(
                        color: Color(0xffffbd38),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'ทางรถ EK',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'ประเภท ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                            children:  <TextSpan>[
                              TextSpan(
                                  text: 'A',
                                  style: TextStyle(color: red1)),
                            ],
                          ),
                        ),
                        Text('สินค้าทั่วไป',style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(height: 8),
                         RichText(
                          text: TextSpan(
                            text: 'ประเภท ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                            children:  <TextSpan>[
                              TextSpan(
                                  text: 'C',
                                  style: TextStyle(color: red1)),
                            ],
                          ),
                        ),
                        Text('สินค้ามาตรฐาน',style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(height: 8),
                         RichText(
                          text: TextSpan(
                            text: 'ประเภท ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                            children:  <TextSpan>[
                              TextSpan(
                                  text: 'D',
                                  style: TextStyle(color: red1)),
                            ],
                          ),
                        ),
                        Text('สินค้ามาตรฐาน',style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(height: 8),
                         RichText(
                          text: TextSpan(
                            text: 'ประเภท ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                            children:  <TextSpan>[
                              TextSpan(
                                  text: 'B',
                                  style: TextStyle(color: red1)),
                            ],
                          ),
                        ),
                        Text('สินค้าอื่นๆ',style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.02,
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: size.height * 0.4,
              width: size.width * 0.22,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xfff7cd74), Color(0xfffef7e9)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                        height: size.height * 0.025,
                        width: size.width * 0.19,
                        decoration: BoxDecoration(
                            color: Color(0xffffbd38),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          'KG',
                          style: TextStyle(
                              color: white, fontWeight: FontWeight.bold),
                        ))),
                  ),
                  Center(child: Text('00')),
                  Center(child: Text('00')),
                  Center(child: Text('00')),
                  Center(child: Text('00')),
                ],
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.02,
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: size.height * 0.4,
              width: size.width * 0.22,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xfff7cd74), Color(0xfffef7e9)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                        height: size.height * 0.025,
                        width: size.width * 0.19,
                        decoration: BoxDecoration(
                            color: Color(0xffffbd38),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          'CBM',
                          style: TextStyle(
                              color: white, fontWeight: FontWeight.bold),
                        ))),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
