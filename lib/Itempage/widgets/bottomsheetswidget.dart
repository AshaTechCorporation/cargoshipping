import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/models/serviceTransporterById.dart';
import 'package:flutter/material.dart';

class ProductDetailsBottomSheet extends StatefulWidget {
  final Map<String, dynamic> product;
  final String buttonLabel; // ป้ายข้อความของปุ่ม
  final Function()? onButtonPress; // ฟังก์ชันเมื่อกดปุ่ม
  final ValueChanged onChange;
  final ValueChanged onSelectedColors;
  final ValueChanged onSelectedSizes;
  final ValueChanged onSelectedExtraService;
  final List<ServiceTransporterById> extraService;

  const ProductDetailsBottomSheet(
      {required this.product,
      required this.buttonLabel, // รับข้อความของปุ่ม
      required this.onButtonPress, // รับฟังก์ชันของปุ่ม
      required this.onChange,
      required this.onSelectedColors,
      required this.onSelectedSizes,
      required this.onSelectedExtraService,
      required this.extraService});

  @override
  State<ProductDetailsBottomSheet> createState() => _ProductDetailsBottomSheetState();
}

class _ProductDetailsBottomSheetState extends State<ProductDetailsBottomSheet> {
  String? selectedService;
  int amount = 1;
  List<Map<String, String>> colors = []; // ตัวแปรสำหรับเก็บสี
  List<Map<String, String>> sizes = []; // ตัวแปรสำหรับเก็บขนาด
  String? selectedColor;
  String? selectedSize;

  @override
  void initState() {
    super.initState();
    setState(() {
      colors.clear();
      sizes.clear();
      if (widget.product['props_name'] != "" || widget.product['props_name'] != null) {
        List<Map<String, String>> colorList = [];
        List<Map<String, String>> sizeList = [];
        // แยกข้อมูลโดยใช้ ';' เป็นตัวแบ่ง
        List<String> entries = widget.product['props_name'].split(';');

        for (String entry in entries) {
          List<String> parts = entry.split(':');
          if (parts.length == 4) {
            Map<String, String> data = {"num_prop": "${parts[0]}:${parts[1]}", "name": parts[2], "value": parts[3]};

            // แยกสีและขนาดออกจากกัน
            if (parts[2] == "颜色") {
              colorList.add(data);
            } else if (parts[2] == "尺码") {
              sizeList.add(data);
            }
          }
        }
        colors = colorList;
        sizes = sizeList;
      }
    });
  }

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
              crossAxisAlignment: CrossAxisAlignment.center,
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
                        child: CachedNetworkImage(
                          imageUrl: "https:${widget.product['pic_url']}",
                          fit: BoxFit.fill,
                          placeholder: (context, url) => SizedBox(
                              height: size.height * 0.001,
                              width: size.width * 0.001,
                              child: CircularProgressIndicator(
                                strokeWidth: 1,
                              )),
                          errorWidget: (context, url, error) => Image.asset(
                            'assets/images/noimages.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        // child: Image.network(
                        //   'https:${widget.product['pic_url']}',
                        //   fit: BoxFit.fill,
                        // ),
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
                colors.isEmpty
                    ? SizedBox()
                    : Text(
                        'สี',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                SizedBox(height: size.height * 0.01),

                colors.isEmpty
                    ? SizedBox()
                    : Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: List.generate(
                          colors.length,
                          (index) => _buildColorOption(colors[index]['name']!, context, colors[index]['value']!, () {
                            setState(() {
                              selectedColor = colors[index]['value'];
                              widget.onSelectedColors(selectedColor);
                            });
                          }),
                        ),
                      ),
                // Wrap(
                //   spacing: 8,
                //   runSpacing: 8,
                //   children: [
                //     _buildColorOption('สีธูปแดง', context),
                //     _buildColorOption('สีขาวมวล', context),
                //     _buildColorOption('สีน้ำตาลอ่อน', context),
                //     _buildColorOption('สีเทาอ่อน', context),
                //     _buildColorOption('สีนอร์ดิกบลู', context),
                //   ],
                // ),
                SizedBox(height: size.height * 0.01),
                Container(
                  height: size.height * 0.0006,
                  width: size.width * 0.9,
                  color: Colors.grey,
                ),
                SizedBox(height: size.height * 0.01),
                sizes.isEmpty
                    ? SizedBox()
                    : Text(
                        'ตัวเลือก',
                        style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                sizes.isEmpty
                    ? SizedBox()
                    : Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: List.generate(
                          sizes.length,
                          (index) => _buildSizesOption(sizes[index]['name']!, context, sizes[index]['value']!, () {
                            setState(() {
                              selectedSize = sizes[index]['value'];
                              widget.onSelectedSizes(selectedSize);
                            });
                          }),
                        ),
                      ),
                // _buildOptionRow('ตัวเลือก', 'ข้อมูล', 'ตัวเลือก'),
                // _buildOptionRow('ตัวเลือก', 'ข้อมูล', 'ตัวเลือก'),
                // SizedBox(height: size.height * 0.01),
                // _buildQuantitySelector(size),
                // SizedBox(height: size.height * 0.01),
                Text(
                  'บริการเสริม',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.01),
                widget.extraService.isEmpty
                    ? SizedBox()
                    : Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: List.generate(
                          widget.extraService.length,
                          (index) => _buildServiceOption('${widget.extraService[index].name}', 'เริ่มต้น ¥${widget.extraService[index].standard_price}/CBM', widget.extraService[index]),
                        ),
                      ),
                // Wrap(
                //   spacing: 8,
                //   runSpacing: 8,
                //   children: [
                //     _buildServiceOption('ตีลังไม้', 'เริ่มต้น ¥500/CBM'),
                //     _buildServiceOption('พันห่อด้วยเทป', 'เริ่มต้น ¥50/CBM'),
                //     _buildServiceOption('ตรวจ QC สินค้า', '¥25/กล่อง'),
                //   ],
                // ),
                SizedBox(height: size.height * 0.01),
                _buildPriceDetails(),
                SizedBox(height: size.height * 0.06),
                GestureDetector(
                  onTap: widget.onButtonPress, // ใช้ฟังก์ชัน onButtonPress ที่ส่งมา
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

  Widget _buildColorOption(String colorName, BuildContext context, String value, VoidCallback press) {
    // รับค่า size ของหน้าจอ
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        GestureDetector(
          onTap: press,
          child: Container(
            // กำหนดขนาดของ Container โดยใช้ขนาดจาก size ของ MediaQuery
            width: size.width * 0.28, // ตัวอย่างใช้ 25% ของความกว้างหน้าจอ
            height: size.height * 0.05, // ตัวอย่างใช้ 5% ของความสูงหน้าจอ
            decoration: BoxDecoration(
              color: selectedColor == value ? Colors.redAccent : Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(value),
            ),
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

  Widget _buildSizesOption(String colorName, BuildContext context, String value, VoidCallback press) {
    // รับค่า size ของหน้าจอ
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        GestureDetector(
          onTap: press,
          child: Container(
            // กำหนดขนาดของ Container โดยใช้ขนาดจาก size ของ MediaQuery
            width: size.width * 0.28, // ตัวอย่างใช้ 25% ของความกว้างหน้าจอ
            height: size.height * 0.05, // ตัวอย่างใช้ 5% ของความสูงหน้าจอ
            decoration: BoxDecoration(
              color: selectedSize == value ? Colors.redAccent : Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(value),
            ),
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
              Text(title, style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold)),
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
              onPressed: () {
                setState(() {
                  if (amount > 1) {
                    amount = amount - 1;
                  }
                  widget.onChange(amount);
                });
              },
              icon: Icon(Icons.remove),
            ),
            Text(
              '${amount}',
              style: TextStyle(fontSize: 16),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  amount = amount + 1;
                });
                widget.onChange(amount);
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildServiceOption(String title, String price, ServiceTransporterById selectExtra) {
    final isSelected = selectedService == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedService = isSelected ? null : title;
          //inspect(selectExtra);
          widget.onSelectedExtraService(selectExtra);
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
              style: TextStyle(fontSize: 14, color: isSelected ? Colors.white : Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              price,
              style: TextStyle(fontSize: 12, color: isSelected ? Colors.white : Colors.grey, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceDetails() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('จำนวนสินค้า ${amount} ชิ้น', style: TextStyle(fontSize: 16)),
            Text('¥${widget.product['price']} (~฿55.56)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('บริการเสริม ()', style: TextStyle(fontSize: 16)),
            Text('¥500 (~฿2447.94)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}
