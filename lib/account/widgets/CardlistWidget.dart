import 'package:flutter/material.dart';

class CardlistWidget extends StatelessWidget {
  CardlistWidget({
    super.key,
    required this.size,
    required this.title,
    required this.press,
    required this.imagespath,
  });

  final Size size;
  final String title;
  final VoidCallback press;
  final String imagespath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: size.height * 0.09,
            width: size.width * 0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: AspectRatio(
                aspectRatio: 5,
                child: Container(
                  height: 50,
                  child: Image.asset(
                    imagespath,
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Text('$title',style: TextStyle(fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
