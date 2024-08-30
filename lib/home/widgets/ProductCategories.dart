import 'package:flutter/material.dart';
class ProductCategories extends StatelessWidget {
  final Size size;
  final String title;
  final VoidCallback press;
  final String imagespath;

  const ProductCategories({
    Key? key,
    required this.size,
    required this.title,
    required this.press,
    required this.imagespath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150, // กำหนดความกว้างที่ชัดเจน
            height: 80, // กำหนดความสูงที่ชัดเจน
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage(imagespath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
