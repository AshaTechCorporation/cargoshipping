import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Guidepage extends StatelessWidget {
  const Guidepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: Text('คู่มือการใช้งาน',style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}