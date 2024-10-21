import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class QrpromptPay extends StatefulWidget {
  const QrpromptPay({super.key});

  @override
  State<QrpromptPay> createState() => _QrpromptPayState();
}

class _QrpromptPayState extends State<QrpromptPay> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'ชำระผ่าน QR พร้อมเพย์',
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
              height: size.height * 0.02,
            ),
            Center(
              child: Container(
                width: size.width * 0.95,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
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
                child: Column(
                  children: [
                    Container(
                      width: size.width * 0.95,
                      height: size.height * 0.08,
                      decoration: BoxDecoration(
                        color: blue1,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
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
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Image.asset('assets/icons/frameQr.png'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('ยอดชำระทั้งหมด: ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                        Text('0,000 ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: red1)),
                        Text('บาท', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('QR นี้มีอายุถึง 00 ก.ย. 2567 00:00', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: size.height * 0.07,
                width: size.width * 0.7,
                decoration: BoxDecoration(
                  color: red1,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    'บันทึก QR',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('หรือชำระผ่านบัญชีธนาคาร', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
              ],
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
                    Radius.circular(15.0),
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
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Image.asset(
                              'assets/icons/imageKtc.png',
                              height: size.height * 0.08,
                            ),
                          ),
                          Expanded(
                              flex: 10,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('ธนาคารกสิกรไทย สาขาเมืองทองธานี', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                                  Text('ชื่อบัญชี: ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: red1)),
                                  Text('บจก.ไทย เอ็กซ์เพรส โกลบอล โลจิสติกส์', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: red1)),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('110-8-71757-9', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: blueText)),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: red1, // Set your desired border color here
                                            width: 1.5, // Set the border width
                                          ),
                                          borderRadius: BorderRadius.circular(15), // Optional: for rounded corners
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text('คัดลอกหมายเลข', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )),
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
    );
  }
}
