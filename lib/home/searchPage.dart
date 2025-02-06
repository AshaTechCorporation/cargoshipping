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
        backgroundColor: red1,
        toolbarHeight: size.height * 0.099,
        title: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.08),
          child: Container(
            height: size.height * 0.045,
            width: size.width * 0.98,
            margin: const EdgeInsets.symmetric(horizontal: 0.1, vertical: 3.0),
            padding: EdgeInsets.symmetric(horizontal: 0.1),
            decoration: BoxDecoration(
                border:
                    Border.all(color: const Color.fromARGB(255, 122, 124, 126)),
                borderRadius: BorderRadius.circular(15),
                color: Colors.white),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  SizedBox(
                    width: size.width * 0.28,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'ค้นหาสินค้า',
                        contentPadding: EdgeInsets.only(left: 15, bottom: 10),
                      ),
                    ),
                  ),
                  Icon(Icons.camera_alt_outlined),
                  VerticalDivider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  SizedBox(
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
                          width: 130,
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: size.width * 0.01,
                  // ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Searchpage()),
                      // );
                    },
                    child: Container(
                      height: size.height * 0.05,
                      width: size.width * 0.172,
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
                  ),
                ],
              ),
            ),
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
                      price: listProducts[index]['price'].toString(),
                      detail: listProducts[index]['detail'],
                      press: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => Itempage(
                        //       size: MediaQuery.of(context).size,
                        //       title: listProducts[index]['detail'],
                        //       price: (listProducts[index]['price'] as num)
                        //           .toDouble(),
                        //       products: listProducts[index],
                        //       press: () {},
                        //       num_iid: '721593979484',
                        //       type: 'taobao',
                        //       name: 'xxx',
                        //     ),
                        //   ),
                        // );
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
