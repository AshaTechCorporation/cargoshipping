import 'package:cargoshipping/constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class Guidepage extends StatelessWidget {
  const Guidepage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.11),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,  
            title: Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: size.height * 0.045,
                    width: size.width * 0.85,
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 122, 124, 126)),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
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
                          // SizedBox(
                          //   height: size.height * 0.05,
                          //   width: size.width * 0.2,
                          //   child: DropdownButtonHideUnderline(
                          //     child: DropdownButton2<String>(
                          //       isExpanded: true,
                          //       hint: Align(
                          //         alignment: Alignment.centerLeft,
                          //         child: Text(
                          //           'เลือกสินค้า',
                          //           style: TextStyle(
                          //             fontSize: 11,
                          //             color: Colors.red,
                          //             fontWeight: FontWeight.bold,
                          //           ),
                          //         ),
                          //       ),
                          //       items: items
                          //           .map((String item) =>
                          //               DropdownMenuItem<String>(
                          //                 value: item,
                          //                 child: Text(
                          //                   item,
                          //                   style: const TextStyle(
                          //                     fontSize: 14,
                          //                   ),
                          //                 ),
                          //               ))
                          //           .toList(),
                          //       value: selectedValue,
                          //       onChanged: (String? value) {
                          //         setState(() {
                          //           selectedValue = value!;
                          //         });
                          //         getlistCategories(name: selectedValue);
                          //       },
                          //       buttonStyleData: const ButtonStyleData(
                          //         padding: EdgeInsets.symmetric(horizontal: 16),
                          //         height: 40,
                          //         width: 140,
                          //       ),
                          //       menuItemStyleData: const MenuItemStyleData(
                          //         height: 40,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            width: size.width * 0.001,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Implement navigation to Search page here
                            },
                            child: Container(
                              height: size.height * 0.05,
                              width: size.width * 0.17,
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
                  Icon(Icons.favorite_border_outlined),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: -50, // กำหนดให้ container เริ่มจากตำแหน่งด้านบน
            left: 0,
            right: 0,
            child: Container(
              height: 200, // ความสูงของ container
              decoration: BoxDecoration(
                color: Colors.blue
                    .withOpacity(0.5), // กำหนดสีพื้นหลังให้มีความโปร่งใสบ้าง
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Text(
                  'Container ซ้อน AppBar',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
