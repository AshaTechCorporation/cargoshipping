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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: size.height * 0.05,
                  width: size.width * 0.75,
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 122, 124, 126)),
                      borderRadius: BorderRadius.circular(15)),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.35,
                          child: TextFormField(
                           decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search'
                           ),
                          ),
                        ),
                        Icon(Icons.camera_alt_outlined),
                        VerticalDivider(
                          color: Colors.black,
                          thickness: 2,
                        ),
                        Container(
                          height: size.height * 0.05,
                          width: size.width * 0.16,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red),
                          child: Center(child: Text('ค้นหา',style: TextStyle(color: Colors.white),)),
                        )
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    size: 37,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.01),
            //แสดงภาพสไลด์
            PictureSliderWidget(size: size),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.02, horizontal: size.width * 0.01),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'บริการของเรา',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  
                ],
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
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.02, horizontal: size.width * 0.01),
              child: Row(
                children: [
                  Text(
                    'หมวดหมู่สินค้า',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )
                ],
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
