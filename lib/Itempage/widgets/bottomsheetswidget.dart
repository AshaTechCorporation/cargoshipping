import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class ProductDetailsBottomSheet extends StatefulWidget {
  final Map<String, dynamic> product;
  final String buttonLabel; // ป้ายข้อความของปุ่ม
  final Function()? onButtonPress; // ฟังก์ชันเมื่อกดปุ่ม

  const ProductDetailsBottomSheet({
    required this.product,
    required this.buttonLabel, // รับข้อความของปุ่ม
    required this.onButtonPress, // รับฟังก์ชันของปุ่ม
  });

  @override
  State<ProductDetailsBottomSheet> createState() =>
      _ProductDetailsBottomSheetState();
}

class _ProductDetailsBottomSheetState extends State<ProductDetailsBottomSheet> {
  String? selectedService;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.8,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: size.height * 0.08,
                      width: size.height * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[200],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          widget.product['image'],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * 0.04),
                    Text(
                      '¥ ${widget.product['price']}',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.01),
                Container(
                  height: size.height * 0.0006,
                  width: size.width * 0.9,
                  color: Colors.grey,
                ),
                SizedBox(height: size.height * 0.01),
                Text(
                  'สี',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.01),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildColorOption('สีธูปแดง',context),
                    _buildColorOption('สีขาวมวล',context),
                    _buildColorOption('สีน้ำตาลอ่อน',context),
                    _buildColorOption('สีเทาอ่อน',context),
                    _buildColorOption('สีนอร์ดิกบลู',context),
                  ],
                ),
                SizedBox(height: size.height * 0.01),
                Container(
                  height: size.height * 0.0006,
                  width: size.width * 0.9,
                  color: Colors.grey,
                ),
                SizedBox(height: size.height * 0.01),
                Text('ตัวเลือก',style: TextStyle(
                  fontSize: 13,color: Colors.black,fontWeight: FontWeight.bold
                ),),
                _buildOptionRow('ตัวเลือก', 'ข้อมูล','ตัวเลือก'),
                _buildOptionRow('ตัวเลือก', 'ข้อมูล','ตัวเลือก'),
                SizedBox(height: size.height * 0.01),
                _buildQuantitySelector(size),
                SizedBox(height: size.height * 0.01),
                Text(
                  'บริการเสริม',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.01),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildServiceOption('ตีลังไม้', 'เริ่มต้น ¥500/CBM'),
                    _buildServiceOption('พันห่อด้วยเทป', 'เริ่มต้น ¥50/CBM'),
                    _buildServiceOption('ตรวจ QC สินค้า', '¥25/กล่อง'),
                  ],
                ),
                SizedBox(height: size.height * 0.01),
                _buildPriceDetails(),
                SizedBox(height: size.height * 0.06),
                GestureDetector(
                  onTap: widget
                      .onButtonPress, // ใช้ฟังก์ชัน onButtonPress ที่ส่งมา
                  child: Center(
                    child: Container(
                      height: size.height * 0.067,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          widget.buttonLabel, // ใช้ข้อความปุ่มที่ส่งมา
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildColorOption(String colorName, BuildContext context) {
  // รับค่า size ของหน้าจอ
  final size = MediaQuery.of(context).size;

  return Column(
    children: [
      Container(
        // กำหนดขนาดของ Container โดยใช้ขนาดจาก size ของ MediaQuery
        width: size.width * 0.25, // ตัวอย่างใช้ 25% ของความกว้างหน้าจอ
        height: size.height * 0.05, // ตัวอย่างใช้ 5% ของความสูงหน้าจอ
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      SizedBox(height: size.height * 0.005), // เพิ่มขนาดให้สัมพันธ์กับหน้าจอ
      Text(
        colorName,
        style: TextStyle(fontSize: size.height * 0.015), // กำหนดขนาดข้อความ
      ),
    ],
  );
}

  Widget _buildOptionRow(String title, String value, String detail) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(title, style: TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.bold)),
              Text(detail, style: TextStyle(fontSize: 13)),
            ],
          ),
          Text(value, style: TextStyle(fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildQuantitySelector(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('จำนวน'),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.remove),
            ),
            Text(
              '50',
              style: TextStyle(fontSize: 16),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildServiceOption(String title, String price) {
    final isSelected = selectedService == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedService = isSelected ? null : title;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? red1 : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: red1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 14,
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              price,
              style: TextStyle(
                  fontSize: 12,
                  color: isSelected ? Colors.white : Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('จำนวนสินค้า 50 ชิ้น', style: TextStyle(fontSize: 16)),
        Text('¥11.19 (~฿55.56)',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
