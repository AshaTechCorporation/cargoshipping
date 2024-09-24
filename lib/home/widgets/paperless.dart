import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/widgets/correctimportpage.dart';
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

  // รายการดรอปดาวน์สำหรับ อำเภอ ตำบล รหัสไปรษณีย์
  List<String> districts = ['อำเภอเมือง', 'อำเภอหางดง', 'อำเภอสันกำแพง'];
  List<String> subDistricts = ['ตำบลสวนดอก', 'ตำบลท่าศาลา', 'ตำบลสันป่าตอง'];
  List<String> postalCodes = ['50000', '50200', '50130'];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // ดึงขนาดหน้าจอ

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'ขึ้นทะเบียนผู้นำเข้า',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        backgroundColor: white,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(size.height * 0.01),
              child: isSubmitted
                  ? _buildSummaryView(size) // ถ้าเป็น true จะแสดงข้อมูลที่กรอกแล้ว
                  : _buildFormView(size), // ถ้ายังไม่กดปุ่ม จะแสดงฟอร์มกรอกข้อมูล
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                // เมื่อกดปุ่มจะเปลี่ยนสถานะเป็นส่งข้อมูลแล้ว
                isSubmitted = true;
              });

              Future.delayed(Duration(seconds: 1), () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Correctimportpage(),
                  ),
                );
              });
            },
            child: Container(
              height: size.height * 0.053,
              width: size.width * 0.9,
              decoration: BoxDecoration(
                color: arrowcolor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'ขึ้นทะเบียนผู้เข้า',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // ฟอร์มกรอกข้อมูล
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
          (value) => setState(() => companyName = value!), // อัปเดตค่าเมื่อเลือก
          size,
        ),
        _buildTextField('เลขที่ผู้เสียภาษี', (value) => taxNumber = value, size),
        SizedBox(
          height: size.height * 0.02,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
          child: Row(
            children: [
              Text(
                'ที่อยู่บริษัทฯ ​',
                style: TextStyle(fontSize: 13, color: headingtext, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        _buildDropdown('ที่อยู่บริษัทฯ', province, ['กรุงเทพมหานคร', 'เชียงใหม่', 'ขอนแก่น'], (value) => setState(() => province = value!), size),
        SizedBox(height: size.height * 0.01),
        _buildDropdown('อำเภอ', district, ['อำเภอเมือง', 'อำเภอหางดง'], (value) => setState(() => district = value!), size),
        SizedBox(height: size.height * 0.01),
        _buildDropdown('ตำบล', subDistrict, ['ตำบลสวนดอก', 'ตำบลท่าศาลา'], (value) => setState(() => subDistrict = value!), size),
        SizedBox(height: size.height * 0.01),
        _buildDropdown('รหัสไปรษณีย์', postalCode, ['50000', '50200'], (value) => setState(() => postalCode = value!), size),
        SizedBox(
          height: size.height * 0.02,
        ),
        _buildTextField('ชื่อผู้มีอำนาจลงนาม', (value) => userFirstName = value, size),
        SizedBox(height: size.height * 0.01),
        _buildTextField('นามสกุล ผู้ใช้งานจองนำเข้า', (value) => userLastName = value, size),
        SizedBox(height: size.height * 0.01),
        _buildTextField('เบอร์มือถือ', (value) => phoneNumber = value, size),
        SizedBox(height: size.height * 0.01),
        _buildTextField('อีเมล์', (value) => email = value, size),
        SizedBox(height: size.height * 0.01),
        // ส่วนอัพโหลดไฟล์ในรูปแบบ Row
        _buildFileUploadRow('ไฟล์ หนังสือรับรองทางบริษัท', 0, 'เอกสารต้องยังไม่หมดอายุ และเซ็นสำเนาถูกถูกต้อง', size),
        SizedBox(height: size.height * 0.01),
        _buildFileUploadRow('ไฟล์ สำเนาบัตรประชาชน', 1, 'กรุณาไม่ขีดคร่อมให้ท่านอัตโนมัติ', size),
        SizedBox(height: size.height * 0.01),
        _buildFileUploadRow('ไฟล์ ภพ.20', 2, '', size),
        SizedBox(height: size.height * 0.01),
        _buildFileUploadRow('ไฟล์ ตราประทับ', 3, '', size),
        SizedBox(height: size.height * 0.01),
        // ปุ่มชำระเงินใน container ด้านบน
        _buildPaymentContainer(size),
      ],
    );
  }

  // ส่วนแสดงข้อมูลยืนยัน
  Widget _buildSummaryView(Size size) {
    return Column(
      children: [
        Image.asset(
          'assets/images/logofull.png',
          width: size.width * 0.59,
        ),
        _buildSummaryField('ชื่อบริษัทฯ ห้างร้าน ห้างหุ้นส่วน', companyName, size),
        _buildSummaryField('เลขที่ผู้เสียภาษี', taxNumber, size),
        _buildSummaryField('ที่อยู่บริษัทฯ', province, size),
        _buildSummaryField('อำเภอ', district, size),
        _buildSummaryField('ตำบล', subDistrict, size),
        _buildSummaryField('รหัสไปรษณีย์', postalCode, size),
        _buildSummaryField('ชื่อ ผู้ใช้งานจองนำเข้า', userFirstName, size),
        _buildSummaryField('นามสกุล ผู้ใช้งานจองนำเข้า', userLastName, size),
        _buildSummaryField('เบอร์มือถือ', phoneNumber, size),
        _buildSummaryField('อีเมล์', email, size),
        // ปุ่มชำระเงินใน container ด้านบน
        _buildPaymentContainer(size),
      ],
    );
  }

  // Container สำหรับแสดงปุ่มชำระเงิน
  Widget _buildPaymentContainer(Size size) {
    return Container(
      padding: EdgeInsets.all(size.height * 0.02),
      width: size.width,
      decoration: BoxDecoration(
        color: isPaid ? white : white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // จัดให้ข้อความอยู่ชิดซ้าย
        children: [
          Text(
            isPaid ? 'ท่านได้ชำระค่าบริการในการขึ้นทะเบียนแล้ว' : 'ค่าใช้จ่ายในการขึ้นทะเบียน',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Color(0xff004aad), // สีข้อความเป็นสีน้ำเงิน
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ค่าขึ้นทะเบียนใหม่',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                '3,000 บาท',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.01),
          Container(
            height: size.height * 0.04,
            padding: EdgeInsets.all(size.height * 0.01),
            decoration: BoxDecoration(
              color: Colors.pink[100], // พื้นหลังสีชมพู
              borderRadius: BorderRadius.circular(8), // ขอบมน
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'รวมยอดชำระค่าบริการในการขึ้นทะเบียน',
                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '3,000 บาท',
                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // เพิ่มการแสดงผลวันที่และเวลาชำระเงินเมื่อ isPaid เป็น true
          if (isPaid) ...[
            SizedBox(height: size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'เวลาที่ชำระเงิน',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                Text(
                  '28 ก.ค. 2567   13:00', // ตัวอย่างวันที่และเวลา
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ชำระเงินผ่าน',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'QR พร้อมเพย์', // วิธีการชำระเงิน
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ] else ...[
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _pay();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: red1, // เปลี่ยนสีปุ่มเป็นสีแดง
                  minimumSize: Size(size.width * 0.9, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
              child: Text(
                'ชำระเงิน',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold, // ตัวหนา
                  color: Colors.white, // สีตัวอักษรเป็นสีขาว
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }

  // ฟังก์ชันชำระเงิน
  void _pay() {
    setState(() {
      isPaid = true; // เปลี่ยนสถานะเป็นจ่ายแล้ว
    });
  }

  // ฟังก์ชันสร้าง TextField ที่สามารถปรับขนาดตาม width ของหน้าจอ
  Widget _buildTextField(String label, Function(String) onChanged, Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.005),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.05,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: TextField(
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }

  // ฟังก์ชันสร้าง Dropdown ที่สามารถปรับขนาดตาม width ของหน้าจอ
  Widget _buildDropdown(String hintText, String currentValue, List<String> options, Function(String?) onChanged, Size size) {
    return SizedBox(
      width: size.width * 0.9,
      height: size.height * 0.07,
      child: InputDecorator(
        decoration: InputDecoration(
          hintText: hintText, // เปลี่ยนเป็น hintText
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
                // แสดง hint ที่เป็นค่า default ของ Dropdown เอง
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
  Widget _buildFileUploadRow(String label, int index, String? hintText, Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              if (hintText != null && hintText.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.005),
                  child: Text(
                    hintText,
                    style: TextStyle(fontSize: 12, color: red1, fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                uploadedFiles[index] = 'ไฟล์ที่อัพโหลด'; // ตัวอย่างการอัพโหลดไฟล์
              });
            },
            child: Container(
              height: size.height * 0.053,
              width: size.width * 0.25,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey, width: size.width * 0.001)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'อัพโหลดไฟล์',
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
