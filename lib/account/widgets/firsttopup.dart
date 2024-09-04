import 'package:cargoshipping/account/topuppage.dart';
import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Firsttopup extends StatefulWidget {
  const Firsttopup({super.key});

  @override
  _FirsttopupState createState() => _FirsttopupState();
}

class _FirsttopupState extends State<Firsttopup> {
  String selectedAmount = ''; // สถานะเก็บจำนวนเงินที่เลือก

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: white,
        title: Text(
          'เติมเงิน',
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'เลือกจำนวนเงิน (บาท)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Center(
              child: Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: [
                  _buildAmountContainer('100'),
                  _buildAmountContainer('500'),
                  _buildAmountContainer('1,000'),
                  _buildAmountContainer('5,000'),
                  _buildAmountContainer('10,000'),
                  _buildAmountContainer('50,000'),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'หรือระบุ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: size.height * 0.045,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'ระบุจำนวนเงินขั้นต่ำ 50 บาท',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                  prefixIcon: Padding(
                    padding:
                        const EdgeInsets.all(12.0), // ปรับ padding ของไอคอน
                    child: Image.asset('assets/icons/writemoney.png'),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  contentPadding: EdgeInsets.only(
                    top: 12.0,
                    bottom: 12.0,
                    right: 20.0, // เพิ่มระยะห่างจากขอบขวา
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
                  MaterialPageRoute(builder: (context) => Topuppage()),
                );
                // print('Selected Amount: $selectedAmount');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: red1,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'เติมเงิน',
                style: TextStyle(
                    fontSize: 17, color: white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
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
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.04,
        width: MediaQuery.of(context).size.width * 0.25,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.red : Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.grey),
        ),
        alignment: Alignment.center,
        child: Text(
          amount,
          style: TextStyle(
              fontSize: 16.0,
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
