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
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size.width * 0.3,
            height: size.height * 0.092,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              image: DecorationImage(
                image: AssetImage(imagespath),
                //image: NetworkImage(imagespath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.01),
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
