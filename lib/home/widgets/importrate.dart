import 'package:flutter/material.dart';

class Importrate extends StatelessWidget {
  const Importrate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('เรทราคานำเข้า'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10)
              ),
              width: 358,
              child: Column(
                children: [
                  Text('เรทราคานำเข้า'),
                  
                ],
              ),
            ),
          ),
        ));
  }
}
