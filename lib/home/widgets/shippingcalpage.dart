import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class ShippingCalculatorPage extends StatefulWidget {
  const ShippingCalculatorPage({super.key});

  @override
  _ShippingCalculatorPageState createState() => _ShippingCalculatorPageState();
}

class _ShippingCalculatorPageState extends State<ShippingCalculatorPage> {
  String selectedShippingMethod = 'ทางรถ';
  String? selectedProductType;
  final List<String> productTypes = ['สินค้า A', 'สินค้า B', 'สินค้า C'];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text('วิธีคำนวณค่าขนส่ง',style: TextStyle(
          fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xfffff0f0),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                border: Border.all(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
              height: size.height * 0.065,
              width: size.width * 0.9,
              child: Center(
                child: Text(
                  'วิธีคำนวณค่าขนส่ง',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: size.height * 0.8,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Text(
                    'ประเภทการขนส่ง',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildTransportOption('ทางรถ', 'assets/icons/carim.png'),
                      _buildTransportOption(
                          'ทางเรือ', 'assets/icons/boatim.png'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'ประเภทสินค้า',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: size.height *0.07,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      hint: Text(
                        'เลือกประเภทสินค้า',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      value: selectedProductType,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedProductType = newValue;
                        });
                      },
                      items: productTypes
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'ขนาดสินค้า',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  _buildTextField('ความกว้าง (ซม.)'),
                  _buildTextField('ความยาว (ซม.)'),
                  _buildTextField('ความสูง (ซม.)'),
                  _buildTextField('น้ำหนักจริง (กก.)'),
                  SizedBox(height: 16),
                  Center(
                    child: Container(
                      height: size.height * 0.06,
                      width: size.width * 0.85,
                      child: ElevatedButton(
                        onPressed: () {
                          // กำหนดฟังก์ชันการคำนวณค่าขนส่งที่นี่
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: red1,
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Text(
                          'คำนวณค่าขนส่ง',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Align(
                    alignment: Alignment.centerRight, // จัดให้ชิดขวา
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '**น้ำหนัก / CBM ถ้าส่งฟรี มากกว่า 250 kg/CBM\nสินค้าชิ้นนี้จะถูกคิดเป็น เรทกิโล',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 12,
                              color: greyuserinfo,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Text(
                          '**น้ำหนัก / CBM ถ้าส่งฟรี น้อยกว่า 250 kg/CBM\nสินค้าชิ้นนี้จะถูกคิดเป็น เรทคิว',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 12,
                              color: greyuserinfo,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // สร้าง TextField สำหรับกรอกข้อมูล
  Widget _buildTextField(String labelText) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextField(
          decoration: InputDecoration(
            labelText: labelText,
            hintStyle: TextStyle(color: greyuserinfo, fontSize: 13),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: greymess,
                width: 1.0,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: greymess,
                width: 1.0,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }

  Widget _buildTransportOption(String title, String assetPath) {
    final size = MediaQuery.of(context).size;
    bool isSelected = selectedShippingMethod == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedShippingMethod = title;
        });
      },
      child: Container(
        width: size.width * 0.37,
        height: size.height * 0.065,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: isSelected ? white : white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.red : Colors.grey.shade300,
            width: isSelected ? 2.0 : 1.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(assetPath, height: 40),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.red : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
