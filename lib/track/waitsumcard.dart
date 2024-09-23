import 'package:cargoshipping/widgets/compete.dart';
import 'package:cargoshipping/widgets/prepare.dart';
import 'package:flutter/material.dart';

class Waitsumcard extends StatefulWidget {
  const Waitsumcard({super.key});

  @override
  State<Waitsumcard> createState() => _WaitsumcardState();
}

class _WaitsumcardState extends State<Waitsumcard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            compete(size: MediaQuery.of(context).size),
            preparetosend(size: MediaQuery.of(context).size),
            
          ],
        ),
      ),
    );
  }
}