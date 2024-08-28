import 'package:cargoshipping/constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class Addnewaddresspage extends StatefulWidget {
  const Addnewaddresspage({super.key});

  @override
  State<Addnewaddresspage> createState() => _AddnewaddresspageState();
}

class _AddnewaddresspageState extends State<Addnewaddresspage> {
  final TextEditingController _addressnameController = TextEditingController();
  final TextEditingController _addresstelController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final List<String> newaddressprovice = [
    '5',
    '6',
  ];
  final List<String> newaddressdistrict = [
    '2',
    '4',
  ];
  final List<String> newaddresssubdistrict = [
    '7',
    '9',
  ];
  final List<String> newaddresszipcode = [
    '8',
    '6',
  ];

  String? selectednewaddressprovice;

  String? selectednewaddressdistrict;

  String? selectednewaddresssubdistrict;

  String? selectednewaddresszipcode;

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: Text(
          'เพิ่มที่อยู่ใหม่',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: background,
          child: Column(
            children: [
              Container(
                color: Colors.grey[300],
                height: size.height * 0.055,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    'ข้อมูลทางติดต่อ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: size.height * 0.05,
                color: white,
                child: TextField(
                  controller: _addressnameController,
                  decoration: InputDecoration(
                    hintText: 'ชื่อ นามสกุล',
                    hintStyle: TextStyle(
                      fontSize: 13,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.004),
              Container(
                height: size.height * 0.05,
                color: white,
                child: TextField(
                  controller: _addresstelController,
                  decoration: InputDecoration(
                    hintText: 'หมายเลขโทรศัพท์',
                    hintStyle: TextStyle(
                      fontSize: 13,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.grey[300],
                height: size.height * 0.07,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Row(
                    children: [
                      Text(
                        'ที่อยู่',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: white,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Text(
                      'จังหวัด',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: newaddressprovice
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
                    value: selectednewaddressprovice,
                    onChanged: (String? value) {
                      setState(() {
                        selectednewaddressprovice = value;
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
              Divider(
                height: size.height * 0.008,
              ),
              Container(
                width: double.infinity,
                color: white,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Text(
                      'เขต/อำเภอ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: newaddressdistrict
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
                    value: selectednewaddressdistrict,
                    onChanged: (String? value) {
                      setState(() {
                        selectednewaddressdistrict = value;
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
              Divider(
                height: size.height * 0.008,
              ),
              Container(
                color: white,
                width: double.infinity,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Text(
                      'แขวง/ตำบล',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: newaddresssubdistrict
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
                    value: selectednewaddressdistrict,
                    onChanged: (String? value) {
                      setState(() {
                        selectednewaddressdistrict = value;
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
              Divider(
                height: size.height * 0.008,
              ),
              Container(
                color: white,
                width: double.infinity,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Text(
                      'รหัสปรษณีย์',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: newaddresszipcode
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
                    value: selectednewaddresszipcode,
                    onChanged: (String? value) {
                      setState(() {
                        selectednewaddresszipcode = value;
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
              Divider(
                height: size.height * 0.008,
              ),
              Container(
                height: size.height * 0.05,
                color: white,
                child: TextField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    hintText: 'บ้านเลขที่, ซอย, หมู่, ถนน, แขวง/ถนน',
                    hintStyle: TextStyle(
                      fontSize: 13,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                height: size.height * 0.05,
                width: double.infinity,
                color: white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'เลือกเป็นที่อยู่ตั้งต้น',
                        style: TextStyle(fontSize: 16),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                            checkboxTheme: CheckboxThemeData(
                          side: BorderSide(
                            color: red1,
                            width: 1.0,
                          ),
                        )),
                        child: Checkbox(
                          value: _isChecked,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _isChecked = newValue ?? false;
                            });
                            if (_isChecked) {
                              print('Checkbox ถูกเลือก');
                            } else {
                              print('Checkbox ถูกยกเลิก');
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.09,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Text('เพิ่มเรียบร้อย'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('ตกลง'))
                          ],
                        );
                      });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: arrowcolor,
                      borderRadius: BorderRadius.circular(10)),
                  width: size.width * 0.8,
                  height: size.height * 0.06,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'ยืนยัน',
                        style: TextStyle(
                            fontSize: 13,
                            color: white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
