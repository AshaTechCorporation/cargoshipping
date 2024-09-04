import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Howto extends StatefulWidget {
  const Howto(
      {super.key,
      required this.size,
      required this.title,
      required this.press});

  final Size size;
  final String title;
  final VoidCallback press;

  @override
  State<Howto> createState() => _HowtoState();
}

class _HowtoState extends State<Howto> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * 0.0011),
        Container(
          height: size.height * 0.067,
          width: size.width * 0.9,
          decoration: BoxDecoration(
            color: greymess,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Center(
            child: Text(
              widget.title,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.01),
      ],
    );
  }
}
