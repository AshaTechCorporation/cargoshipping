import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Transportwidget extends StatefulWidget {
  const Transportwidget({super.key});

  @override
  State<Transportwidget> createState() => _TransportwidgetState();
}

class _TransportwidgetState extends State<Transportwidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    final iconSize = size.width * 0.06;
    final paddingHorizontal = size.width * 0.025;
    final paddingVertical = size.height * 0.01;
    final marginVertical = size.height * 0.003;
    final marginHorizontal = size.width * 0.025;

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: transport.length,
      itemBuilder: (context, index) {
        final item = transport[index];
        return Container(
          height: size.height *0.07,
          margin: EdgeInsets.symmetric(vertical: marginVertical, horizontal: marginHorizontal),
          padding: EdgeInsets.symmetric(vertical: paddingVertical, horizontal: paddingHorizontal),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(size.width * 0.03),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: size.width * 0.005,
                blurRadius: size.width * 0.03,
                offset: Offset(0, size.height * 0.003),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/icons/ordermont.png',
                color: red1,
                width: iconSize,
                height: iconSize,
              ),
              SizedBox(width: size.width * 0.025),
              Expanded(
                child: Text(
                  item['month'],
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        item['amount'],
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: size.height * 0.005),
                      GestureDetector(
                        onTap: () {
                          print('คลิกที่: ${item['month']}');
                        },
                        child: Text(
                          item['detailLink'],
                          style: TextStyle(color: Colors.red, fontSize: 13,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(width: size.width * 0.02), // ระยะห่างระหว่าง Column กับ Icon เป็น 2% ของความกว้างหน้าจอ
              Icon(Icons.chevron_right, color: Colors.grey, size: iconSize), // ขนาดไอคอนลูกศรเป็นขนาดเดียวกับไอคอนเอกสาร
            ],
          ),
        );
      },
    );
  }
}
