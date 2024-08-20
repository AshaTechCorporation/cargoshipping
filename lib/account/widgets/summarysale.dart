import 'package:flutter/material.dart';

class Summarysale extends StatefulWidget {
  const Summarysale({super.key});

  @override
  State<Summarysale> createState() => _SummarysaleState();
}

class _SummarysaleState extends State<Summarysale> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('สรุปยอดขาย'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              width: 358,
              height: 48,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('เดือนกรกฎาคม 2567'),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_drop_down_outlined)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              width: 358,
              height: 48,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('เดือนมิถุนายน 2567'),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_drop_down_outlined)
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
            color: Colors.white,
            height: 100,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end, // จัดข้อความให้ชิดขวา
              children: [
                Text(
                  'ยอดขายในเดือนนี้ ฿ 24,000',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 12),
                ),
                Divider(),
                Text(
                  'ยอดขายทั้งหมด',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  '฿ 48,000',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 17, color: Colors.red),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
