import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Importproductlistpage extends StatefulWidget {
  const Importproductlistpage({super.key});

  @override
  State<Importproductlistpage> createState() => _ImportproductlistpageState();
}

class _ImportproductlistpageState extends State<Importproductlistpage> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(
          'นำเข้าถูกต้อง',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.001,
            ),
            Center(
              child: Container(
                height: size.height * 0.06,
                width: size.width * 0.94,
                decoration: BoxDecoration(
                    color: red1, borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        'PO no. A99999',
                        style: TextStyle(
                            fontSize: 17,
                            color: white,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'สถานะ:   ',
                      style: TextStyle(
                          color: greyuserinfo, fontWeight: FontWeight.bold),
                      children: const <TextSpan>[
                        TextSpan(
                            text: 'xxxxx',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    'เข้าโกดังเมื่อ 00 ส.ค. 67',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff004AAD)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              height: size.height * 0.24,
              width: size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.grey,
                  width: 0.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.12,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: background,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * 0.6,
                              height: size.height * 0.03,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  '1. ชั้นวางพลาสติกในครัว, ชั้นวางของในห้องน้ําแบบไม่มี รูพรุน, สุขโครกติดผนัง, เครื่องใช้ในห้องน้ํา',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * 0.6,
                              height: size.height * 0.02,
                              child: Text(
                                'สีแดงอิฐ',
                                style: TextStyle(
                                    color: greyuserinfo,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              SizedBox(
                                  width: size.width * 0.6,
                                  height: size.height * 0.03,
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'ประเภท ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'A',
                                            style:
                                                TextStyle(color: greyuserinfo)),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              SizedBox(
                                  width: size.width * 0.6,
                                  height: size.height * 0.03,
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Shop Tracking ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '  xxxxxx',
                                            style:
                                                TextStyle(color: greyuserinfo)),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: size.height * 0.09,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: size.height * 0.022,
                                width: size.width * 0.29,
                                child: Row(
                                  children: [
                                    Text(
                                      'น้ำหนัก',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.05,
                                    ),
                                    Text(
                                      '2.5 กก.',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: greyuserinfo),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: size.height * 0.022,
                                    width: size.width * 0.25,
                                    child: Row(
                                      children: [
                                        Text(
                                          'จำนวน',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.05,
                                        ),
                                        Text(
                                          '0000',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: greyuserinfo),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: size.height * 0.02,
                                width: size.width * 0.12,
                                child: Text(
                                  'ขนาด',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.05,
                                width: size.width * 0.48,
                                child: Column(
                                  children: [
                                    Text(
                                      'ยาว 50 x  สูง 60 x กว้าง 40 cm (30 CBM)',
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: greyuserinfo),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: size.height * 0.08,
              width: size.width * 0.9,
              // color: red1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'เลือกรายการนำเข้า',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.035,
                    width: size.width * 0.62,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                      hint: Text(
                        'เลือกชื่อบริษัทนิติบุคคล',
                        style: TextStyle(color: Colors.grey,fontSize: 12),
                      ),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 20,
                      elevation: 16,
                      style: TextStyle(color: Colors.black),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue;
                        });
                      },
                      items: <String>[
                        'บริษัท A',
                        'บริษัท B',
                        'บริษัท C',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/icons/checktook.png'),
                SizedBox(
                  width: size.width * 0.03,
                ),
                Text(
                  'ขึ้นทะเบียน Paperless แล้ว',
                  style: TextStyle(
                      fontSize: 12, color: red1, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'จัดส่งเอกสารเพื่อนำเข้าถูกต้อง',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: size.height * 0.001),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text('1. Invoice',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextButton(
                          onPressed: () {
                            // การทำงานเมื่อลิงก์ถูกกด
                            print('ดูไฟล์ตัวอย่าง Invoice');
                          },
                          child: Text(
                            'ดูไฟล์ตัวอย่าง',
                            style: TextStyle(
                              color: Color(0xff004AAD),
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: size.height * 0.04,
                        width: size.width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'อัพโหลดไฟล์ Invoice',
                            style: TextStyle(
                                fontSize: 12,
                                color: greyuserinfo,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text('2. Packing list',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextButton(
                          onPressed: () {
                            // การทำงานเมื่อลิงก์ถูกกด
                            print('ดูไฟล์ตัวอย่าง Packing list');
                          },
                          child: Text(
                            'ดูไฟล์ตัวอย่าง',
                            style: TextStyle(
                              color: Color(0xff004AAD),
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: size.height * 0.04,
                        width: size.width * 0.35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'อัพโหลดไฟล์ Packing list',
                            style: TextStyle(
                                fontSize: 12,
                                color: greyuserinfo,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: size.height * 0.001,
              width: size.width * 0.9,
              color: greyuserinfo,
            ),
            SizedBox(
              height: size.height * 0.28,
              width: size.width * 0.9,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // หัวข้อหลัก
                    Text(
                      'ค่าบริการในการดำเนินการ',
                      style: TextStyle(
                        color: red1,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      'ค่าบริการส่วนที่ 1: ชำระก่อนเริ่มจัดทำ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff004AAD),
                      ),
                    ),
                    SizedBox(height: size.height * 0.005),
                    _buildServiceItem('1. ค่าธรรมเนียมศุลกากร', '3,000 บาท'),
                    _buildServiceItem('2. ค่าเอกสาร FORM E', '2,000 บาท'),
                    SizedBox(height: 15),

                    // ค่าบริการส่วนที่ 2
                    Text(
                      'ค่าบริการส่วนที่ 2: ชำระเมื่อได้รับใบฉบับร่าง',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff004AAD),
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    _buildServiceItem('3. ค่าภาษีมูลค่าเพิ่ม', '0 บาท'),
                    _buildServiceItem('4. ค่าจัดการค่าเข้า', '0 บาท'),
                    _buildServiceItem('5. ค่าธรรมเนียมจดทะเบียน', '0 บาท'),
                    SizedBox(height: size.height * 0.004),
                    Divider(),
                  ],
                ),
              ),
            ),
            Container(
              width: size.width * 0.9,
              height: size.height * 0.04,
              decoration: BoxDecoration(
                color: Color(0xfffff0f0),
                borderRadius: BorderRadius.circular(5)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'รวมค่าใช้จ่ายค่าบริการในการดำเนินการทั้งหมด',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 13),
                    ),
                    Text(
                      '5,000 บาท',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/alert.png'),
                  SizedBox(width: size.width * 0.02),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'หมายเหตุ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: size.height * 0.005),
                        Text(
                          '•  ค่าภาษีมูลค่าเพิ่ม และค่าอากรค่าเข้าจะแจ้งให้ท่านทราบเพื่อ ยืนยันยอดชำระอีกครั้งในภายหลังจัดทำเอกสารตามไฟล์แนบ ทั้ง 2 ฉบับด้านบนเรียบร้อยแล้ว',
                          style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: size.height * 0.005),
                        Text(
                          '•  ระยะเวลาดำเนินการ 10-20 วัน ยังไม่รวมระยะเวลาขึ้นทะเบียน Paperless',
                          style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            height: 50, // ความสูงของปุ่ม
            child: ElevatedButton(
              onPressed: () {
                print('ชำระค่าบริการ');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: red1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'ชำระค่าบริการ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildServiceItem(String title, String price) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      Text(
        price,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    ],
  );
}
