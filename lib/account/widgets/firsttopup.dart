import 'package:cargoshipping/account/topuppage.dart';
import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Firsttopup extends StatefulWidget {
  const Firsttopup({super.key});

  @override
  _FirsttopupState createState() => _FirsttopupState();
}

class _FirsttopupState extends State<Firsttopup> {
  TextEditingController amount = TextEditingController();
  String selectedAmount = '';
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {
          focusNode.unfocus();
        });
      },
      child: Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: white,
          title: Text(
            'เติมเงิน',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: backgroundColor,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(size.height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'เลือกจำนวนเงิน (บาท)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.015),
              Center(
                child: Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: [
                    _buildAmountContainer('100'),
                    _buildAmountContainer('500'),
                    _buildAmountContainer('1000'),
                    _buildAmountContainer('5000'),
                    _buildAmountContainer('10000'),
                    _buildAmountContainer('50000'),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Text(
                'หรือระบุ',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: headingtext),
              ),
              SizedBox(height: size.height * 0.025),
              SizedBox(
                height: size.height * 0.055,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: amount,
                  focusNode: focusNode,
                  onSubmitted: (value) {
                    if (int.parse(value) <= 49) {
                      setState(() {
                        amount.clear();
                      });
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text('แจ้งเตือน'),
                                content: Text('กรุณากรอรกจำนวนเงินขั้นต่ำ 50 บาท'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('ตกลง'),
                                  )
                                ],
                              ));
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'ระบุจำนวนเงินขั้นต่ำ 50 บาท',
                    hintStyle: TextStyle(color: arrowcolor, fontSize: 13),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset('assets/icons/writemoney.png'),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                  ),
                  textAlign: TextAlign.right,
                  onChanged: (value) {
                    setState(() {
                      selectedAmount = value;
                    });
                  },
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Topuppage(
                              amount: int.parse(amount.text),
                            )),
                  );
                  // print('Selected Amount: $selectedAmount');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: red1,
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.015),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  'เติมเงิน',
                  style: TextStyle(fontSize: 17, color: white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAmountContainer(String amount) {
    bool isSelected = selectedAmount == amount;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAmount = amount;
          this.amount.text = amount;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.038,
        width: MediaQuery.of(context).size.width * 0.24,
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.01),
        decoration: BoxDecoration(
          color: isSelected ? Colors.red : Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: Colors.grey,
            width: 0.6,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          NumberFormat('#,###').format(double.parse(amount)),
          style: TextStyle(fontSize: 13.0, color: isSelected ? Colors.white : Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
