import 'package:cargoshipping/account/cerditcardpage.dart';
import 'package:cargoshipping/account/services/accountApi.dart';
import 'package:cargoshipping/account/widgets/mobilebankingpage.dart';
import 'package:cargoshipping/cart/widget/Custonredchechkbox.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/firstPage.dart';
import 'package:cargoshipping/message/widgets/customdivider.dart';
import 'package:cargoshipping/widgets/LoadingDialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Topuppage extends StatefulWidget {
  const Topuppage({super.key, required this.amount});
  final int amount;

  @override
  State<Topuppage> createState() => _TopuppageState();
}

class _TopuppageState extends State<Topuppage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'ช่องทางการเติมเงิน',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
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
      body: Column(
        children: [
          Container(
            color: white,
            height: size.height * 0.06,
            child: Row(
              children: [
                SizedBox(width: size.width * 0.055),
                Image.asset(
                  'assets/icons/qrcode.png',
                  height: size.height * 0.028,
                ),
                SizedBox(
                  width: size.width * 0.03,
                ),
                Text(
                  'QR พร้อมเพย์',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: size.width * 0.58,
                ),
                Customredchechkbox(
                  isSelected: isChecked,
                  onChanged: () {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.002,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Mobilebankingpage(),
                ),
              );
            },
            child: Container(
              color: white,
              height: size.height * 0.06,
              child: Row(
                children: [
                  SizedBox(width: size.width * 0.05),
                  Image.asset(
                    'assets/icons/mobilebank.png',
                    height: size.height * 0.03,
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Text(
                    'โอนเงินผ่านแอป Mobile Banking',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Image.asset('assets/icons/rightarrow.png'),
                  SizedBox(width: 20),
                ],
              ),
            ),
          ),
          CustomDivider(
            heightFactor: 0.0005,
            widthFactor: double.infinity,
          ),
          Spacer(),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () async {
          final out = await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('แจ้งเตือน'),
                  content: Text('คุณต้องการเติมเงินใช่ไหม?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: Text('ยกเลิก'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: Text('ตกลง'),
                    )
                  ],
                );
              });
          if (out == true) {
            LoadingDialog.open(context);
            try {
              await AccountApi.addWallet(
                in_from: 'Wallet',
                out_to: null,
                reference_id: '#OR-99999',
                detail: 'Wallet',
                amount: widget.amount,
                type: '0',
              );
              LoadingDialog.close(context);
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => FirstPage()), (route) => false);
            } on ClientException catch (e) {
              if (!mounted) return;
              LoadingDialog.close(context);
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text('แจ้งเตือน'),
                        content: Text(e.toString()),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('ตกลง'),
                          )
                        ],
                      ));
              print(e);
            } on Exception catch (e) {
              if (!mounted) return;
              LoadingDialog.close(context);
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text('แจ้งเตือน'),
                        content: Text(e.toString()),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('ตกลง'),
                          )
                        ],
                      ));
              print(e);
            }
          }
        },
        child: Container(
          margin: EdgeInsets.all(16),
          height: size.height * 0.06,
          width: size.width * 0.95,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(13), color: red1),
          child: Center(
              child: Text(
            'ยืนยันช่องทางการเติมเงิน',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
