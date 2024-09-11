import 'package:flutter/material.dart';

class Importlist extends StatelessWidget {
  Importlist({super.key, required this.size,  required this.press,required this.imagespath,});

  final Size size;
  final VoidCallback press;
  final String imagespath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: size.height * 0.11,
            width: size.width * 0.33,
            decoration: BoxDecoration(
              // color: Colors.grey,
              borderRadius: BorderRadius.only(topRight: Radius.circular(10.0), bottomRight: Radius.circular(10.0), topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: AspectRatio(
                aspectRatio: 5,
                child: Image.asset(
                  imagespath,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          // Text('$title')
        ],
      ),
    );
  }
}
