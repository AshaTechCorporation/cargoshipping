import 'dart:io';

import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/firstPage.dart';
import 'package:cargoshipping/models/provice.dart';
import 'package:cargoshipping/widgets/Form.dart';
import 'package:cargoshipping/widgets/viewPDF.dart';
import 'package:cargoshipping/widgets/viewPhoto.dart';
import 'package:flutter/material.dart';

class PaperlessConfirm extends StatefulWidget {
  const PaperlessConfirm({
    super.key,
    required this.companyName,
    required this.taxNumber,
    required this.homeCode,
    required this.postalCode,
    required this.userFirstName,
    required this.phoneNumber,
    required this.email,
    required this.selectedProvicesOffice,
    required this.selecteddistrictOffice,
    required this.selectedSubdistrictsOffice,
    required this.checkPaperless,
    required this.fileIDcard,
    required this.fileCompany,
    required this.fileCompany20,
    required this.fileCompanyPhoto,
    required this.extensionIDcard,
    required this.extensionfileCompany,
    required this.extensionfileCompany20,
    required this.extensionfileCompanyPhoto,
  });
  final String companyName,
      taxNumber,
      homeCode,
      postalCode,
      userFirstName,
      phoneNumber,
      email,
      extensionIDcard,
      extensionfileCompany,
      extensionfileCompany20,
      extensionfileCompanyPhoto;
  final Provice selectedProvicesOffice, selecteddistrictOffice, selectedSubdistrictsOffice;
  final bool checkPaperless;
  final File fileIDcard, fileCompany, fileCompany20, fileCompanyPhoto;

  @override
  State<PaperlessConfirm> createState() => _PaperlessConfirmState();
}

class _PaperlessConfirmState extends State<PaperlessConfirm> {
  TextEditingController companyName = TextEditingController();
  TextEditingController taxNumber = TextEditingController();
  TextEditingController province = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController subDistrict = TextEditingController();
  TextEditingController postalCode = TextEditingController();
  TextEditingController homeCode = TextEditingController();
  TextEditingController userFirstName = TextEditingController();
  TextEditingController userLastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  void initState() {
    super.initState();
    companyName.text = widget.companyName;
    homeCode.text = widget.homeCode;
    taxNumber.text = widget.taxNumber;
    province.text = widget.selectedProvicesOffice.nameEn!;
    district.text = widget.selecteddistrictOffice.nameEn!;
    subDistrict.text = widget.selectedSubdistrictsOffice.nameEn!;
    postalCode.text = widget.postalCode;
    userFirstName.text = widget.userFirstName;
    phoneNumber.text = widget.phoneNumber;
    email.text = widget.email;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'ข้อมูลขึ้นทะเบียนผู้นำเข้า (Paperless)',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildFormView(size),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => FirstPage()), (route) => false);
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
                    'กลับสู่หน้าแรก',
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
        _buildTextField('ชื่อบริษัทฯ ห้างร้าน ห้างหุ้นส่วน', companyName, size),
        _buildTextField('เลขที่ผู้เสียภาษี', taxNumber, size),
        SizedBox(
          height: size.height * 0.01,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
          child: Row(
            children: [
              Text(
                'ที่อยู่บริษัทฯ ​',
                style: TextStyle(fontSize: 13, color: headingtext, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        _buildTextField('ที่อยู่', homeCode, size),
        _buildTextField('จังหวัด', province, size),
        _buildTextField('อำเภอ', district, size),
        _buildTextField('ตำบล', subDistrict, size),
        _buildTextField('รหัสไปรษณีย์', postalCode, size),
        _buildTextField('ชื่อผู้มีอำนาจลงนาม', userFirstName, size),
        _buildTextField('เบอร์มือถือ', phoneNumber, size),
        _buildTextField('อีเมล์', email, size),
        widget.fileIDcard == null
            ? SizedBox.shrink()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ไฟล์ สำเนาบัตรประชาชน'),
                  GestureDetector(
                    onTap: () {
                      if (widget.extensionIDcard == 'pdf') {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return ViewPDF(
                            pathPDF: widget.fileIDcard,
                          );
                        }));
                      } else {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return ImagePhotoview(
                            image1: widget.fileIDcard,
                          );
                        }));
                      }
                    },
                    child: Container(
                      width: size.width * 0.4,
                      height: size.height * 0.07,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 207, 207, 207),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(child: Text('คลิกเพื่อดูไฟล์')),
                    ),
                  )
                ],
              ),
        SizedBox(
          height: 10,
        ),
        widget.fileCompany == null
            ? SizedBox.shrink()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ไฟล์ หนังสือรับรองบริษัท'),
                  GestureDetector(
                    onTap: () {
                      if (widget.extensionfileCompany == 'pdf') {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return ViewPDF(
                            pathPDF: widget.fileCompany,
                          );
                        }));
                      } else {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return ImagePhotoview(
                            image1: widget.fileCompany,
                          );
                        }));
                      }
                    },
                    child: Container(
                      width: size.width * 0.4,
                      height: size.height * 0.07,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 207, 207, 207),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(child: Text('คลิกเพื่อดูไฟล์')),
                    ),
                  )
                ],
              ),
        SizedBox(
          height: 10,
        ),
        widget.fileCompany20 == null
            ? SizedBox.shrink()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ไฟล์ ภพ.20'),
                  GestureDetector(
                    onTap: () {
                      if (widget.extensionfileCompany20 == 'pdf') {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return ViewPDF(
                            pathPDF: widget.fileCompany20,
                          );
                        }));
                      } else {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return ImagePhotoview(
                            image1: widget.fileCompany20,
                          );
                        }));
                      }
                    },
                    child: Container(
                      width: size.width * 0.4,
                      height: size.height * 0.07,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 207, 207, 207),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(child: Text('คลิกเพื่อดูไฟล์')),
                    ),
                  )
                ],
              ),
        SizedBox(
          height: 10,
        ),
        widget.fileCompanyPhoto == null
            ? SizedBox.shrink()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ไฟล์ ตราประทับ'),
                  GestureDetector(
                    onTap: () {
                      if (widget.extensionfileCompanyPhoto == 'pdf') {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return ViewPDF(
                            pathPDF: widget.fileCompanyPhoto,
                          );
                        }));
                      } else {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return ImagePhotoview(
                            image1: widget.fileCompanyPhoto,
                          );
                        }));
                      }
                    },
                    child: Container(
                      width: size.width * 0.4,
                      height: size.height * 0.07,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 207, 207, 207),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(child: Text('คลิกเพื่อดูไฟล์')),
                    ),
                  )
                ],
              ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Text(
          'ระบบกำลังตรวจสอบข้อมูลของท่าน',
          style: TextStyle(fontSize: 15, color: red1, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget _buildTextField(String label, TextEditingController textController, Size size) {
    return FromRegister(
      width: size.width * 0.9,
      controller: textController,
      hintText: label,
      readOnly: true,
      validator: (value) {
        if (value!.isEmpty) return 'กรุณากรอกรายละเอียด';
        return null;
      },
    );
  }
}
