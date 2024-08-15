import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class ImagesItem extends StatelessWidget {
  const ImagesItem( {
    super.key,
    required this.products,
  });

  final Map<String, dynamic> products;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      ),
      height: 470,
      alignment: Alignment.topCenter,
      child: Image.asset(
        products['image'],  // ใช้ products['image'] โดยตรง
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
