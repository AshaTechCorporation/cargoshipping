import 'package:cargoshipping/Itempage/itempage.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/widgets/OurItem.dart';
import 'package:cargoshipping/home/widgets/ProductCategories.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class Allproduct extends StatefulWidget {
  const Allproduct({super.key});

  @override
  State<Allproduct> createState() => _AllproductState();
}

class _AllproductState extends State<Allproduct> {
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
        title: Text('หมวดหมู่สินค้าทั้งหมด'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: size.height * 0.05,
                  width: size.width * 0.9,
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
                              border: InputBorder.none,
                              hintText: 'ค้นหาสินค้า',
                              contentPadding:
                                  EdgeInsets.only(left: 15, bottom: 10),
                            ),
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
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '1688',
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
                          width: size.width * 0.193,
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
                    //logic here
                  },
                  child: Icon(
                    Icons.favorite_border_outlined,
                  ),
                )
              ],
            ),
            SizedBox(height: size.height * 0.01,),
            Wrap(
              spacing: 15,
              runSpacing: 10,
              children: List.generate(
                catagoryrecom.length,
                (index) => ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: (size.width - 15 * 3) / 4,
                  ),
                  child: ProductCategories(
                    size: size,
                    title: catagoryrecom[index],
                    press: () {},
                    imagespath: catagoryimg[index],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.02, horizontal: size.width * 0.035),
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
                            text: ' จาก 1668',
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
            Wrap(
              spacing: 20,
              runSpacing: 10,
              children: List.generate(
                  listProducts.length,
                  (index) => Ouritem(
                        image: listProducts[index]['image'],
                        sale: listProducts[index]['sale'],
                        send: listProducts[index]['send'],
                        size: MediaQuery.of(context).size,
                        price: (listProducts[index]['price'] as num).toDouble(),
                        detail: listProducts[index]['detail'],
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => itempage(
                                size: size,
                                title: listProducts[index]['detail'],
                                price: (listProducts[index]['price'] as num)
                                    .toDouble(),
                                products: listProducts[index],
                                press: () {},
                              ),
                            ),
                          );
                        },
                      )),
            ),
          ],
          
        ),
      ),
    );
  }
}
