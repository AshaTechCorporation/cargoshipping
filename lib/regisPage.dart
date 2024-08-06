import 'package:cargoshipping/loginPage.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class registerpage extends StatefulWidget {
  const registerpage({super.key});

  @override
  State<registerpage> createState() => _registerpageState();
}

class _registerpageState extends State<registerpage> {
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();

  final List<String> genderItems = [
    'Male',
    'Female',
  ];

  String? selectedValue;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'ลงทะเบียนผู้ใช้งาน',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[500]),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (bool? value) {}),
                      Text('นิติบุคคล/ตัวแทน'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (bool? value) {}),
                      Text('บุคคลทั่วไป'),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              DropdownButtonFormField2<String>(
              isExpanded: true,
              decoration: InputDecoration(
                // Add Horizontal padding using menuItemStyleData.padding so it matches
                // the menu padding when button's width is not specified.
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                // Add more decoration..
              ),
              hint: const Text(
                'Select Your Gender',
                style: TextStyle(fontSize: 14),
              ),
              items: genderItems
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
                  return 'Please select gender.';
                }
                return null;
              },
              onChanged: (value) {
                //Do something when selected item is changed.
              },
              onSaved: (value) {
                selectedValue = value.toString();
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
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'ชื่อ',
                  labelStyle: const TextStyle(), //textfield modifly
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0), // มุมโค้งของขอบ
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _lastnameController,
                decoration: InputDecoration(
                  hintText: 'นามสกุล',
                  labelStyle: const TextStyle(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0), // มุมโค้งของขอบ
                  ), //textfield modifly
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _companyController,
                decoration: InputDecoration(
                  hintText: 'ชื่อบริษัท หรือรหัสตัวแทน',
                  labelStyle: const TextStyle(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0), // มุมโค้งของขอบ
                  ), //textfield modifly
                ),
              ),
              TextField(
                controller: _telController,
                decoration: InputDecoration(
                  hintText: 'เบอร์โทรติดต่อ',
                  labelStyle: const TextStyle(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0), // มุมโค้งของขอบ
                  ), //textfield modifly
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  labelStyle: const TextStyle(), //textfield modifly
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  suffixIcon: Icon(Icons.remove_red_eye_outlined),
                  hintText: 'รหัสผ่าน',
                  labelStyle: const TextStyle(),
                  //textfield modifly
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  suffixIcon: Icon(Icons.remove_red_eye_outlined),
                  hintText: 'ยืนยันรหัสผ่าน',
                  labelStyle: const TextStyle(),
                  //textfield modifly
                ),
                obscureText: true,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 130, vertical: 15), // การเว้นระยะในปุ่ม
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    // มุมโค้งของปุ่ม
                  ),
                ),
                child: const Text(
                  'สมัครสมาชิก',
                  style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
