import 'package:cargoshipping/cart/widget/Custonredchechkbox.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/widgets/creditDebit.dart';
import 'package:cargoshipping/home/widgets/qrpromptPay.dart';
import 'package:cargoshipping/home/widgets/tegWallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PaymentChannel extends StatefulWidget {
  const PaymentChannel({super.key});

  @override
  State<PaymentChannel> createState() => _PaymentChannelState();
}

class _PaymentChannelState extends State<PaymentChannel> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  bool isChecked6 = false;
  bool isChecked7 = false;
  bool isChecked8 = false;

  void _handleCheckboxChange(int index, bool? value) {
    setState(() {
      // ปิดการเลือก checkbox อื่น ๆ
      isChecked1 = index == 0 ? value ?? false : false;
      isChecked2 = index == 1 ? value ?? false : false;
      isChecked3 = index == 2 ? value ?? false : false;
      isChecked4 = index == 3 ? value ?? false : false;
      isChecked5 = index == 4 ? value ?? false : false;
      isChecked6 = index == 5 ? value ?? false : false;
      isChecked7 = index == 6 ? value ?? false : false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'เลือกช่องทางการชำระเงิน',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: backgroundColor,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 0.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ยอดที่ต้องชำระ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        '000',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: red1),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Text(
                        'บาท',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                    child: Row(
                      children: [
                        Text(
                          'ช่องทางการชำระเงิน',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  _buildRow('assets/icons/Frame 61.png', 'TEG Wallet', 0, isChecked1, size),
                  Divider(),
                  _buildRow('assets/icons/qrcode.png', 'QR พร้อมเพย์', 1, isChecked2, size),
                  Divider(),
                  Container(
                    color: white,
                    height: size.height * 0.06,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                      child: Row(
                        children: [
                          SizedBox(width: size.width * 0.01),
                          Image.asset('assets/icons/mobileBanking.png', height: size.height * 0.03),
                          SizedBox(width: size.width * 0.03),
                          Text('โอนเงินผ่านแอป Mobile Banking', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                          Spacer(),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  isChecked8 = !isChecked8;
                                });
                                //_handleCheckboxChange(8, isChecked8);
                              },
                              child: isChecked8 == false ? Icon(Icons.keyboard_arrow_down) : Icon(Icons.keyboard_arrow_up)),
                        ],
                      ),
                    ),
                  ),
                  isChecked8 == true
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            _buildRowMini('assets/icons/scb.png', 'SCB Easy', 2, isChecked3, size),
                            Divider(),
                            _buildRowMini('assets/icons/kbank.png', 'K PLUS', 3, isChecked4, size),
                            Divider(),
                            _buildRowMini('assets/icons/bay.png', 'Krungsri Mobile App', 4, isChecked5, size),
                            Divider(),
                            _buildRowMini('assets/icons/ktb.png', 'Krungthai NEXT', 5, isChecked6, size),
                            Divider(),
                            _buildRowMini('assets/icons/bbl.png', 'Bangkok Bank Mobile Banking', 6, isChecked7, size),
                          ],
                        )
                      : SizedBox(),
                  Divider(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CreditDebit()));
                    },
                    child: Container(
                      color: white,
                      height: size.height * 0.06,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                        child: Row(
                          children: [
                            SizedBox(width: size.width * 0.01),
                            Image.asset('assets/icons/cedit.png', height: size.height * 0.03),
                            SizedBox(width: size.width * 0.03),
                            Text('บัตรเครดิต/บัตรเดบิต', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                            Spacer(),
                            GestureDetector(onTap: () {}, child: Icon(Icons.keyboard_arrow_right)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: size.height * 0.085,
        child: BottomAppBar(
          color: white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (isChecked1 == true) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TegWallet()));
                  } else if (isChecked2 == true) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => QrpromptPay()));
                  } else if (isChecked3 == true) {
                  } else if (isChecked4 == true) {
                  } else if (isChecked5 == true) {
                  } else if (isChecked6 == true) {}
                },
                child: Container(
                  height: size.height * 0.07,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: red1,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'ยืนยันช่องทางชำระเงิน',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String imagePath, String text, int index, bool isChecked, Size size) {
    return Container(
      color: white,
      height: size.height * 0.06,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        child: Row(
          children: [
            SizedBox(width: size.width * 0.01),
            Image.asset(imagePath, height: size.height * 0.03),
            SizedBox(width: size.width * 0.03),
            Text(text, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Spacer(),
            Customredchechkbox(
              isSelected: isChecked,
              onChanged: () {
                _handleCheckboxChange(index, !isChecked);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRowMini(String imagePath, String text, int index, bool isChecked, Size size) {
    return Container(
      color: white,
      height: size.height * 0.06,
      width: size.width * 0.9,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        child: Row(
          children: [
            SizedBox(width: size.width * 0.01),
            Image.asset(imagePath, height: size.height * 0.03),
            SizedBox(width: size.width * 0.03),
            Text(text, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Spacer(),
            Customredchechkbox(
              isSelected: isChecked,
              onChanged: () {
                _handleCheckboxChange(index, !isChecked);
              },
            ),
          ],
        ),
      ),
    );
  }
}
