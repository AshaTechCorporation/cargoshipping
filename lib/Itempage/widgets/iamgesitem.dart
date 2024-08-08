import 'package:flutter/material.dart';

class imagesItem extends StatelessWidget {
  const imagesItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow,
      ),
      height: 470,
      alignment: Alignment.topCenter,
      child: Image.asset(
        'assets/images/bear.jpg',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}