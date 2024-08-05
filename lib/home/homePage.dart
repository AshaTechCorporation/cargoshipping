import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/widgets/OurServicesWidget.dart';
import 'package:cargoshipping/widgets/PictureSliderWidget.dart';
import 'package:cargoshipping/home/widgets/ProductCategories.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //แสดงภาพสไลด์
            PictureSliderWidget(size: size),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.02, horizontal: size.width * 0.01),
              child: Row(
                children: [Text('บริการของเรา', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],
              ),
            ),
            Wrap(
              spacing: 15,
              runSpacing: 10,
              children: List.generate(
                titleData.length,
                (index) => OurServicesWidget(
                  size: size,
                  title: titleData[index],
                  press: () {},
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.02, horizontal: size.width * 0.01),
              child: Row(
                children: [Text('หมวดหมู่สินค้า', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],
              ),
            ),
            Wrap(
              spacing: 15,
              runSpacing: 10,
              children: List.generate(
                8,
                (index) => ProductCategories(
                  size: size,
                  title: 'x',
                  press: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
