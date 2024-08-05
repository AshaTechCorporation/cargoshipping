import 'package:flutter/material.dart';

class OurServicesWidget extends StatelessWidget {
  OurServicesWidget({
    super.key,
    required this.size,
    required this.title,
    required this.press
  });

  final Size size;
  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
            height: size.height * 0.1,
            width: size.width * 0.2,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0), 
                bottomRight: Radius.circular(10.0), 
                topLeft: Radius.circular(10.0), 
                bottomLeft: Radius.circular(10.0)),
            ),
          ),
          Text('$title')
        ],
      ),
    );
  }
}