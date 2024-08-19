import 'package:flutter/material.dart';

class Importwidget extends StatelessWidget {
  const Importwidget(
      {super.key,
      required this.size,
      required this.title,
      required this.press});
  final Size size;
  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.067,
      width: size.width * 0.43,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
            topLeft: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0)),
      ),
      child: Center(
          child: Text(title,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black))),
    );
  }
}
