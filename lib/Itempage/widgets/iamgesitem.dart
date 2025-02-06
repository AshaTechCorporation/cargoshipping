import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class ImagesItem extends StatelessWidget {
  const ImagesItem({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      height: 470,
      alignment: Alignment.topCenter,
      child: Image.network(
        image, // ใช้ products['image'] โดยตรง
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (context, error, stackTrace) => Image.asset(
          width: double.infinity,
          height: double.infinity,
          'assets/images/logofull.png',
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
