import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/widgets/paperlessfiles.dart';
import 'package:flutter/material.dart';

class Paperless extends StatefulWidget {
  const Paperless({super.key});

  @override
  _PaperlessState createState() => _PaperlessState();
}

class _PaperlessState extends State<Paperless> {
  // ตัวแปรเก็บข้อมูลจากผู้ใช้
  String companyName = '';
  String companyAddress = '';
  String taxNumber = '';
  String province = '';
  String district = '';
  String subDistrict = '';
  String postalCode = '';
  String userFirstName = '';
  String userLastName = '';
  String phoneNumber = '';
  String email = '';
  List<String> uploadedFiles = ['', '', '', '']; // สำหรับอัพโหลดไฟล์

  bool isSubmitted = false; // ตัวแปรตรวจสอบว่าส่งฟอร์มหรือยัง
  bool isPaid = false; // ตัวแปรตรวจสอบว่าชำระเงินแล้วหรือไม่

  bool isChecked1 = true;
  bool isChecked2 = false;

  void _onChanged(int index) {
    setState(() {
      // ถ้าเป็น checkbox ที่ถูกเลือกอยู่ ให้ทำการ uncheck
      if (index == 1) {
        isChecked1 = !isChecked1;
        if (isChecked1) isChecked2 = false;
      } else {
        isChecked2 = !isChecked2;
        if (isChecked2) isChecked1 = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'ขึ้นทะเบียนผู้นำเข้า',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: backgroundColor,
          ),
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
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(size.height * 0.03),
              child:
                  // ? _buildSummaryView(
                  //     size) // ถ้าเป็น true จะแสดงข้อมูลที่กรอกแล้ว
                  _buildFormView(size), // ถ้ายังไม่กดปุ่ม จะแสดงฟอร์มกรอกข้อมูล
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: size.height * 0.085,
        child: BottomAppBar(
          color: white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Paperlessfiles()),
                  );
                },
                child: Container(
                  height: size.height * 0.07,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: red1,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'ยืนยันข้อมูลผู้นำเข้า',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: size.width * 0.004,
                height: size.height * 0.1,
                color: greymess,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormView(Size size) {
    return Column(
      children: [
        Image.asset(
          'assets/images/logofull.png',
          width: size.width * 0.59,
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        _buildDropdown(
          'ชื่อบริษัทฯ ห้างร้าน ห้างหุ้นส่วน', // ใช้ชื่อเป็น hintText
          companyName, // ค่าที่จะถูกเก็บเมื่อเลือก
          ['บริษัท A', 'บริษัท B', 'บริษัท C'], // รายการชื่อบริษัท
          (value) =>
              setState(() => companyName = value!), // อัปเดตค่าเมื่อเลือก
          size,
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        _buildTextField(
            'เลขที่ผู้เสียภาษี', (value) => taxNumber = value, size),
        SizedBox(
          height: size.height * 0.02,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container ตัวที่ 1
              GestureDetector(
                onTap: () => _onChanged(1),
                child: Container(
                  height: size.height * 0.045,
                  width: size.width * 0.39,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isChecked1 ? Colors.red : Colors.grey,
                      width: 0.5,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(size.width * 0.01),
                        child: Container(
                          width: size.width * 0.055,
                          height: size.height * 0.025,
                          decoration: BoxDecoration(
                            color: isChecked1 ? Colors.transparent : greymess,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: isChecked1
                              ? Icon(
                                  Icons.check,
                                  size: size.height * 0.025,
                                  color: red1,
                                )
                              : null,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(size.width * 0.01),
                        child: Text(
                          'ลงทะเบียนแล้ว',
                          style: TextStyle(
                              color: isChecked1 ? red1 : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16),
              // Container ตัวที่ 2
              GestureDetector(
                onTap: () => _onChanged(2),
                child: Container(
                  height: size.height * 0.045,
                  width: size.width * 0.39,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isChecked2 ? Colors.red : Colors.grey,
                      width: 0.5,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(size.width * 0.01),
                        child: Container(
                          width: size.width * 0.055,
                          height: size.height * 0.025,
                          decoration: BoxDecoration(
                            color: isChecked2 ? Colors.transparent : greymess,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: isChecked2
                              ? Icon(
                                  Icons.check,
                                  size: size.height * 0.025,
                                  color: red1,
                                )
                              : null,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(size.width * 0.01),
                        child: Text(
                          'ยังไม่ได้ลงทะเบียน',
                          style: TextStyle(
                              color: isChecked2 ? red1 : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
          child: Row(
            children: [
              Text(
                'ที่อยู่บริษัทฯ ​',
                style: TextStyle(
                    fontSize: 13,
                    color: headingtext,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        _buildDropdown(
            'ที่อยู่บริษัทฯ',
            province,
            ['กรุงเทพมหานคร', 'เชียงใหม่', 'ขอนแก่น'],
            (value) => setState(() => province = value!),
            size),
        SizedBox(height: size.height * 0.01),
        _buildDropdown('อำเภอ', district, ['อำเภอเมือง', 'อำเภอหางดง'],
            (value) => setState(() => district = value!), size),
        SizedBox(height: size.height * 0.01),
        _buildDropdown('ตำบล', subDistrict, ['ตำบลสวนดอก', 'ตำบลท่าศาลา'],
            (value) => setState(() => subDistrict = value!), size),
        SizedBox(height: size.height * 0.01),
        _buildDropdown('รหัสไปรษณีย์', postalCode, ['50000', '50200'],
            (value) => setState(() => postalCode = value!), size),
        SizedBox(
          height: size.height * 0.02,
        ),
        _buildTextField(
            'ชื่อผู้มีอำนาจลงนาม', (value) => userFirstName = value, size),
        SizedBox(height: size.height * 0.01),
        _buildTextField('นามสกุล ผู้ใช้งานจองนำเข้า',
            (value) => userLastName = value, size),
        SizedBox(height: size.height * 0.01),
        _buildTextField('เบอร์มือถือ', (value) => phoneNumber = value, size),
        SizedBox(height: size.height * 0.01),
        _buildTextField('อีเมล์', (value) => email = value, size),
        SizedBox(height: size.height * 0.01),
      ],
    );
  }

  // ฟังก์ชันสร้าง TextField ที่สามารถปรับขนาดตาม width ของหน้าจอ
  Widget _buildTextField(String label, Function(String) onChanged, Size size) {
    return Container(
      width: size.width * 0.9,
      height: size.height * 0.045,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onChanged: onChanged,
      ),
    );
  }

  // ฟังก์ชันสร้าง Dropdown ที่สามารถปรับขนาดตาม width ของหน้าจอ
  Widget _buildDropdown(String hintText, String currentValue,
      List<String> options, Function(String?) onChanged, Size size) {
    return SizedBox(
      width: size.width * 0.9,
      height: size.height * 0.055,
      child: InputDecorator(
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: Colors.white, // กำหนดสีพื้นหลังเป็นสีขาว
          filled: true, // ต้องตั้งค่านี้เป็น true เพื่อให้ fillColor มีผล
        ),
        child: Center(
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: currentValue.isEmpty ? null : currentValue,
              isExpanded: true,
              hint: Text(
                hintText,
                style: TextStyle(fontSize: 15),
              ),
              items: options.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: onChanged,
              icon: Icon(
                Icons.keyboard_arrow_down, // Your custom icon
                size: 20, // Adjust the size of the icon
                color: kSecondTextColor, // Customize the icon color
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ฟังก์ชันสร้างข้อมูลที่แสดงผล และสามารถปรับขนาดได้
  Widget _buildSummaryField(String label, String value, Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: size.width * 0.9, // ปรับขนาดฟิลด์สรุปให้กว้าง 90% ของหน้าจอ
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: ' $label',
            border: OutlineInputBorder(),
          ),
          child: Text(value.isEmpty ? 'ไม่ระบุ' : value),
        ),
      ),
    );
  }

  // ฟังก์ชันสร้างส่วนอัพโหลดไฟล์ในรูปแบบ Row และสามารถปรับขนาดได้
}
