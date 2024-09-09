import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/widgets/importproductlistpage.dart';
import 'package:flutter/material.dart';

class Correctimportpage extends StatefulWidget {
  const Correctimportpage({super.key});

  @override
  State<Correctimportpage> createState() => _CorrectimportpageState();
}

class _CorrectimportpageState extends State<Correctimportpage> {
  String selectedValue = 'เลขที่ PO';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'นำเข้าถูกต้อง',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 0.5,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.02,
          ),
          Center(
            child: Container(
              height: size.height * 0.08,
              width: size.width * 0.93,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'เลือกรายการนำเข้า',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: size.width * 0.6,
                    height: size.height * 0.04,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                      value: selectedValue,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 20,
                      elevation: 10,
                      style: TextStyle(color: Colors.black),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                      items: <String>['เลขที่ PO', 'PO1234', 'PO5678', 'PO9101']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Importproductlistpage(),
                ),
              );
            },
            child: Container(
              height: size.height * 0.04,
              width: size.width * 0.93,
              decoration: BoxDecoration(
                color: red1,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/pluslist.png'),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Text(
                    'เพิ่มรายการ',
                    style: TextStyle(color: white),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: size.height * 0.677),
          Container(
            height: size.height * 0.06,
            width: size.width * 0.93,
            decoration: BoxDecoration(
                color: red1, borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'ส่งเอกสาร',
                  style: TextStyle(
                      fontSize: 17, color: white, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
