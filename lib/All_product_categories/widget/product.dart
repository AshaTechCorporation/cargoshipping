import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  const Product({
    super.key,
    required this.size,
    required this.title,
    required this.press,
    required this.image,
  });

  final Size size;
  final String title;
  final VoidCallback press;
  final String image;

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        
      },
      child: Column(
        children: [
          Container(
            height: 80, // ปรับความสูงของภาพ
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset(
                widget.image,
                // fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            widget.title,
            style: TextStyle(fontSize: 14),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
