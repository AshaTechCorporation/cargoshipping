import 'package:cargoshipping/cart/widget/Custonredchechkbox.dart';
import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class CreditDebit extends StatefulWidget {
  const CreditDebit({super.key});

  @override
  State<CreditDebit> createState() => _CreditDebitState();
}

class _CreditDebitState extends State<CreditDebit> {
  bool isChecked1 = false;

  void _handleCheckboxChange(int index, bool? value) {
    setState(() {
      // ปิดการเลือก checkbox อื่น ๆ
      isChecked1 = index == 0 ? value ?? false : false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'บัตรเครดิต/บัตรเดบิต',
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            Center(
              child: Container(
                width: size.width * 0.95,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 1,
                      spreadRadius: 1,
                      color: Colors.black26,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('หมายเลขบัตร', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                          Image.asset('assets/icons/creditLogo.png', height: size.height * 0.02),
                        ],
                      ),
                      Divider(),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('ชื่อผู้ถือบัตร', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                        ],
                      ),
                      Divider(),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: size.width * 0.38,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text('Expiration ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                                    Text('(MM/YY)', style: TextStyle(fontSize: 17.4, fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                Divider(),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.42,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text('CVV ', style: TextStyle(fontSize: 17.4, fontWeight: FontWeight.w500)),
                                    Text('(เลข 3 ตัวด้านหลังบัตร)', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                Divider(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Center(
              child: Container(
                width: size.width * 0.95,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 1,
                      spreadRadius: 1,
                      color: Colors.black26,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('บันทึกบัตรไว้ภายหลัง', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                          Customredchechkbox(
                            isSelected: isChecked1,
                            onChanged: () {
                              setState(() {
                                isChecked1 = !isChecked1;
                              });
                              _handleCheckboxChange(0, isChecked1);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                    ],
                  ),
                ),
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
                onTap: () {},
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
}
