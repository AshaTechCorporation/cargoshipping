import 'dart:io';

import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/widgets/paymentChannel.dart';
import 'package:cargoshipping/models/provice.dart';
import 'package:cargoshipping/register/server/registerService.dart';
import 'package:cargoshipping/widgets/LoadingDialog.dart';
import 'package:cargoshipping/widgets/viewPDF.dart';
import 'package:cargoshipping/widgets/viewPhoto.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Paperlessfiles extends StatefulWidget {
  const Paperlessfiles({
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
  });
  final String companyName, taxNumber, homeCode, postalCode, userFirstName, phoneNumber, email;
  final Provice selectedProvicesOffice, selecteddistrictOffice, selectedSubdistrictsOffice;
  final bool checkPaperless;

  @override
  State<Paperlessfiles> createState() => _PaperlessfilesState();
}

class _PaperlessfilesState extends State<Paperlessfiles> {
  File? fileIDcard;
  File? fileCompany;
  File? fileCompany20;
  File? fileCompanyPhoto;
  PlatformFile? platformFileIDcard;
  PlatformFile? platformFileCompany;
  PlatformFile? platformFileCompany20;
  PlatformFile? platformFileCompanyPhoto;
  String? extensionIDcard;
  String? extensionfileCompany;
  String? extensionfileCompany20;
  String? extensionfileCompanyPhoto;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'ขึ้นทะเบียนผู้นำเข้า(Paperless)',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
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
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'อัปโหลดรูปภาพบัตรประชาชนผู้มีอำนาจ / ผู้รับมอบอำนาจ',
                  style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'รองรับไฟล์รูปถ่าย JPG, PNG, PDF เท่านั้น',
                  style: TextStyle(fontSize: 13, color: headingtext, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.005,
            ),
            Container(
              height: size.height * 0.25,
              width: size.width * 0.95,
              decoration: BoxDecoration(color: Colors.white),
              child: fileIDcard == null
                  ? GestureDetector(
                      onTap: () async {
                        final result = await FilePicker.platform.pickFiles(
                          type: FileType.any,
                          // type: FileType.custom, // ใช้ประเภท custom
                          // allowedExtensions: ['jpg', 'png', 'pdf'], // ระบุเฉพาะไฟล์ jpg และ png
                        );
                        setState(() {
                          if (result == null) return;

                          platformFileIDcard = result.files[0];
                          final file = platformFileIDcard;
                          fileIDcard = File(file!.path!);
                          extensionIDcard = file.extension ?? 'none';
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/idcard.png',
                            height: size.height * 0.17,
                            width: size.width * 0.6,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: size.height * 0.03,
                            width: size.width * 0.3,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                'อัพโหลด',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (extensionIDcard == 'pdf') {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return ViewPDF(
                                    pathPDF: fileIDcard!,
                                  );
                                }));
                              } else {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return ImagePhotoview(
                                    image1: fileIDcard!,
                                  );
                                }));
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: size.width * 0.5,
                              height: size.height * 0.15,
                              decoration: BoxDecoration(color: red1, borderRadius: BorderRadius.circular(12)),
                              child: Text(
                                '.$extensionIDcard',
                                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                          ),
                          Positioned(
                            top: -8,
                            right: -8,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  fileIDcard = null;
                                });
                              },
                              child: Icon(
                                Icons.remove_circle,
                                color: Colors.grey,
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'กรุณาไม่ขีดคร่อม ระบบจะเขียนคร่อมให้ท่านอัตโนมัติ',
                  style: TextStyle(fontSize: 13, color: red1, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'อัปโหลดหนังสือรับรองบริษัท',
                  style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'รองรับไฟล์รูปถ่าย JPG, PNG, PDF เท่านั้น',
                  style: TextStyle(fontSize: 13, color: headingtext, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.005,
            ),
            Container(
              height: size.height * 0.25,
              width: size.width * 0.95,
              decoration: BoxDecoration(color: white),
              child: fileCompany == null
                  ? GestureDetector(
                      onTap: () async {
                        final result = await FilePicker.platform.pickFiles(
                          type: FileType.any,
                        );
                        setState(() {
                          if (result == null) return;

                          platformFileCompany = result.files[0];
                          final file = platformFileCompany;
                          fileCompany = File(file!.path!);
                          extensionfileCompany = file.extension ?? 'none';
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/certificate.png',
                            height: size.height * 0.17,
                            width: size.width * 0.6,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: size.height * 0.03,
                            width: size.width * 0.3,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                'อัพโหลด',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (extensionfileCompany == 'pdf') {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return ViewPDF(
                                    pathPDF: fileCompany!,
                                  );
                                }));
                              } else {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return ImagePhotoview(
                                    image1: fileCompany!,
                                  );
                                }));
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: size.width * 0.5,
                              height: size.height * 0.15,
                              decoration: BoxDecoration(color: red1, borderRadius: BorderRadius.circular(12)),
                              child: Text(
                                '.$extensionfileCompany',
                                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                          ),
                          Positioned(
                            top: -8,
                            right: -8,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  fileCompany = null;
                                });
                              },
                              child: Icon(
                                Icons.remove_circle,
                                color: Colors.grey,
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'เอกสารต้องยังไม่หมดอายุ และเซ็นต์สำเนาถูกต้อง ',
                  style: TextStyle(fontSize: 13, color: red1, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'อัปโหลดภพ.20',
                  style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'รองรับไฟล์รูปถ่าย JPG, PNG, PDF เท่านั้น',
                  style: TextStyle(fontSize: 13, color: headingtext, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.005,
            ),
            Container(
              height: size.height * 0.25,
              width: size.width * 0.95,
              decoration: BoxDecoration(color: white),
              child: fileCompany20 == null
                  ? GestureDetector(
                      onTap: () async {
                        final result = await FilePicker.platform.pickFiles(
                          type: FileType.any,
                        );
                        setState(() {
                          if (result == null) return;

                          platformFileCompany20 = result.files[0];
                          final file = platformFileCompany20;
                          fileCompany20 = File(file!.path!);
                          extensionfileCompany20 = file.extension ?? 'none';
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/card20.png',
                            height: size.height * 0.17,
                            width: size.width * 0.6,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: size.height * 0.03,
                            width: size.width * 0.3,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                'อัพโหลด',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (extensionfileCompany20 == 'pdf') {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return ViewPDF(
                                    pathPDF: fileCompany20!,
                                  );
                                }));
                              } else {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return ImagePhotoview(
                                    image1: fileCompany20!,
                                  );
                                }));
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: size.width * 0.5,
                              height: size.height * 0.15,
                              decoration: BoxDecoration(color: red1, borderRadius: BorderRadius.circular(12)),
                              child: Text(
                                '.$extensionfileCompany20',
                                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                          ),
                          Positioned(
                            top: -8,
                            right: -8,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  fileCompany20 = null;
                                });
                              },
                              child: Icon(
                                Icons.remove_circle,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'อัปโหลดตราประทับ',
                  style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'รองรับไฟล์รูปถ่าย JPG, PNG, PDF เท่านั้น',
                  style: TextStyle(fontSize: 13, color: headingtext, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.005,
            ),
            Container(
              height: size.height * 0.25,
              width: size.width * 0.95,
              decoration: BoxDecoration(color: white),
              child: fileCompanyPhoto == null
                  ? GestureDetector(
                      onTap: () async {
                        final result = await FilePicker.platform.pickFiles(
                          type: FileType.any,
                        );
                        setState(() {
                          if (result == null) return;

                          platformFileCompanyPhoto = result.files[0];
                          final file = platformFileCompanyPhoto;
                          fileCompanyPhoto = File(file!.path!);
                          extensionfileCompanyPhoto = file.extension ?? 'none';
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/upseal.png',
                            height: size.height * 0.17,
                            width: size.width * 0.6,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: size.height * 0.03,
                            width: size.width * 0.3,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                'อัพโหลด',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (extensionfileCompanyPhoto == 'pdf') {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return ViewPDF(
                                    pathPDF: fileCompanyPhoto!,
                                  );
                                }));
                              } else {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return ImagePhotoview(
                                    image1: fileCompanyPhoto!,
                                  );
                                }));
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: size.width * 0.5,
                              height: size.height * 0.15,
                              decoration: BoxDecoration(color: red1, borderRadius: BorderRadius.circular(12)),
                              child: Text(
                                '.$extensionfileCompanyPhoto',
                                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                          ),
                          Positioned(
                            top: -8,
                            right: -8,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  fileCompanyPhoto = null;
                                });
                              },
                              child: Icon(
                                Icons.remove_circle,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
            Container(
              padding: EdgeInsets.all(size.height * 0.02),
              width: size.width,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // จัดให้ข้อความอยู่ชิดซ้าย
                children: [
                  Text(
                    'ค่าใช้จ่ายในการขึ้นทะเบียน',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xff004aad), // สีข้อความเป็นสีน้ำเงิน
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    child: Row(
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
                  ),
                  SizedBox(height: size.height * 0.01),
                  Container(
                    height: size.height * 0.04,
                    padding: EdgeInsets.all(size.height * 0.01),
                    decoration: BoxDecoration(
                      color: Colors.pink[100],
                      borderRadius: BorderRadius.circular(8),
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
                          style: TextStyle(color: red1, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentChannel()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: red1, minimumSize: Size(size.width * 0.9, 50), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      'ชำระเงิน',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                String? sendfileIDcard;
                String? sendfileCompany;
                String? sendfileCompany20;
                String? sendfileCompanyPhoto;
                LoadingDialog.open(context);
                try {
                  if (extensionIDcard == 'pdf') {
                    if (fileIDcard != null) {
                      sendfileIDcard = await RegisterService.addFile(file: fileIDcard, path: 'images/asset/');
                    }
                  } else {
                    if (fileIDcard != null) {
                      sendfileIDcard = await RegisterService.addImage(file: fileIDcard, path: 'images/asset/');
                    }
                  }
                  if (extensionfileCompany == 'pdf') {
                    if (fileCompany != null) {
                      sendfileCompany = await RegisterService.addFile(file: fileCompany, path: 'images/asset/');
                    }
                  } else {
                    if (fileCompany != null) {
                      sendfileCompany = await RegisterService.addImage(file: fileCompany, path: 'images/asset/');
                    }
                  }
                  if (extensionfileCompany20 == 'pdf') {
                    if (fileCompany20 != null) {
                      sendfileCompany20 = await RegisterService.addFile(file: fileCompany20, path: 'images/asset/');
                    }
                  } else {
                    if (fileCompany20 != null) {
                      sendfileCompany20 = await RegisterService.addImage(file: fileCompany20, path: 'images/asset/');
                    }
                  }
                  if (extensionfileCompany == 'pdf') {
                    if (fileCompany != null) {
                      sendfileCompany = await RegisterService.addFile(file: fileCompany, path: 'images/asset/');
                    }
                  } else {
                    if (fileCompany != null) {
                      sendfileCompany = await RegisterService.addImage(file: fileCompany, path: 'images/asset/');
                    }
                  }
                  await RegisterService.registerImporter(
                    comp_name: widget.companyName,
                    comp_tax: widget.taxNumber,
                    registered: widget.checkPaperless,
                    address: widget.homeCode,
                    province: widget.selecteddistrictOffice.nameEn,
                    district: widget.selectedProvicesOffice.nameEn,
                    sub_district: widget.selectedSubdistrictsOffice.nameEn,
                    postal_code: widget.postalCode,
                    authorized_person: widget.userFirstName,
                    authorized_person_phone: widget.phoneNumber,
                    authorized_person_email: widget.email,
                    id_card_picture: sendfileIDcard,
                    certificate_book_file: sendfileCompany,
                    tax_book_file: sendfileCompany20,
                    logo_file: sendfileCompanyPhoto,
                  );
                  LoadingDialog.close(context);
                } on ClientException catch (e) {
                  if (!mounted) return;
                  LoadingDialog.close(context);
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text('แจ้งเตือน'),
                            content: Text(e.toString()),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('ตกลง'),
                              )
                            ],
                          ));
                  print(e);
                } on Exception catch (e) {
                  if (!mounted) return;
                  LoadingDialog.close(context);
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text('แจ้งเตือน'),
                            content: Text(e.toString()),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('ตกลง'),
                              )
                            ],
                          ));
                  print(e);
                }
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
          ],
        ),
      ),
    );
  }
}
