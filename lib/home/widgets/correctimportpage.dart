import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/widgets/importproductlistpage.dart';
import 'package:flutter/material.dart';

class Correctimportpage extends StatefulWidget {
  const Correctimportpage({super.key});

  @override
  State<Correctimportpage> createState() => _CorrectimportpageState();
}

class _CorrectimportpageState extends State<Correctimportpage> {
  bool _isExpanded = false;
  String selectedValue = 'เลขที่ PO'; // ค่าเริ่มต้นที่เลือก
  List<String> items = ['เลขที่ PO', 'PO1234', 'PO5678', 'PO9101'];
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
              height: size.height * 0.33,
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'เลือกรายการนำเข้า',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpansionPanelList(
                        elevation: 2,
                        expandedHeaderPadding: EdgeInsets.all(0),
                        expansionCallback: (int index, bool isExpanded) {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        },
                        children: [
                          ExpansionPanel(
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return ListTile(
                                title: Text(
                                    selectedValue), // แสดงค่าที่เลือกเป็นหัวข้อ
                              );
                            },
                            body: Column(
                              children: items.map((String value) {
                                return ListTile(
                                  title: Text(value),
                                  onTap: () {
                                    setState(() {
                                      selectedValue =
                                          value; // เปลี่ยนค่าที่เลือก
                                      _isExpanded =
                                          false; // ปิด panel หลังจากเลือกค่าแล้ว
                                    });
                                  },
                                );
                              }).toList(),
                            ),
                            isExpanded: _isExpanded, // เช็คสถานะการขยาย
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
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
          SizedBox(height: size.height * 0.4),
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
          ),
        ],
      ),
    );
  }
}
