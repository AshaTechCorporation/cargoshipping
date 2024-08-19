import 'package:flutter/material.dart';

class TrackPage extends StatefulWidget {
  const TrackPage({super.key});

  @override
  State<TrackPage> createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // จัดตำแหน่งให้ชิดด้านซ้าย
          children: [
            Text(
              'ติดตามสถานะ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  SizedBox(
                    width: size.width * 0.35,
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
                ],
              ),
            ),
            SizedBox(height: 4),
            Container(
              width: double.infinity,
              height: 30,
              color: Colors.grey,
            )
          ],
        ),
        toolbarHeight: 130,
      ),
    );
  }
}
