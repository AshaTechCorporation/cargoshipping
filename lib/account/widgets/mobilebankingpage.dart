import 'package:flutter/material.dart';

class Mobilebankingpage extends StatefulWidget {
  const Mobilebankingpage({super.key});

  @override
  State<Mobilebankingpage> createState() => _MobilebankingpageState();
}

class _MobilebankingpageState extends State<Mobilebankingpage> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;

  void _handleCheckboxChange(int index, bool? value) {
    setState(() {
      // ปิดการเลือก checkbox อื่น ๆ
      isChecked1 = index == 0 ? value ?? false : false;
      isChecked2 = index == 1 ? value ?? false : false;
      isChecked3 = index == 2 ? value ?? false : false;
      isChecked4 = index == 3 ? value ?? false : false;
      isChecked5 = index == 4 ? value ?? false : false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('โอนเงินผ่านแอป Mobile Banking'),
      ),
      body: Column(
        children: [
          _buildRow('assets/icons/scb.png', 'SCB Easy', 0, isChecked1),
          SizedBox(height: 10),
          _buildDivider(),
          SizedBox(height: 15),
          _buildRow('assets/icons/kbank.png', 'K PLUS', 1, isChecked2),
          SizedBox(height: 10),
          _buildDivider(),
          SizedBox(height: 15),
          _buildRow('assets/icons/bay.png', 'Krungsri Mobile App', 2, isChecked3),
          SizedBox(height: 10),
          _buildDivider(),
          SizedBox(height: 15),
          _buildRow('assets/icons/ktb.png', 'Krungthai NEXT', 3, isChecked4),
          SizedBox(height: 10),
          _buildDivider(),
          SizedBox(height: 15),
          _buildRow('assets/icons/bbl.png', 'Bangkok Bank Mobile Banking', 4, isChecked5),
          SizedBox(height: 10),
          _buildDivider(),
          SizedBox(height: 15),
          SizedBox(
              height: 320,
            ),
            Container(
              height: 45,
              width: 306,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.red),
              child: Center(
                  child: Text(
                'ยืนยันช่องทางการเติมเงิน',
                style: TextStyle(color: Colors.white),
              )),
            ),
        ],
      ),
    );
  }

  Widget _buildRow(String imagePath, String text, int index, bool isChecked) {
    return Row(
      children: [
        SizedBox(width: 25),
        Image.asset(imagePath, height: 30),
        SizedBox(width: 10),
        Text(text, style: TextStyle(fontSize: 13)),
        Spacer(),
        Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            _handleCheckboxChange(index, value);
          },
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 380,
      height: 1,
      color: Colors.black,
    );
  }
}
