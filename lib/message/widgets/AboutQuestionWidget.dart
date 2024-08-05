import 'package:flutter/material.dart';

class AboutQuestionWidget extends StatelessWidget {
  const AboutQuestionWidget({super.key,required this.size,required this.title,required this.press});
  final Size size;
  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.height * 0.05,
        width: size.width * 0.45,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 204, 200, 200),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.0), 
            bottomRight: Radius.circular(10.0), 
            topLeft: Radius.circular(10.0), 
            bottomLeft: Radius.circular(10.0)),
        ),
        child: Center(child: Text(title, style: TextStyle(fontWeight: FontWeight.bold),)),       
      );
  }
}