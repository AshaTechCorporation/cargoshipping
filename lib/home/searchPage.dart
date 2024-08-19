import 'package:cargoshipping/Itempage/itempage.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/widgets/OurItem.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
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
        backgroundColor: Colors.red, // ตั้งค่าสีพื้นหลังเป็นสีแดง
        title: SafeArea(
          // เพิ่ม SafeArea
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: size.height * 0.05,
                width: size.width * 0.85,
                margin: const EdgeInsets.all(1.0),
                padding: const EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 122, 124, 126)),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white, // ทำให้ Container พื้นหลังเป็นสีขาว
                ),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.27,
                        child: TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors
                                .white, // พื้นหลังสีขาวสำหรับ TextFormField
                            filled: true,
                            border: InputBorder.none,
                            hintText: 'ค้นหาสินค้า',
                            contentPadding:
                                EdgeInsets.only(left: 10, bottom: 10),
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
                        decoration: BoxDecoration(
                          color: Colors
                              .white, // ทำให้พื้นหลัง DropdownButton เป็นสีขาว
                          borderRadius: BorderRadius.circular(15),
                        ),
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
                                .map((String item) => DropdownMenuItem<String>(
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
                        height: size.height * 0.04,
                        width: size.width * 0.23,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.red,
                        ),
                        child: Center(
                          child: Text(
                            'ค้นหา',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
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
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.35, 0.7], // ปรับค่า stops ให้ fade ค่อยๆ จางลง
            ),
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // จัดตำแหน่งให้เริ่มจากซ้าย
            children: [
              Container(
                width: 357,
                height: 50,
                margin: EdgeInsets.all(10), // เพิ่ม margin รอบๆ container
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'คำค้นหา',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10), // เพิ่มระยะห่างระหว่าง container และ wrap
              Center(
                child: Wrap(
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
                              size: MediaQuery.of(context).size,
                              title: listProducts[index]['detail'],
                              price: (listProducts[index]['price'] as num)
                                  .toDouble(),
                              products: listProducts[index],
                              press: () {},
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
