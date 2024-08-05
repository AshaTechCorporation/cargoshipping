import 'package:flutter/material.dart';

class PictureSliderWidget extends StatelessWidget {
  const PictureSliderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: size.height * 0.22,
        width: size.width * 0.98,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0), 
            bottomRight: Radius.circular(20.0), 
            topLeft: Radius.circular(20.0), 
            bottomLeft: Radius.circular(20.0)),
        ),              
      ),
    );
  }
}