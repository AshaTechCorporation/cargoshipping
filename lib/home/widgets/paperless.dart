import 'dart:convert';

import 'package:cargoshipping/cart/widget/customcheck.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/widgets/paperlessfiles.dart';
import 'package:cargoshipping/models/provice.dart';
import 'package:cargoshipping/widgets/Form.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Paperless extends StatefulWidget {
  const Paperless({super.key});

  @override
  _PaperlessState createState() => _PaperlessState();
}

class _PaperlessState extends State<Paperless> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController companyName = TextEditingController();
  TextEditingController companyAddress = TextEditingController();
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
  // ตัวแปรเก็บข้อมูลจากผู้ใช้
  // String companyName = '';
  // String companyAddress = '';
  // String taxNumber = '';
  // String province = '';
  // String district = '';
  // String subDistrict = '';
  // String postalCode = '';
  // String userFirstName = '';
  // String userLastName = '';
  // String phoneNumber = '';
  // String email = '';
  List<String> uploadedFiles = ['', '', '', ''];

  bool isSubmitted = false;
  bool isPaid = false;

  bool isChecked1 = false;
  bool isChecked2 = false;
  bool checkPaperless = false;

  @override
  void initState() {
    super.initState();
    // กำหนดค่า PageController ทันทีใน initState ก่อนใช้งาน
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _loadDataOffice();
    });
  }

  void _onChanged(int index) {
    setState(() {
      if (index == 1) {
        isChecked1 = !isChecked1;
        if (isChecked1) isChecked2 = false;
        checkPaperless = true;
      } else {
        isChecked2 = !isChecked2;
        if (isChecked2) isChecked1 = false;
        checkPaperless = false;
      }
      print(checkPaperless);
    });
  }

  List<Provice> provicesOffice = [];
  Provice? selectedProvicesOffice;

  Future<List<Provice>> loadProvicesOffice() async {
    String jsonString = await rootBundle.loadString('assets/provice/provinces.json');
    List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => Provice.fromJson(json)).toList();
  }

  Future<void> _loadDataOffice() async {
    List<Provice> locations = await loadProvicesOffice();
    setState(() {
      provicesOffice = locations;
      // selectedProvices = provices.isNotEmpty ? provices.first : null;
    });
  }

  List<Provice> districtsOffice = [];
  Provice? selecteddistrictOffice;
  Future<List<Provice>> loadDistrictsOffice() async {
    String jsonString = await rootBundle.loadString('assets/provice/districts.json');
    List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => Provice.fromJson(json)).toList();
  }

  Future<List<Provice>> getProvicesByProvinceOffice(int provinceCode) async {
    List<Provice> allDistricts = await loadDistrictsOffice();
    return allDistricts.where((district) => district.provinceCode == provinceCode).toList();
  }

  Future<void> _loadDistrictsOffice(int provinceCode) async {
    List<Provice> districts1 = await getProvicesByProvinceOffice(provinceCode);
    setState(() {
      districtsOffice = districts1;
    });
  }

  List<Provice> subdistrictsOffice = [];
  Provice? selectedSubdistrictsOffice;
  Future<List<Provice>> loadSubdistrictsOffice() async {
    String jsonString = await rootBundle.loadString('assets/provice/subdistricts.json');
    List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => Provice.fromJson(json)).toList();
  }

  Future<List<Provice>> getDistrictsOffice(int districtCode) async {
    List<Provice> allSubDistricts = await loadSubdistrictsOffice();
    return allSubDistricts.where((district) => district.districtCode == districtCode).toList();
  }

  Future<void> _loadSubdistrictsOffice(int districtCode) async {
    List<Provice> subdistricts1 = await getDistrictsOffice(districtCode);
    setState(() {
      subdistrictsOffice = subdistricts1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'ขึ้นทะเบียนผู้นำเข้า (Paperless)',
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
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _buildFormView(size),
              ],
            ),
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
                if (formKey.currentState!.validate()) {
                  if (selectedProvicesOffice != null && selecteddistrictOffice != null && selectedSubdistrictsOffice != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Paperlessfiles(
                          companyName: companyName.text,
                          taxNumber: taxNumber.text,
                          homeCode: homeCode.text,
                          postalCode: postalCode.text,
                          userFirstName: userFirstName.text,
                          phoneNumber: phoneNumber.text,
                          email: email.text,
                          selectedProvicesOffice: selectedProvicesOffice!,
                          selecteddistrictOffice: selecteddistrictOffice!,
                          selectedSubdistrictsOffice: selectedSubdistrictsOffice!,
                          checkPaperless: checkPaperless,
                        ),
                      ),
                    );
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('แจ้งเตือน'),
                              content: Text('กรุณากรอรกข้อมูลให้ครบ'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('ตกลง'),
                                )
                              ],
                            ));
                  }
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
                    'อัปโหลดไฟล์เอกสาร',
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
        // _buildDropdown(
        //   'ชื่อบริษัทฯ ห้างร้าน ห้างหุ้นส่วน', // ใช้ชื่อเป็น hintText
        //   companyName, // ค่าที่จะถูกเก็บเมื่อเลือก
        //   ['บริษัท A', 'บริษัท B', 'บริษัท C'], // รายการชื่อบริษัท
        //   (value) => setState(() => companyName = value!), // อัปเดตค่าเมื่อเลือก
        //   size,
        // ),
        _buildTextField('ชื่อบริษัทฯ ห้างร้าน ห้างหุ้นส่วน', companyName, size),

        _buildTextField('เลขที่ผู้เสียภาษี', taxNumber, size),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
          child: Row(
            children: [
              Text(
                'ลงทะเบียน Paperless แล้วหรือไม่ ​',
                style: TextStyle(fontSize: 13, color: headingtext, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  checkPaperless = true;
                });
              },
              child: Container(
                height: size.height * 0.045,
                width: size.width * 0.45,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey, width: size.width * 0.001)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomCheckbox(
                      value: checkPaperless == true,
                      onChanged: (bool? value) {
                        setState(() {
                          checkPaperless = true;
                        });
                      },
                    ),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Text(
                      'ลงทะเบียนแล้ว',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: size.width * 0.02),
            GestureDetector(
              onTap: () {
                setState(() {
                  checkPaperless = false;
                });
              },
              child: Container(
                height: size.height * 0.045,
                width: size.width * 0.45,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey, width: size.width * 0.001)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomCheckbox(
                      value: checkPaperless == false,
                      onChanged: (bool? value) {
                        setState(() {
                          checkPaperless = false;
                        });
                      },
                    ),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Text(
                      'ยังไม่ได้ลงทะเบียน',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        // Center(
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       // Container ตัวที่ 1
        //       GestureDetector(
        //         onTap: () => _onChanged(1),
        //         child: Container(
        //           height: size.height * 0.045,
        //           width: size.width * 0.39,
        //           decoration: BoxDecoration(
        //             color: Colors.white,
        //             borderRadius: BorderRadius.circular(10),
        //             border: Border.all(
        //               color: isChecked1 ? Colors.red : Colors.grey,
        //               width: 0.5,
        //             ),
        //           ),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Padding(
        //                 padding: EdgeInsets.all(size.width * 0.01),
        //                 child: Container(
        //                   width: size.width * 0.055,
        //                   height: size.height * 0.025,
        //                   decoration: BoxDecoration(
        //                     color: isChecked1 ? Colors.transparent : greymess,
        //                     borderRadius: BorderRadius.circular(6.0),
        //                   ),
        //                   child: isChecked1
        //                       ? Icon(
        //                           Icons.check,
        //                           size: size.height * 0.025,
        //                           color: red1,
        //                         )
        //                       : null,
        //                 ),
        //               ),
        //               Padding(
        //                 padding: EdgeInsets.all(size.width * 0.01),
        //                 child: Text(
        //                   'ลงทะเบียนแล้ว',
        //                   style: TextStyle(color: isChecked1 ? red1 : Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //       SizedBox(width: size.width * 0.06),
        //       // Container ตัวที่ 2
        //       GestureDetector(
        //         onTap: () => _onChanged(2),
        //         child: Container(
        //           height: size.height * 0.045,
        //           width: size.width * 0.39,
        //           decoration: BoxDecoration(
        //             color: Colors.white,
        //             borderRadius: BorderRadius.circular(10),
        //             border: Border.all(
        //               color: isChecked2 ? Colors.red : Colors.grey,
        //               width: 0.5,
        //             ),
        //           ),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Padding(
        //                 padding: EdgeInsets.all(size.width * 0.01),
        //                 child: Container(
        //                   width: size.width * 0.055,
        //                   height: size.height * 0.025,
        //                   decoration: BoxDecoration(
        //                     color: isChecked2 ? Colors.transparent : greymess,
        //                     borderRadius: BorderRadius.circular(6.0),
        //                   ),
        //                   child: isChecked2
        //                       ? Icon(
        //                           Icons.check,
        //                           size: size.height * 0.025,
        //                           color: red1,
        //                         )
        //                       : null,
        //                 ),
        //               ),
        //               Padding(
        //                 padding: EdgeInsets.all(size.width * 0.01),
        //                 child: Text(
        //                   'ยังไม่ได้ลงทะเบียน',
        //                   style: TextStyle(color: isChecked2 ? red1 : Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),

        SizedBox(
          height: size.height * 0.02,
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
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: size.height * 0.075,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          padding: EdgeInsets.all(8),
          child: DropdownSearch<Provice>(
            selectedItem: selectedProvicesOffice,
            // items: listProvinec,
            items: provicesOffice,
            itemAsString: (item) => item.nameEn ?? '',
            popupProps: PopupProps.menu(
              constraints: BoxConstraints(maxHeight: 450),
              fit: FlexFit.loose,
              itemBuilder: (context, item, isSelected) => Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.nameEn ?? '',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            dropdownDecoratorProps: DropDownDecoratorProps(
              baseStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                fontFamily: 'Prompt',
              ),
              dropdownSearchDecoration: InputDecoration(
                hintText: 'จังหวัด',
                hintStyle: TextStyle(
                  color: Colors.black45,
                  fontFamily: 'Prompt',
                ),
                border: InputBorder.none,
                suffixIconColor: Colors.grey,
              ),
            ),
            onChanged: (value) {
              setState(() {
                selectedProvicesOffice = value;
                if (value != null) {
                  // getDistrits(id: value.id!);
                  _loadDistrictsOffice(value.provinceCode!);
                  selecteddistrictOffice = null;
                  selectedSubdistrictsOffice = null;
                }
              });
            },
          ),
        ),
        SizedBox(height: size.height * 0.01),
        selectedProvicesOffice == null
            ? SizedBox.shrink()
            : Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: size.height * 0.075,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    padding: EdgeInsets.all(8),
                    child: DropdownSearch<Provice>(
                      selectedItem: selecteddistrictOffice,
                      items: districtsOffice,
                      itemAsString: (item) => item.nameEn ?? '',
                      popupProps: PopupProps.menu(
                        constraints: BoxConstraints(maxHeight: 450),
                        fit: FlexFit.loose,
                        itemBuilder: (context, item, isSelected) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.nameEn ?? '',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        baseStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          fontFamily: 'Prompt',
                        ),
                        dropdownSearchDecoration: InputDecoration(
                          hintText: 'อำเภอ',
                          hintStyle: TextStyle(
                            color: Colors.black45,
                            fontFamily: 'Prompt',
                          ),
                          border: InputBorder.none,
                          suffixIconColor: Colors.grey,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          selecteddistrictOffice = value;
                          if (value != null) {
                            _loadSubdistrictsOffice(value.districtCode!);
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                ],
              ),
        selecteddistrictOffice == null
            ? SizedBox.shrink()
            : Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: size.height * 0.075,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    padding: EdgeInsets.all(8),
                    child: DropdownSearch<Provice>(
                      selectedItem: selectedSubdistrictsOffice,
                      items: subdistrictsOffice,
                      itemAsString: (item) => item.nameEn ?? '',
                      popupProps: PopupProps.menu(
                        constraints: BoxConstraints(maxHeight: 450),
                        fit: FlexFit.loose,
                        itemBuilder: (context, item, isSelected) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.nameEn ?? '',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        baseStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          fontFamily: 'Prompt',
                        ),
                        dropdownSearchDecoration: InputDecoration(
                          hintText: 'ตำบล',
                          hintStyle: TextStyle(
                            color: Colors.black45,
                            fontFamily: 'Prompt',
                          ),
                          border: InputBorder.none,
                          suffixIconColor: Colors.grey,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          selectedSubdistrictsOffice = value;
                          // if (value != null) {
                          //   // getDistrits(id: value.id!);
                          //   _loadDistricts(value.provinceCode!);
                          // }
                        });
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                ],
              ),
        _buildTextField('รหัสไปรษณีย์', postalCode, size),
        // _buildDropdown('ที่อยู่บริษัทฯ', province, ['กรุงเทพมหานคร', 'เชียงใหม่', 'ขอนแก่น'], (value) => setState(() => province = value!), size),
        // SizedBox(height: size.height * 0.01),
        // _buildDropdown('อำเภอ', district, ['อำเภอเมือง', 'อำเภอหางดง'], (value) => setState(() => district = value!), size),
        // SizedBox(height: size.height * 0.01),
        // _buildDropdown('ตำบล', subDistrict, ['ตำบลสวนดอก', 'ตำบลท่าศาลา'], (value) => setState(() => subDistrict = value!), size),
        // SizedBox(height: size.height * 0.01),
        // _buildDropdown('รหัสไปรษณีย์', postalCode, ['50000', '50200'], (value) => setState(() => postalCode = value!), size),

        _buildTextField('ชื่อผู้มีอำนาจลงนาม', userFirstName, size),
        // SizedBox(height: size.height * 0.01),
        // _buildTextField('นามสกุล ผู้ใช้งานจองนำเข้า', userLastName, size),
        // SizedBox(height: size.height * 0.01),
        _buildTextField('เบอร์มือถือ', phoneNumber, size),
        // SizedBox(height: size.height * 0.01),
        _buildTextField('อีเมล์', email, size),
        // SizedBox(height: size.height * 0.01),
        Text(
          '** ข้อมูลของท่านจะได้รับการตรวจสอบภายใน 1-2 วันทำการ เพื่ออนุมัติ สถานะพร้อมนำเข้า',
          style: TextStyle(fontSize: 12, color: red1, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  // ฟังก์ชันสร้าง TextField ที่สามารถปรับขนาดตาม width ของหน้าจอ
  Widget _buildTextField(String label, TextEditingController textController, Size size) {
    return FromRegister(
      width: size.width * 0.9,
      controller: textController,
      hintText: label,
      validator: (value) {
        if (value!.isEmpty) return 'กรุณากรอกรายละเอียด';
        return null;
      },
    );
    // return Container(
    //   width: size.width * 0.9,
    //   height: size.height * 0.045,
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.circular(10),
    //   ),
    //   child: TextField(
    //     decoration: InputDecoration(
    //       labelText: label,
    //       labelStyle: TextStyle(fontSize: 13),
    //       // ขอบสีเทาบางลงเมื่อไม่ได้โฟกัส
    //       enabledBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(10),
    //         borderSide: BorderSide(color: Colors.grey, width: 1), // กำหนดสีขอบและความบาง
    //       ),
    //       // ขอบสีเทาบางลงเมื่อโฟกัส
    //       focusedBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(10),
    //         borderSide: BorderSide(color: Colors.grey, width: 1), // กำหนดสีขอบและความบาง
    //       ),
    //       contentPadding: EdgeInsets.symmetric(horizontal: 10), // เพิ่ม padding ถ้าต้องการ
    //     ),
    //     onChanged: onChanged,
    //   ),
    // );
  }

  // ฟังก์ชันสร้าง Dropdown ที่สามารถปรับขนาดตาม width ของหน้าจอ
  Widget _buildDropdown(String hintText, String currentValue, List<String> options, Function(String?) onChanged, Size size) {
    return SizedBox(
      width: size.width * 0.9,
      height: size.height * 0.045,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // White background
          border: Border.all(color: Colors.grey, width: 1), // Border color and width
          borderRadius: BorderRadius.circular(10), // Rounded corners
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
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
                child: Text(value, style: TextStyle(fontSize: 15)),
              );
            }).toList(),
            onChanged: onChanged,
            icon: Icon(
              Icons.keyboard_arrow_down,
              size: 20, // ปรับขนาดของไอคอน
              color: Colors.grey, // ปรับสีของไอคอน
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
