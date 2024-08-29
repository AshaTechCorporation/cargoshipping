import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/track/purchase.dart';
import 'package:cargoshipping/track/selldetail.dart';
import 'package:cargoshipping/widgets/compete.dart';
import 'package:cargoshipping/widgets/itemclose.dart';
import 'package:cargoshipping/widgets/packing.dart';
import 'package:cargoshipping/widgets/prepare.dart';
import 'package:cargoshipping/widgets/thaiprepare.dart';
import 'package:cargoshipping/widgets/waitsum.dart';
import 'package:flutter/material.dart';

class TrackPage extends StatefulWidget {
  const TrackPage({super.key});

  @override
  State<TrackPage> createState() => _TrackPageState();
}

List<IconData> icons = [
  Icons.home,
  Icons.local_shipping,
  Icons.store,
  Icons.payment,
  Icons.check_circle
];

class _TrackPageState extends State<TrackPage> {
  int selectedIndex = 0;
  List<String> options = ['ทั้งหมด', 'ฝากสั่ง', 'นำเข้าโดยรถ', 'นำเข้าโดยเรือ'];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        title: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // จัดตำแหน่งให้ชิดด้านซ้าย
          children: [
            Text(
              'ติดตามสถานะ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
            ),
            SizedBox(height: 8),
            Container(
              height: 30,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  SizedBox(
                    width: size.width * 0.75,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'ค้นหาสินค้า',
                        contentPadding: EdgeInsets.only(left: 15, bottom: 10),
                      ),
                    ),
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                      ),
                      child: Center(
                        child: Text(
                          'ค้นหา',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                  ))
                ],
              ),
            ),
            SizedBox(height: 4),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(options.length, (int index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      label: Text(options[index]),
                      selected: selectedIndex == index,
                      onSelected: (bool selected) {
                        setState(() {
                          selectedIndex = (selected ? index : null)!;
                        });
                      },
                    ),
                  );
                }),
              ),
            )
          ],
        ),
        toolbarHeight: 130,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Waitsum(size: size),
            SizedBox(
              height: size.height * 0.01,
            ),
            purchase(size: size),
            SizedBox(
              height: size.height * 0.01,
            ),
            preparetosend(size: size),
            SizedBox(
              height: size.height * 0.01,
            ),
            packing(size: size),
            SizedBox(
              height: size.height * 0.01,
            ),
            thaiprepare(size: size),
            SizedBox(
              height: size.height * 0.01,
            ),
            itemclosetoyou(size: size),
            SizedBox(
              height: size.height * 0.01,
            ),
            compete(size: size)
          ],
        ),
      ),
    );
  }
}
