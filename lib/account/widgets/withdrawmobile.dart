import 'package:cargoshipping/cart/widget/Custonredchechkbox.dart';
import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Withdrawmobile extends StatefulWidget {
  const Withdrawmobile({super.key});

  @override
  State<Withdrawmobile> createState() => _WithdrawmobileState();
}

class _WithdrawmobileState extends State<Withdrawmobile> {
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('โอนเงินผ่านแอป Mobile Banking',style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),),
      ),
      body: Column(
        children: [
          _buildRow('assets/icons/scb.png', 'SCB Easy', 0, isChecked1, size),
          SizedBox(height: size.height * 0.018),
          _buildDivider(size),
          SizedBox(height: size.height * 0.015),
          _buildRow('assets/icons/kbank.png', 'K PLUS', 1, isChecked2, size),
          SizedBox(height: size.height * 0.018),
          _buildDivider(size),
          SizedBox(height: size.height * 0.015),
          _buildRow('assets/icons/bay.png', 'Krungsri Mobile App', 2,
              isChecked3, size),
          SizedBox(height: size.height * 0.018),
          _buildDivider(size),
          SizedBox(height: size.height * 0.018),
          _buildRow(
              'assets/icons/ktb.png', 'Krungthai NEXT', 3, isChecked4, size),
          SizedBox(height: size.height * 0.01),
          _buildDivider(size),
          SizedBox(height: size.height * 0.018),
          _buildRow('assets/icons/bbl.png', 'Bangkok Bank Mobile Banking', 4,
              isChecked5, size),
          SizedBox(height: size.height * 0.018),
          _buildDivider(size),
          Spacer(),
          Container(
            height: size.height * 0.06,
            width: size.width * 0.95,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13), color: red1),
            child: Center(
                child: Text(
              'ยืนยันช่องทางการเติมเงิน',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(
      String imagePath, String text, int index, bool isChecked, Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      child: Row(
        children: [
          SizedBox(width: size.width * 0.01),
          Image.asset(imagePath, height: size.height * 0.03),
          SizedBox(width: size.width * 0.03),
          Text(text,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          Spacer(),
          Customredchechkbox(
            isSelected: isChecked,
            onChanged: () {
              _handleCheckboxChange(index, !isChecked);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDivider(Size size) {
    return Container(
      width: size.width * 0.99,
      height: size.height * 0.0005,
      color: Colors.grey,
    );
  }
}
