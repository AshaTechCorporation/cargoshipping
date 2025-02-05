import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:cargoshipping/cart/widget/customcheck.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/models/provice.dart';
import 'package:cargoshipping/models/rateShip.dart';
import 'package:cargoshipping/models/serviceTransporterById.dart';
import 'package:cargoshipping/register/server/registerService.dart';
import 'package:cargoshipping/widgets/Form.dart';
import 'package:cargoshipping/widgets/LoadingDialog.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

class registerpage extends StatefulWidget {
  const registerpage({super.key, required this.type});
  final String type;

  @override
  State<registerpage> createState() => _registerpageState();
}

class _registerpageState extends State<registerpage> {
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _reccomController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _importercodeController = TextEditingController();
  final TextEditingController _birthController = TextEditingController();
  String dateSentApi = '';
  final TextEditingController homeCode = TextEditingController();
  final TextEditingController zipcode = TextEditingController();

  RateShip? selectedtotalsend;

  RateShip? selectedsendoften;

  RateShip? selectedimporttype;

  RateShip? selecteduserwant;

// checkbox
  String? _selectedGender;

  String? _selecteduseto;

  bool _agreement = false;

  // final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    // กำหนดค่า PageController ทันทีใน initState ก่อนใช้งาน
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getLocation();
      await getProducts();
      await _loadData();
      await _loadDataOffice();
    });
  }

  double? lat;
  double? long;

  getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      lat = position.latitude;
      long = position.longitude;
    });
  }

  List<RateShip>? total = [];
  List<RateShip>? often = [];
  List<RateShip>? import = [];
  List<RateShip>? want = [];
  List<ServiceTransporterById>? transports = [];
  ServiceTransporterById? selectedTransports;

  Future<void> getProducts() async {
    try {
      LoadingDialog.open(context);
      final total1 = await RegisterService.getDataRegister(type: 'Total');
      final often1 = await RegisterService.getDataRegister(type: 'Often');
      final import1 = await RegisterService.getDataRegister(type: 'Import');
      final want1 = await RegisterService.getDataRegister(type: 'Want');
      final transports1 = await RegisterService.getTransport();
      setState(() {
        total = total1;
        often = often1;
        import = import1;
        want = want1;
        transports = transports1;
      });
      if (!mounted) return;
      LoadingDialog.close(context);
    } on Exception catch (e) {
      if (!mounted) return;
      LoadingDialog.close(context);
    }
  }

  List<Provice> provices = [];
  Provice? selectedProvices;

  Future<List<Provice>> loadProvices() async {
    String jsonString = await rootBundle.loadString('assets/provice/provinces.json');
    List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => Provice.fromJson(json)).toList();
  }

  Future<void> _loadData() async {
    List<Provice> locations = await loadProvices();
    setState(() {
      provices = locations;
      // selectedProvices = provices.isNotEmpty ? provices.first : null;
    });
  }

  List<Provice> districts = [];
  Provice? selecteddistrict;
  Future<List<Provice>> loadDistricts() async {
    String jsonString = await rootBundle.loadString('assets/provice/districts.json');
    List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => Provice.fromJson(json)).toList();
  }

  Future<List<Provice>> getProvicesByProvince(int provinceCode) async {
    List<Provice> allDistricts = await loadDistricts();
    return allDistricts.where((district) => district.provinceCode == provinceCode).toList();
  }

  Future<void> _loadDistricts(int provinceCode) async {
    List<Provice> districts1 = await getProvicesByProvince(provinceCode);
    setState(() {
      inspect(districts);
      districts = districts1;
    });
  }

  List<Provice> subdistricts = [];
  Provice? selectedSubdistricts;
  Future<List<Provice>> loadSubdistricts() async {
    String jsonString = await rootBundle.loadString('assets/provice/subdistricts.json');
    List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => Provice.fromJson(json)).toList();
  }

  Future<List<Provice>> getDistricts(int districtCode) async {
    List<Provice> allSubDistricts = await loadSubdistricts();
    return allSubDistricts.where((district) => district.districtCode == districtCode).toList();
  }

  Future<void> _loadSubdistricts(int districtCode) async {
    List<Provice> subdistricts1 = await getDistricts(districtCode);
    setState(() {
      inspect(subdistricts1);
      subdistricts = subdistricts1;
    });
  }

  ///////////////////////////////////////////////// นิติบุคคล
  final TextEditingController nameOffice = TextEditingController();
  final TextEditingController taxOffice = TextEditingController();
  final TextEditingController zipcodeOffice = TextEditingController();
  final TextEditingController phoneOffice = TextEditingController();
  final TextEditingController homeCodeOffice = TextEditingController();

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
      inspect(districts);
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
      inspect(subdistricts1);
      subdistrictsOffice = subdistricts1;
    });
  }

  ///////////////////////////////////////////////// ตัวแทน
  final TextEditingController nameAgent = TextEditingController();
  final TextEditingController webAgent = TextEditingController();
  final TextEditingController totalAgent = TextEditingController();
  File? _selectedFile;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'ลงทะเบียนผู้ใช้งาน${widget.type}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 1.0,
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
                FromRegister(
                  width: size.width * 0.9,
                  controller: _nameController,
                  hintText: 'ชื่อ',
                  validator: (value) {
                    if (value!.isEmpty) return 'กรุณากรอกรายละเอียด';
                    return null;
                  },
                ),
                FromRegister(
                  width: size.width * 0.9,
                  controller: _lastnameController,
                  hintText: 'นามสกุล',
                  validator: (value) {
                    if (value!.isEmpty) return 'กรุณากรอกรายละเอียด';
                    return null;
                  },
                ),
                FromRegister(
                  width: size.width * 0.9,
                  controller: _telController,
                  hintText: 'เบอร์มือถือ',
                  validator: (value) {
                    if (value!.isEmpty) return 'กรุณากรอกรายละเอียด';
                    return null;
                  },
                ),
                FromRegister(
                  width: size.width * 0.9,
                  controller: _birthController,
                  hintText: 'วันเกิด',
                  readOnly: true,
                  onTap: () {
                    _afterselectDate(context);
                  },
                  icons: Icon(Icons.calendar_month),
                  validator: (value) {
                    if (value!.isEmpty) return 'กรุณากรอกรายละเอียด';
                    return null;
                  },
                ),

                Row(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: size.width * 0.01),
                          child: Text(
                            'เพศ',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.4,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_selectedGender == 'male') {
                                _selectedGender = null;
                              } else {
                                _selectedGender = 'male';
                              }
                            });
                          },
                          child: Container(
                            height: size.height * 0.043,
                            width: size.width * 0.2,
                            decoration:
                                BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey, width: size.width * 0.001)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomCheckbox(
                                  value: _selectedGender == 'male',
                                  onChanged: (bool? value) {
                                    setState(() {
                                      if (value == true) {
                                        _selectedGender = 'male';
                                      } else {
                                        _selectedGender = null;
                                      }
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: size.width * 0.02,
                                ),
                                Text(
                                  'ชาย',
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: size.width * 0.02),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_selectedGender == 'female') {
                            _selectedGender = null;
                          } else {
                            _selectedGender = 'female';
                          }
                        });
                      },
                      child: Container(
                        height: size.height * 0.043,
                        width: size.width * 0.2,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey, width: size.width * 0.001)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomCheckbox(
                              value: _selectedGender == 'female',
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value == true) {
                                    _selectedGender = 'female';
                                  } else {
                                    _selectedGender = null;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Text(
                              'หญิง',
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                FromRegister(
                  width: size.width * 0.9,
                  controller: _importercodeController,
                  hintText: 'รหัสผู้นำเข้า',
                  validator: (value) {
                    if (value!.isEmpty) return 'กรุณากรอกรายละเอียด';
                    return null;
                  },
                ),
                FromRegister(
                  width: size.width * 0.9,
                  controller: _passwordController,
                  hintText: 'รหัสผ่าน',
                  isPassword: true,
                  validator: (value) {
                    if (value!.isEmpty || value == '') {
                      return 'กรุณากรอกรหัสผ่าน';
                    }
                    if (value.length < 8 || value.length > 20) {
                      return 'รหัสผ่านต้องมีความยาว 8 - 20 ตัวอักษร';
                    }
                    if (value != _confirmPasswordController.text) {
                      return 'รหัสผ่านไม่ตรงกัน';
                    }
                    return null;
                  },
                ),

                FromRegister(
                  width: size.width * 0.9,
                  controller: _confirmPasswordController,
                  hintText: 'ยืนยันรหัสผ่าน',
                  isPassword: true,
                  validator: (value) {
                    if (value!.isEmpty || value == '') {
                      return 'กรุณากรอกรหัสผ่าน';
                    }
                    if (value.length < 8 || value.length > 20) {
                      return 'รหัสผ่านต้องมีความยาว 8 - 20 ตัวอักษร';
                    }
                    if (value != _passwordController.text) {
                      return 'รหัสผ่านไม่ตรงกัน';
                    }
                    return null;
                  },
                ),

                FromRegister(
                  width: size.width * 0.9,
                  controller: _reccomController,
                  hintText: 'ผู้แนะนำ',
                  // validator: (value) {
                  //   if (value!.isEmpty) return 'กรุณากรอกรายละเอียด';
                  //   return null;
                  // },
                ),
                widget.type == 'บุคคลทั่วไป' || widget.type != 'นิติบุคคล' && widget.type != 'ตัวแทน'
                    ? SizedBox.shrink()
                    : Column(
                        children: [
                          FromRegister(
                            width: size.width * 0.9,
                            controller: nameOffice,
                            hintText: 'ชื่อบริษัทฯ ห้างร้าน ห้างหุ้นส่วน',
                            validator: (value) {
                              if (value!.isEmpty) return 'กรุณากรอกรายละเอียด';
                              return null;
                            },
                          ),
                          FromRegister(
                            width: size.width * 0.9,
                            controller: taxOffice,
                            hintText: 'เลขที่ผู้เสียภาษี',
                            validator: (value) {
                              if (value!.isEmpty) return 'กรุณากรอกรายละเอียด';
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ที่อยู่บริษัทฯ',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FromRegister(
                            width: size.width * 0.9,
                            controller: homeCodeOffice,
                            hintText: 'บ้านเลขที่',
                            validator: (value) {
                              if (value!.isEmpty) return 'กรุณากรอกรายละเอียด';
                              return null;
                            },
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
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
                              itemAsString: (item) => item.nameTH ?? '',
                              popupProps: PopupProps.menu(
                                constraints: BoxConstraints(maxHeight: 450),
                                fit: FlexFit.loose,
                                itemBuilder: (context, item, isSelected) => Container(
                                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.nameTH ?? '',
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
                                        itemAsString: (item) => item.nameTH ?? '',
                                        popupProps: PopupProps.menu(
                                          constraints: BoxConstraints(maxHeight: 450),
                                          fit: FlexFit.loose,
                                          itemBuilder: (context, item, isSelected) => Container(
                                            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  item.nameTH ?? '',
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
                                        itemAsString: (item) => item.nameTH ?? '',
                                        popupProps: PopupProps.menu(
                                          constraints: BoxConstraints(maxHeight: 450),
                                          fit: FlexFit.loose,
                                          itemBuilder: (context, item, isSelected) => Container(
                                            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  item.nameTH ?? '',
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
                          FromRegister(
                            width: size.width * 0.9,
                            controller: zipcodeOffice,
                            hintText: 'รหัสไปรษณีย์',
                            validator: (value) {
                              if (value!.isEmpty) return 'กรุณากรอกรายละเอียด';
                              return null;
                            },
                          ),
                          FromRegister(
                            width: size.width * 0.9,
                            controller: phoneOffice,
                            hintText: 'เบอร์โทรบริษัท',
                            validator: (value) {
                              if (value!.isEmpty) return 'กรุณากรอกรายละเอียด';
                              return null;
                            },
                          ),
                        ],
                      ),
                widget.type == 'บุคคลทั่วไป' || widget.type != 'ตัวแทน'
                    ? SizedBox.shrink()
                    : Column(
                        children: [
                          FromRegister(
                            width: size.width * 0.9,
                            controller: nameAgent,
                            hintText: 'ชื่อคาร์โกของท่าน',
                            validator: (value) {
                              if (value!.isEmpty) return 'กรุณากรอกรายละเอียด';
                              return null;
                            },
                          ),
                          FromRegister(
                            width: size.width * 0.9,
                            controller: webAgent,
                            hintText: 'เว็บไวต์คาร์โก้ของท่าน',
                            validator: (value) {
                              if (value!.isEmpty) return 'กรุณากรอกรายละเอียด';
                              return null;
                            },
                          ),
                          FromRegister(
                            width: size.width * 0.9,
                            controller: totalAgent,
                            hintText: 'จำนวนการส่งในไทย',
                            validator: (value) {
                              if (value!.isEmpty) return 'กรุณากรอกรายละเอียด';
                              return null;
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('รูปภาพคาร์โก้'),
                              _selectedFile == null
                                  ? GestureDetector(
                                      onTap: () {
                                        getImage(ImageSource.gallery);
                                      },
                                      child: Container(
                                        width: size.width * 0.47,
                                        height: size.height * 0.069,
                                        decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(10)),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: size.width * 0.235,
                                              height: size.height * 0.0345,
                                              decoration: BoxDecoration(color: red1, borderRadius: BorderRadius.circular(10)),
                                              child: Center(
                                                child: Text(
                                                  'อัพโหลดไฟล์รูป',
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  : Stack(
                                      children: [
                                        SizedBox(
                                          width: size.width * 0.65,
                                          height: size.height * 0.25,
                                          child: Image.file(
                                            _selectedFile!,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                _selectedFile = null;
                                              });
                                            },
                                            child: Icon(
                                              Icons.remove_circle,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                            ],
                          ),
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
                        fontSize: 13,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                FromRegister(
                  width: size.width * 0.9,
                  controller: homeCode,
                  hintText: 'บ้านเลขที่',
                  validator: (value) {
                    if (value!.isEmpty) return 'กรุณากรอกรายละเอียด';
                    return null;
                  },
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  padding: EdgeInsets.all(8),
                  child: DropdownSearch<Provice>(
                    selectedItem: selectedProvices,
                    // items: listProvinec,
                    items: provices,
                    itemAsString: (item) => item.nameTH ?? '',
                    popupProps: PopupProps.menu(
                      constraints: BoxConstraints(maxHeight: 450),
                      fit: FlexFit.loose,
                      itemBuilder: (context, item, isSelected) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.nameTH ?? '',
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
                        selectedProvices = value;
                        if (value != null) {
                          // getDistrits(id: value.id!);
                          _loadDistricts(value.provinceCode!);
                          selecteddistrict = null;
                          selectedSubdistricts = null;
                        }
                      });
                    },
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                selectedProvices == null
                    ? SizedBox.shrink()
                    : Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            padding: EdgeInsets.all(8),
                            child: DropdownSearch<Provice>(
                              selectedItem: selecteddistrict,
                              // items: listProvinec,
                              items: districts,
                              itemAsString: (item) => item.nameTH ?? '',
                              popupProps: PopupProps.menu(
                                constraints: BoxConstraints(maxHeight: 450),
                                fit: FlexFit.loose,
                                itemBuilder: (context, item, isSelected) => Container(
                                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.nameTH ?? '',
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
                                  selecteddistrict = value;
                                  if (value != null) {
                                    _loadSubdistricts(value.districtCode!);
                                  }
                                });
                              },
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                        ],
                      ),

                selecteddistrict == null
                    ? SizedBox.shrink()
                    : Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            padding: EdgeInsets.all(8),
                            child: DropdownSearch<Provice>(
                              selectedItem: selectedSubdistricts,
                              // items: listProvinec,
                              items: subdistricts,
                              itemAsString: (item) => item.nameTH ?? '',
                              popupProps: PopupProps.menu(
                                constraints: BoxConstraints(maxHeight: 450),
                                fit: FlexFit.loose,
                                itemBuilder: (context, item, isSelected) => Container(
                                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.nameTH ?? '',
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
                                  selectedSubdistricts = value;
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

                FromRegister(
                  width: size.width * 0.9,
                  controller: zipcode,
                  hintText: 'รหัสไปรษณีย์',
                  validator: (value) {
                    if (value!.isEmpty) return 'กรุณากรอกรายละเอียด';
                    return null;
                  },
                ),
                transports?.isEmpty ?? true
                    ? SizedBox.shrink()
                    : Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        padding: EdgeInsets.all(8),
                        child: DropdownSearch<ServiceTransporterById>(
                          selectedItem: selectedTransports,
                          // items: listProvinec,
                          items: transports!,
                          itemAsString: (item) => item.name ?? '',
                          popupProps: PopupProps.menu(
                            constraints: BoxConstraints(maxHeight: 450),
                            fit: FlexFit.loose,
                            itemBuilder: (context, item, isSelected) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name ?? '',
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
                              hintText: 'รูปแบบส่งต่อ(ในไทย)',
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
                              selectedTransports = value;
                            });
                          },
                        ),
                      ),

                SizedBox(
                  height: size.height * 0.02,
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
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_selecteduseto == 'เคย') {
                            _selecteduseto = null;
                          } else {
                            _selecteduseto = 'เคย';
                          }
                        });
                      },
                      child: Container(
                        height: size.height * 0.06,
                        width: size.width * 0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                            width: size.width * 0.001,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: size.width * 0.05),
                          child: Row(
                            children: [
                              CustomCheckbox(
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
                              SizedBox(
                                width: size.width * 0.04,
                              ),
                              Text(
                                'เคย',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * 0.01),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_selecteduseto == 'ไม่เคย') {
                            _selecteduseto = null;
                          } else {
                            _selecteduseto = 'ไม่เคย';
                          }
                        });
                      },
                      child: Container(
                        height: size.height * 0.06,
                        width: size.width * 0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                            width: size.width * 0.001,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: size.width * 0.05),
                          child: Row(
                            children: [
                              CustomCheckbox(
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
                              SizedBox(
                                width: size.width * 0.04,
                              ),
                              Text(
                                'ไม่เคย',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.01),
                total?.isEmpty ?? true
                    ? SizedBox.shrink()
                    : Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        padding: EdgeInsets.all(8),
                        child: DropdownSearch<RateShip>(
                          selectedItem: selectedtotalsend,
                          // items: listProvinec,
                          items: total!,
                          itemAsString: (item) => item.option ?? '',
                          popupProps: PopupProps.menu(
                            constraints: BoxConstraints(maxHeight: 450),
                            fit: FlexFit.loose,
                            itemBuilder: (context, item, isSelected) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.option ?? '',
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
                              hintText: 'ยอดจำนวนค่าขนส่งที่เคยนำเข้าต่อครั้ง',
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
                              selectedtotalsend = value;
                            });
                          },
                        ),
                      ),
                // total?.isEmpty ?? true
                //     ? SizedBox.shrink()
                //     : DropdownButtonFormField2<RateShip>(
                //         isExpanded: true,
                //         decoration: InputDecoration(
                //           contentPadding: const EdgeInsets.symmetric(vertical: 16),
                //           enabledBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(10),
                //             borderSide: BorderSide(
                //               color: Colors.grey,
                //               width: 0.5,
                //             ),
                //           ),
                //           focusedBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(10),
                //             borderSide: BorderSide(
                //               color: Colors.grey,
                //               width: 0.5,
                //             ),
                //           ),
                //           fillColor: Colors.white,
                //           filled: true,
                //         ),
                //         hint: const Text(
                //           'ยอดจำนวนค่าขนส่งที่เคยนำเข้าต่อครั้ง ',
                //           style: TextStyle(fontSize: 14),
                //         ),
                //         items: total!
                //             .map((item) => DropdownMenuItem<RateShip>(
                //                   value: item,
                //                   child: Text(
                //                     item.option ?? '',
                //                     style: const TextStyle(fontSize: 14, color: Colors.black),
                //                   ),
                //                 ))
                //             .toList(),
                //         validator: (value) {
                //           if (value == null) {
                //             return 'please select ยอดจำนวนส่ง';
                //           }
                //           return null;
                //         },
                //         onChanged: (value) {},
                //         onSaved: (value) {
                //           selectedtotalsend = value;
                //         },
                //         buttonStyleData: const ButtonStyleData(
                //           padding: EdgeInsets.only(right: 8),
                //         ),
                //         iconStyleData: const IconStyleData(
                //           icon: Icon(
                //             Icons.keyboard_arrow_down,
                //             color: Colors.black45,
                //           ),
                //           iconSize: 24,
                //         ),
                //         dropdownStyleData: DropdownStyleData(
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //         ),
                //         menuItemStyleData: const MenuItemStyleData(
                //           padding: EdgeInsets.symmetric(horizontal: 16),
                //         ),
                //       ),
                SizedBox(height: size.height * 0.01),
                often?.isEmpty ?? true
                    ? SizedBox.shrink()
                    : Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        padding: EdgeInsets.all(8),
                        child: DropdownSearch<RateShip>(
                          selectedItem: selectedsendoften,
                          // items: listProvinec,
                          items: often!,
                          itemAsString: (item) => item.option ?? '',
                          popupProps: PopupProps.menu(
                            constraints: BoxConstraints(maxHeight: 450),
                            fit: FlexFit.loose,
                            itemBuilder: (context, item, isSelected) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.option ?? '',
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
                              hintText: 'ท่านนำเข้าบ่อยหรือไม่',
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
                              selectedsendoften = value;
                            });
                          },
                        ),
                      ),

                // often?.isEmpty ?? true
                //     ? SizedBox.shrink()
                //     : DropdownButtonFormField2<RateShip>(
                //         isExpanded: true,
                //         decoration: InputDecoration(
                //           contentPadding: const EdgeInsets.symmetric(vertical: 16),
                //           enabledBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(10),
                //             borderSide: BorderSide(
                //               color: Colors.grey,
                //               width: 0.5,
                //             ),
                //           ),
                //           focusedBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(10),
                //             borderSide: BorderSide(
                //               color: Colors.grey,
                //               width: 0.5,
                //             ),
                //           ),
                //           fillColor: Colors.white,
                //           filled: true,
                //         ),
                //         hint: const Text(
                //           'ท่านนำเข้าบ่อยหรือไม่ ',
                //           style: TextStyle(fontSize: 14),
                //         ),
                //         items: often!
                //             .map((item) => DropdownMenuItem<RateShip>(
                //                   value: item,
                //                   child: Text(
                //                     item.option ?? '',
                //                     style: const TextStyle(
                //                       fontSize: 14,
                //                     ),
                //                   ),
                //                 ))
                //             .toList(),
                //         validator: (value) {
                //           if (value == null) {
                //             return 'please select ยอดจำนวนส่ง';
                //           }
                //           return null;
                //         },
                //         onChanged: (value) {},
                //         onSaved: (value) {
                //           selectedsendoften = value;
                //         },
                //         buttonStyleData: const ButtonStyleData(
                //           padding: EdgeInsets.only(right: 8),
                //         ),
                //         iconStyleData: const IconStyleData(
                //           icon: Icon(
                //             Icons.keyboard_arrow_down,
                //             color: Colors.black45,
                //           ),
                //           iconSize: 24,
                //         ),
                //         dropdownStyleData: DropdownStyleData(
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //         ),
                //         menuItemStyleData: const MenuItemStyleData(
                //           padding: EdgeInsets.symmetric(horizontal: 16),
                //         ),
                //       ),

                SizedBox(height: size.height * 0.01),
                import?.isEmpty ?? true
                    ? SizedBox.shrink()
                    : Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        padding: EdgeInsets.all(8),
                        child: DropdownSearch<RateShip>(
                          selectedItem: selectedimporttype,
                          // items: listProvinec,
                          items: import!,
                          itemAsString: (item) => item.option ?? '',
                          popupProps: PopupProps.menu(
                            constraints: BoxConstraints(maxHeight: 450),
                            fit: FlexFit.loose,
                            itemBuilder: (context, item, isSelected) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.option ?? '',
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
                              hintText: 'ต้องการนำเข้าแบบใด',
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
                              selectedimporttype = value;
                            });
                          },
                        ),
                      ),

                // import?.isEmpty ?? true
                //     ? SizedBox.shrink()
                //     : DropdownButtonFormField2<RateShip>(
                //         isExpanded: true,
                //         decoration: InputDecoration(
                //           contentPadding: const EdgeInsets.symmetric(vertical: 16),
                //           enabledBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(10),
                //             borderSide: BorderSide(
                //               color: Colors.grey,
                //               width: 0.5,
                //             ),
                //           ),
                //           focusedBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(10),
                //             borderSide: BorderSide(
                //               color: Colors.grey,
                //               width: 0.5,
                //             ),
                //           ),
                //           fillColor: Colors.white,
                //           filled: true,
                //         ),
                //         hint: const Text(
                //           'ต้องการนำเข้าแบบใด ',
                //           style: TextStyle(fontSize: 14),
                //         ),
                //         items: import!
                //             .map((item) => DropdownMenuItem<RateShip>(
                //                   value: item,
                //                   child: Text(
                //                     item.option ?? '',
                //                     style: const TextStyle(
                //                       fontSize: 14,
                //                     ),
                //                   ),
                //                 ))
                //             .toList(),
                //         validator: (value) {
                //           if (value == null) {
                //             return 'กรุณากรอก';
                //           }
                //           return null;
                //         },
                //         onChanged: (value) {},
                //         onSaved: (value) {
                //           selectedimporttype = value;
                //         },
                //         buttonStyleData: const ButtonStyleData(
                //           padding: EdgeInsets.only(right: 8),
                //         ),
                //         iconStyleData: const IconStyleData(
                //           icon: Icon(
                //             Icons.keyboard_arrow_down,
                //             color: Colors.black45,
                //           ),
                //           iconSize: 24,
                //         ),
                //         dropdownStyleData: DropdownStyleData(
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //         ),
                //         menuItemStyleData: const MenuItemStyleData(
                //           padding: EdgeInsets.symmetric(horizontal: 16),
                //         ),
                //       ),

                SizedBox(height: size.height * 0.01),
                want?.isEmpty ?? true
                    ? SizedBox.shrink()
                    : Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        padding: EdgeInsets.all(8),
                        child: DropdownSearch<RateShip>(
                          selectedItem: selecteduserwant,
                          // items: listProvinec,
                          items: want!,
                          itemAsString: (item) => item.option ?? '',
                          popupProps: PopupProps.menu(
                            constraints: BoxConstraints(maxHeight: 450),
                            fit: FlexFit.loose,
                            itemBuilder: (context, item, isSelected) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.option ?? '',
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
                              hintText: 'สิ่งที่ท่านต้องการ',
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
                              selecteduserwant = value;
                            });
                          },
                        ),
                      ),

                // want?.isEmpty ?? true
                //     ? SizedBox.shrink()
                //     : DropdownButtonFormField2<RateShip>(
                //         isExpanded: true,
                //         decoration: InputDecoration(
                //           contentPadding: const EdgeInsets.symmetric(vertical: 16),
                //           enabledBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(10),
                //             borderSide: BorderSide(
                //               color: Colors.grey,
                //               width: 0.5,
                //             ),
                //           ),
                //           focusedBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(10),
                //             borderSide: BorderSide(
                //               color: Colors.grey,
                //               width: 0.5,
                //             ),
                //           ),
                //           fillColor: Colors.white,
                //           filled: true,
                //         ),
                //         hint: const Text(
                //           'สิ่งที่ท่านต้องการ ',
                //           style: TextStyle(fontSize: 14),
                //         ),
                //         items: want!
                //             .map((item) => DropdownMenuItem<RateShip>(
                //                   value: item,
                //                   child: Text(
                //                     item.option ?? '',
                //                     style: const TextStyle(
                //                       fontSize: 14,
                //                     ),
                //                   ),
                //                 ))
                //             .toList(),
                //         validator: (value) {
                //           if (value == null) {
                //             return 'กรุณากรอก';
                //           }
                //           return null;
                //         },
                //         onChanged: (value) {},
                //         onSaved: (value) {
                //           selecteduserwant = value;
                //         },
                //         buttonStyleData: const ButtonStyleData(
                //           padding: EdgeInsets.only(right: 8),
                //         ),
                //         iconStyleData: const IconStyleData(
                //           icon: Icon(
                //             Icons.keyboard_arrow_down,
                //             color: Colors.black45,
                //           ),
                //           iconSize: 24,
                //         ),
                //         dropdownStyleData: DropdownStyleData(
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //         ),
                //         menuItemStyleData: const MenuItemStyleData(
                //           padding: EdgeInsets.symmetric(horizontal: 16),
                //         ),
                //       ),

                SizedBox(
                  height: size.height * 0.015,
                ),
                Row(
                  children: [
                    CustomCheckbox(
                      value: _agreement,
                      onChanged: (bool? value) {
                        setState(() {
                          _agreement = value!;
                        });
                      },
                    ),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: 'ยอมรับ ',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                          children: [
                            TextSpan(
                              text: 'ข้อกำหนด เงื่อนไข',
                              style: TextStyle(color: red1, fontSize: 12),
                              // Add onTap event to TextSpan
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Handle the tap on 'ข้อกำหนด เงื่อนไขการสั่งซื้อและส่งตามนโยบายของบริษัทฯ'
                                  print('Tapped on ข้อกำหนด เงื่อนไข');
                                },
                            ),
                            TextSpan(
                              text: ' การสั่งซื้อและส่งตามนโยบายของ บริษัทฯและ ',
                              style: TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            TextSpan(
                              text: 'นโยบายความเป็นส่วนตัว',
                              style: TextStyle(color: red1, fontSize: 12),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Handle the tap on 'นโยบายความเป็นส่วนตัว'
                                  print('Tapped on นโยบายความเป็นส่วนตัว');
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                // Text(
                //   'หรือ',
                //   style: TextStyle(fontSize: 15),
                // ),
                // SizedBox(
                //   height: size.height * 0.012,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Container(
                //       height: size.height * 0.05,
                //       width: size.width * 0.2,
                //       decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(20),
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.black.withOpacity(0.1),
                //             spreadRadius: 1,
                //             blurRadius: 1,
                //             offset: Offset(0, 1),
                //           ),
                //         ],
                //       ),
                //       child: Center(
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Image.asset('assets/icons/google.png'),
                //           ],
                //         ),
                //       ),
                //     ),
                //     Container(
                //       height: size.height * 0.05,
                //       width: size.width * 0.2,
                //       decoration: BoxDecoration(
                //         color: Color(0xff3c5a9a),
                //         borderRadius: BorderRadius.circular(20),
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.black.withOpacity(0.1),
                //             spreadRadius: 1,
                //             blurRadius: 1,
                //             offset: Offset(0, 1),
                //           ),
                //         ],
                //       ),
                //       child: Center(
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Image.asset('assets/icons/facebook.png'),
                //           ],
                //         ),
                //       ),
                //     ),
                //     Container(
                //       height: size.height * 0.05,
                //       width: size.width * 0.2,
                //       decoration: BoxDecoration(
                //         color: Color(0xff00b900),
                //         borderRadius: BorderRadius.circular(20),
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.black.withOpacity(0.1),
                //             spreadRadius: 1,
                //             blurRadius: 1,
                //             offset: Offset(0, 1),
                //           ),
                //         ],
                //       ),
                //       child: Center(
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Image.asset('assets/icons/line.png'),
                //           ],
                //         ),
                //       ),
                //     ),
                //     Container(
                //       height: size.height * 0.05,
                //       width: size.width * 0.2,
                //       decoration: BoxDecoration(
                //         color: Colors.black,
                //         borderRadius: BorderRadius.circular(20),
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.black.withOpacity(0.1),
                //             spreadRadius: 1,
                //             blurRadius: 1,
                //             offset: Offset(0, 1),
                //           ),
                //         ],
                //       ),
                //       child: Center(
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Image.asset('assets/icons/apple.png'),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          width: double.infinity,
          height: size.height * 0.073,
          decoration: BoxDecoration(color: _agreement == false ? Colors.grey : red1, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: TextButton(
              onPressed: () async {
                String? imagePro;
                LoadingDialog.open(context);
                if (widget.type == 'ตัวแทน') {
                  if (_selectedFile != null) {
                    imagePro = await RegisterService.addImage(file: _selectedFile, path: 'images/asset/');
                  }
                }
                try {
                  await RegisterService.register(
                    member_type: widget.type,
                    fname: _nameController.text,
                    lname: _lastnameController.text,
                    phone: _telController.text,
                    password: _passwordController.text,
                    birth_date: dateSentApi,
                    gender: _selectedGender,
                    importer_code: _importercodeController.text,
                    referrer: _reccomController.text,
                    comp_name: nameOffice.text,
                    comp_tax: taxOffice.text,
                    comp_phone: phoneOffice.text,
                    order_quantity_in_thai: totalAgent.text,
                    live_address: homeCodeOffice.text != '' ? homeCodeOffice.text : homeCode.text,
                    live_province: selectedProvicesOffice != null ? selectedProvicesOffice!.nameTH : selectedProvices!.nameTH,
                    live_district: selecteddistrictOffice != null ? selecteddistrictOffice!.nameTH : selecteddistrict!.nameTH,
                    live_sub_district: selectedSubdistrictsOffice != null ? selectedSubdistrictsOffice!.nameTH : selectedSubdistricts!.nameTH,
                    live_postal_code: zipcodeOffice.text != '' ? zipcodeOffice.text : zipcode.text,
                    cargo_name: nameAgent.text,
                    cargo_website: webAgent.text,
                    cargo_image: imagePro,
                    address: homeCode.text,
                    province: selectedProvices!.nameTH,
                    district: selecteddistrict!.nameTH,
                    sub_district: selectedSubdistricts!.nameTH,
                    postal_code: zipcode.text,
                    latitude: lat,
                    longitude: long,
                    transport_thai_master_id: selectedTransports!.id,
                    ever_imported_from_china: _selecteduseto,
                    order_quantity: selectedtotalsend!.option,
                    frequent_importer: selectedsendoften!.option,
                    need_transport_type: selectedimporttype!.option,
                    additional_requests: selecteduserwant!.option,
                    image: '',
                  );
                  LoadingDialog.close(context);
                  if (!mounted) return;
                  Navigator.pop(context);
                } on Exception catch (e) {
                  if (!mounted) return;
                  LoadingDialog.close(context);
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialogYes(
                      title: 'แจ้งเตือน',
                      description: '$e',
                      pressYes: () {
                        Navigator.pop(context);
                      },
                    ),
                  );
                } catch (e) {
                  if (!mounted) return;
                  LoadingDialog.close(context);
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialogYes(
                      title: 'แจ้งเตือน',
                      description: '$e',
                      pressYes: () {
                        Navigator.pop(context);
                      },
                    ),
                  );
                }
              },
              child: Text(
                'สมัครสมาชิก',
                style: TextStyle(fontSize: 20, color: _agreement == false ? const Color.fromARGB(255, 228, 225, 225) : Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _afterselectDate(BuildContext context) async {
    final config = CalendarDatePicker2WithActionButtonsConfig(
        calendarType: CalendarDatePicker2Type.single,
        selectedDayHighlightColor: kBackgroundColor,
        dayTextStylePredicate: ({required DateTime date}) {
          return TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.normal,
          );
        },
        yearBuilder: ({required int year, TextStyle? textStyle, bool? isDisabled, bool? isSelected, bool? isCurrentYear, BoxDecoration? decoration}) {
          final buddhistYear = year + 543; // แปลงปี ค.ศ. เป็น พ.ศ.
          return Center(
            child: Text(
              '$buddhistYear',
              style: textStyle,
            ),
          );
        },
        // ปรับแต่งข้อความสำหรับตัวเลือกเดือน/ปี
        modePickerTextHandler: ({required DateTime monthDate}) {
          final buddhistYear = monthDate.year + 543; // แปลงปี ค.ศ. เป็น พ.ศ.
          final monthNames = ["มกราคม", "กุมภาพันธ์", "มีนาคม", "เมษายน", "พฤษภาคม", "มิถุนายน", "กรกฎาคม", "สิงหาคม", "กันยายน", "ตุลาคม", "พฤศจิกายน", "ธันวาคม"];
          final monthName = monthNames[monthDate.month - 1];
          return "$monthName พ.ศ. $buddhistYear";
        },
        firstDate: DateTime(1900),
        lastDate: DateTime.now());

    final selectedDates = await showCalendarDatePicker2Dialog(
      dialogBackgroundColor: Colors.white,
      context: context,
      config: config,
      dialogSize: const Size(325, 400),
      value: [],
    );

    if (selectedDates != null && selectedDates.isNotEmpty) {
      final selectedDate = selectedDates.first;
      final formattedDate = _convertToBuddhistEra(selectedDate ?? DateTime.now());
      final formatttedDateapi = _convertToapi(selectedDate ?? DateTime.now());
      _birthController.text = formattedDate;
      dateSentApi = formatttedDateapi;
    }
  }

  String _convertToBuddhistEra(DateTime date) {
    final buddhistYear = date.year + 543;
    final day = date.day.toString().padLeft(2, '0'); // เติม 0 ให้เป็นเลข 2 หลัก
    final month = date.month.toString().padLeft(2, '0'); // เติม 0 ให้เป็นเลข 2 หลัก
    return '$day-$month-$buddhistYear';
  }

  String _convertToapi(DateTime date) {
    final day = date.day.toString().padLeft(2, '0'); // เติม 0 ให้เป็นเลข 2 หลัก
    final month = date.month.toString().padLeft(2, '0'); // เติม 0 ให้เป็นเลข 2 หลัก
    return '${date.year}-$month-$day';
  }

  Future<void> getImage(ImageSource source) async {
    try {
      if (Platform.isIOS) {
        final XFile? image = await ImagePicker().pickImage(source: source);
        if (image != null) {
          // final cropped = await ImageCropper().cropImage(
          //   sourcePath: image.path,
          //   aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
          //   compressQuality: 90,
          //   maxHeight: 500,
          //   maxWidth: 500,
          //   compressFormat: ImageCompressFormat.jpg,
          // );

          setState(() {
            _selectedFile = File(image.path);
            inspect(_selectedFile);
          });
        }
      } else {
        final XFile? image = await ImagePicker().pickImage(source: source);
        if (image != null) {
          // final cropped = await ImageCropper().cropImage(
          //   sourcePath: image.path,
          //   aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
          //   compressQuality: 90,
          //   maxHeight: 500,
          //   maxWidth: 500,
          //   compressFormat: ImageCompressFormat.jpg,
          // );

          setState(() {
            _selectedFile = File(image.path);
            inspect(_selectedFile);
          });
        }
        // if (image != null) {
        //   setState(() {
        //     _selectedFile = File(image.path);
        //     inspect(_selectedFile);
        //   });
        // }
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
