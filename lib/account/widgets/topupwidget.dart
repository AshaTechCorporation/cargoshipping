import 'package:flutter/material.dart';

class Topupwidget extends StatefulWidget {
  const Topupwidget(
      {super.key,
      required this.size,
      required this.title,
      required this.press});

  final Size size;
  final String title;
  final VoidCallback press;

  @override
  State<Topupwidget> createState() => _TopupwidgetState();
}

class _TopupwidgetState extends State<Topupwidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.057,
      width: size.width * 0.43,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
            topLeft: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0)),
      ),
      child: Center(
          child: Text(widget.title,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black))),
    );
  }
}
