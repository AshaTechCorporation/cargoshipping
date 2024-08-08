import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/widgets/OurItem.dart';
import 'package:cargoshipping/home/widgets/OurServicesWidget.dart';
import 'package:cargoshipping/widgets/PictureSliderWidget.dart';
import 'package:cargoshipping/home/widgets/ProductCategories.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

  String? selectedValue;

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
                  width: size.width * 0.85,
                  margin: const EdgeInsets.all(3.0),
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
                                border: InputBorder.none, hintText: 'Search'),
                          ),
                        ),
                        Icon(Icons.camera_alt_outlined),
                        VerticalDivider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        Container(
                          height: size.height * 0.05,
                          width: size.width * 0.23,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: Align(
                                alignment: Alignment
                                    .centerLeft,
                                child: Text(
                                  'Taobao',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              items: items
                                  .map(
                                      (String item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ))
                                  .toList(),
                              value: selectedValue,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedValue = value;
                                });
                              },
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                height: 40,
                                width: 140,
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        Container(
                          height: size.height * 0.05,
                          width: size.width * 0.14,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.red),
                          child: Center(
                              child: Text(
                            'ค้นหา',
                            style: TextStyle(color: Colors.white),
                          )),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // ดำเนินการตามที่คุณต้องการเมื่อไอคอนถูกแตะ
                    print("Icon tapped");
                  },
                  child: Icon(
                    Icons.favorite_border_outlined,
                  ), // ไอคอนที่จะแสดง
                )
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
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.02, horizontal: size.width * 0.01),
              child: Row(
                children: [
                  Expanded(
                    child: RichText(
                        text: TextSpan(
                            text: 'สินค้าแนะนำ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                            children: <TextSpan>[
                          TextSpan(
                            text: ' จาก Taobao',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )
                        ])),
                  ),
                ],
              ),
            ),

            ListView(
              shrinkWrap: true,
              // physics: ClampingScrollPhysics(),
              children: [
                GridView.count(
                  crossAxisCount: 2, 
                  crossAxisSpacing: 10, 
                  mainAxisSpacing: 15, 
                  shrinkWrap: true,
                  children: List.generate(
                      reccomproduct.length,
                      (index) => ouritem(
                            size: size,
                            price: 20,
                            title: reccomproduct[index],
                            press: () {},
                          )
                      ),
                ),
              ],
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
