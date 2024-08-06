import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> { //สินค้าแต่ละชิ้นในstore
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      child: Row(
        children: [
          Checkbox(
            value: _isSelected,
            onChanged: (bool? value) {
              setState(() {
                _isSelected = value ?? false;
              });
            },
          ),
          Placeholder(
              fallbackHeight: 60, fallbackWidth: 60), // Placeholder for image
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ตุ๊กตาหมี สีน้ำตาล ผูกโบว์'),
                Text('ตัวเดียว'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Y 20'),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {},
                        ),
                        Text('1'),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}