import 'package:cargoshipping/constants.dart';
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
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 0.01,
          ),
          Container(
            height: size.height * 0.04,
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
                aspectRatio: 2,
                child: Image.asset(
                  imagespath,
                  // height:size.height * 0.1 ,
                  // fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          SizedBox(
            height: size.height * 0.05,
            width: size.width * 0.19,
            child: Column(
              children: [
                Text(
                  title,
                  textAlign:
                      TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
