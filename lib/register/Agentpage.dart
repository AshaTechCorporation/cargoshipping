import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/login/loginPage.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class Agentpage extends StatefulWidget {
  const Agentpage({super.key});

  @override
  State<Agentpage> createState() => _AgentpageState();
}

class _AgentpageState extends State<Agentpage> {
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _reccomController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _birthController = TextEditingController();
  final TextEditingController _importercodeController = TextEditingController();
  final TextEditingController _taxController = TextEditingController();
  final TextEditingController _hometelController = TextEditingController();
  final TextEditingController _cargonameController = TextEditingController();
  final TextEditingController _cargowebController = TextEditingController();

// dropdown
  final List<String> provice = [
    '9',
    '4',
  ];

  final List<String> district = [
    '1',
    '2',
  ];

  final List<String> subdistrict = [
    '1',
    '2',
  ];
  final List<String> zipcode = [
    '3',
    '4',
  ];

  final List<String> comprovice = [
    '5',
    '1',
  ];

  final List<String> comdistrict = [
    '1',
    '2',
  ];

  final List<String> comsubdistrict = [
    '1',
    '2',
  ];
  final List<String> comzipcode = [
    '3',
    '4',
  ];

  final List<String> _formatsent = [
    '3',
    '4',
  ];

  final List<String> totalsend = [
    '5',
    '6',
  ];

  final List<String> sendoften = [
    '7',
    '8',
  ];

  final List<String> importtype = [
    '2',
    '4',
  ];

  final List<String> userwant = [
    '8',
    '6',
  ];
  String? selectedprovice;

  String? selecteddistrict;

  String? selectedsubdistrict;

  String? selectedzipcode;

  String? selectedcomprovice;

  String? selectedcomdistrict;

  String? selectedcomsubdistrict;

  String? selectedcomzipcode;

  String? selectedtotalsend;

  String? selectedformatsent;

  String? selectedsendoften;

  String? selectedimporttype;

  String? selecteduserwant;

// checkbox
  String? _selectedGender;

  String? _selecteduseto;

  // final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'ลงทะเบียนผู้ใช้งานตัวแทน (Agent)',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: size.height * 0.02,
                ),
                Image.asset(
                  'assets/images/logofull.png',
                  width: size.width * 0.59,
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Container(
                  height: size.height * 0.052,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: white,
                  ),
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'ชื่อ',
                      labelStyle: const TextStyle(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                 Container(
                  height: size.height * 0.052,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: white,
                  ),
                  child: TextField(
                    controller: _lastnameController,
                    decoration: InputDecoration(
                      hintText: 'นามสกุล',
                      labelStyle: const TextStyle(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Container(
                  height: size.height * 0.052,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: white,
                  ),
                  child: TextField(
                    controller: _telController,
                    decoration: InputDecoration(
                      hintText: 'เบอร์มือถือ',
                      labelStyle: TextStyle(),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                 Container(
                  height: size.height * 0.052,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: white,
                  ),
                  child: TextField(
                    controller: _birthController,
                    decoration: InputDecoration(
                      hintText: 'วันเกิด',
                      labelStyle: TextStyle(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'เพศ',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                        Checkbox(
                          value: _selectedGender == 'Male',
                          onChanged: (bool? value) {
                            setState(() {
                              if (value == true) {
                                _selectedGender = 'Male';
                              } else {
                                _selectedGender = null;
                              }
                            });
                          },
                        ),
                        Text('ชาย', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    SizedBox(width: 20),
                    Row(
                      children: [
                        Checkbox(
                          value: _selectedGender == 'Female',
                          onChanged: (bool? value) {
                            setState(() {
                              if (value == true) {
                                _selectedGender = 'Female';
                              } else {
                                _selectedGender = null;
                              }
                            });
                          },
                        ),
                        Text('หญิง', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ],
                ),
                 Container(
                  height: size.height * 0.052,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: white,
                  ),
                  child: TextField(
                    controller: _importercodeController,
                    decoration: InputDecoration(
                      hintText: 'รหัสผู้นำเข้า',
                      labelStyle: const TextStyle(),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(15.0),
                      ), 
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                 Container(
                  height: size.height * 0.052,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: white,
                  ),
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
                      hintText: 'รหัสผ่าน',
                      labelStyle: const TextStyle(),
                      
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                 Container(
                  height: size.height * 0.052,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: white,
                  ),
                  child: TextField(
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
                      hintText: 'ยืนยันรหัสผ่าน',
                      labelStyle: const TextStyle(),
                      
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                const SizedBox(height: 20),
                 Container(
                  height: size.height * 0.052,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: white,
                  ),
                  child: TextField(
                    controller: _reccomController,
                    decoration: InputDecoration(
                      hintText: 'ผู้แนะนำ',
                      labelStyle: const TextStyle(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                 Container(
                  height: size.height * 0.052,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: white,
                  ),
                  child: TextField(
                    controller: _companyController,
                    decoration: InputDecoration(
                      hintText: 'ชื่อบริษัทฯ ห้างร้าน ห้างหุ้นส่วน',
                      labelStyle: TextStyle(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                 Container(
                  height: size.height * 0.052,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: white,
                  ),
                  child: TextField(
                    controller: _taxController,
                    decoration: InputDecoration(
                      hintText: 'เลขที่ผู้เสียภาษี',
                      labelStyle: TextStyle(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ที่อยู่บริษัทฯ ',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.01),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    
                  ),
                  hint: const Text(
                    'จังหวัด',
                    style: TextStyle(fontSize: 14),
                  ),
                  items: comprovice
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'please select distict';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  onSaved: (value) {
                    selectedcomprovice = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    
                  ),
                  hint: const Text(
                    'อำเภอ',
                    style: TextStyle(fontSize: 14),
                  ),
                  items: comdistrict
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'please select distict';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  onSaved: (value) {
                    selectedcomdistrict = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  hint: const Text(
                    'ตำบล',
                    style: TextStyle(fontSize: 14),
                  ),
                  items: comdistrict
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'please select distict';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  onSaved: (value) {
                    selectedcomsubdistrict = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    
                  ),
                  hint: const Text(
                    'รหัสไปรษณีย์',
                    style: TextStyle(fontSize: 14),
                  ),
                  items: comdistrict
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select zipcode.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    //
                  },
                  onSaved: (value) {
                    selectedcomzipcode = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                 Container(
                  height: size.height * 0.052,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: white,
                  ),
                  child: TextField(
                    controller: _hometelController,
                    decoration: InputDecoration(
                      hintText: 'เบอร์โทรศัพท์',
                      labelStyle: TextStyle(),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(15.0), 
                      ), 
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                 Container(
                  height: size.height * 0.052,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: white,
                  ),
                  child: TextField(
                    controller: _cargonameController,
                    decoration: InputDecoration(
                      hintText: 'ชื่อคาร์โก้ของท่าน',
                      labelStyle: TextStyle(),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(15.0), 
                      ), 
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                 Container(
                  height: size.height * 0.052,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: white,
                  ),
                  child: TextField(
                    controller: _cargowebController,
                    decoration: InputDecoration(
                      hintText: 'เว็บไซต์คาร์โก้ของท่าน',
                      labelStyle: TextStyle(),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('รูปภาพคาร์โก้'),
                    GestureDetector(
                      onTap: () {
                        print('object');
                      },
                      child: Container(
                        width: size.width * 0.47,
                        height: size.height * 0.069,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'อัพโหลดไฟล์รูป',
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: size.height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ที่อยู่การจัดส่งในไทย',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.01),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  hint: const Text(
                    'จังหวัด',
                    style: TextStyle(fontSize: 14),
                  ),
                  items: provice
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select zipcode.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    //
                  },
                  onSaved: (value) {
                    selectedprovice = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    
                  ),
                  hint: const Text(
                    'อำเภอ',
                    style: TextStyle(fontSize: 14),
                  ),
                  items: district
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select zipcode.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    //
                  },
                  onSaved: (value) {
                    selecteddistrict = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    
                  ),
                  hint: const Text(
                    'ตำบล',
                    style: TextStyle(fontSize: 14),
                  ),
                  items: subdistrict
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'please select distict';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  onSaved: (value) {
                    selectedsubdistrict = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  hint: const Text(
                    'รหัสไปรษณีย์',
                    style: TextStyle(fontSize: 14),
                  ),
                  items: zipcode
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select zipcode.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    //
                  },
                  onSaved: (value) {
                    selectedzipcode = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                SizedBox(height: size.height * 0.01),
                Container(
                    height: size.height * 0.058,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all()),
                    child: Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Image.asset('assets/icons/pin.png'),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Text(
                          'พิกัด Google map',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        )
                      ],
                    )),
                SizedBox(height: size.height * 0.05),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  hint: const Text(
                    'รูปแบบส่งต่อ(ในไทย)',
                    style: TextStyle(fontSize: 14),
                  ),
                  items: _formatsent
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select format.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    //
                  },
                  onSaved: (value) {
                    selectedformatsent = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'เคยนำเข้าสินค้าจากจีนแล้วหรือไม่',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: _selecteduseto == 'เคย',
                          onChanged: (bool? value) {
                            setState(() {
                              if (value == true) {
                                _selecteduseto = 'เคย';
                              } else {
                                _selecteduseto = null;
                              }
                            });
                          },
                        ),
                        Text('เคย', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    SizedBox(width: 20),
                    Row(
                      children: [
                        Checkbox(
                          value: _selecteduseto == 'ไม่เคย',
                          onChanged: (bool? value) {
                            setState(() {
                              if (value == true) {
                                _selecteduseto = 'ไม่เคย';
                              } else {
                                _selecteduseto = null;
                              }
                            });
                          },
                        ),
                        Text('ไม่เคย', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.01),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  hint: const Text(
                    'ยอดจำนวนค่าขนส่งที่เคยนำเข้าต่อครั้ง ',
                    style: TextStyle(fontSize: 14),
                  ),
                  items: totalsend
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'please select ยอดจำนวนส่ง';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  onSaved: (value) {
                    selectedtotalsend = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  hint: const Text(
                    'ท่านนำเข้าบ่อยหรือไม่ ',
                    style: TextStyle(fontSize: 14),
                  ),
                  items: sendoften
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'please select ยอดจำนวนส่ง';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  onSaved: (value) {
                    selectedsendoften = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    
                  ),
                  hint: const Text(
                    'ต้องการนำเข้าแบบใด ',
                    style: TextStyle(fontSize: 14),
                  ),
                  items: importtype
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'กรุณากรอก';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  onSaved: (value) {
                    selectedimporttype = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    
                  ),
                  hint: const Text(
                    'สิ่งที่ท่านต้องการ ',
                    style: TextStyle(fontSize: 14),
                  ),
                  items: userwant
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'กรุณากรอก';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  onSaved: (value) {
                    selecteduserwant = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                Text(
                  'หรือ',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: size.height * 0.012,
                ),
                Container(
                  height: size.height * 0.06,
                  width: size.width * 0.91,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Colors.black.withOpacity(0.1), 
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/google.png'),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Text(
                          'ดำเนินการต่อด้วยบัญชี Google',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: size.height * 0.06,
                  width: size.width * 0.91,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Colors.black.withOpacity(0.1), 
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/facebook.png'),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Text(
                          'ดำเนินการต่อด้วยบัญชี Facebook',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: size.height * 0.06,
                  width: size.width * 0.91,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Colors.black.withOpacity(0.1), 
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/line.png'),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Text(
                          'ดำเนินการต่อด้วยบัญชี Line',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: size.height * 0.06,
                  width: size.width * 0.91,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Colors.black.withOpacity(0.1), 
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/apple.png'),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Text(
                          'ดำเนินการต่อด้วยบัญชี Apple',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          width: double.infinity,
          height: size.height * 0.073,
          decoration: BoxDecoration(
              color: red1, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: TextButton(
              onPressed: () {
                print('succes');
              },
              child: Text(
                'สมัครสมาชิก',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
