import 'package:cargoshipping/account/mapTest.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/track/widgets/productcardwidget.dart';
import 'package:flutter/material.dart';

class Werehousechipage extends StatefulWidget {
  const Werehousechipage({super.key});

  @override
  State<Werehousechipage> createState() => _WerehousechipageState();
}

class _WerehousechipageState extends State<Werehousechipage> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: white,
        title: Text(
          'รายละเอียดคำสั่งซื้อ',
          style: TextStyle(
              fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: white,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(size.height * 0.015),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ข้อมูลการจัดส่ง',
                          style: TextStyle(
                              fontSize: 13,
                              color: headingtext,
                              fontWeight: FontWeight.w600),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MapTest()));
                          },
                          child: Container(
                            height: size.height * 0.027,
                            width: size.width * 0.35,
                            decoration: BoxDecoration(
                                border: Border.all(color: red1, width: 1.5),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'สถานะการจัดส่ง',
                                  style: TextStyle(
                                      color: red1,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11),
                                ),
                                Image.asset('assets/icons/redpin.png')
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.035),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/home_icon.png',
                          height: size.height * 0.05,
                        ),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '31 ก.ค.67 15:34',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: headingtext,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'สินค้าโกดังจีน',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: red1,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Container(
                    color: greymess,
                    height: size.height * 0.0025,
                    width: size.width * 0.95,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Row(
                      children: [
                        Text(
                          'เลขที่PO',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: size.width * 0.14,
                        ),
                        Text(
                          'A123456',
                          style: TextStyle(
                              fontSize: 14,
                              color: headingtext,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: size.height * 0.02),
                          child: Text(
                            'ที่อยู่จัดส่ง',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.11,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Girati Sukapat  097 123 4567 111/222 xxxxx xxxxx xxxxxx xxxxxxxxxxxxx ...',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: headingtext,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'เลือกที่อยู่จัดส่ง',
                          style: TextStyle(
                              fontSize: 13,
                              color: red1,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: size.width * 0.025,
                        ),
                        Image.asset('assets/icons/rightredarrow.png')
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Row(
                      children: [
                        Text(
                          'ช่องทางการขนส่งโดย',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Text('รถEK')
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Row(
                      children: [
                        Text(
                          'โกดัง',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: size.width * 0.25,
                        ),
                        Text('กวางโจว')
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'รวมน้ำหนักทั้งหมด',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '00 kg',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'CBM รวมทั้งหมด',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '00 CBM',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'พัสดุรวมทั้งหมด',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '00 Carton',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.014,
                  ),
                  Container(
                    height: size.height * 0.05,
                    decoration: BoxDecoration(color: red1),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'รายการสั่งซื้อสินค้า',
                            style: TextStyle(
                                fontSize: 13,
                                color: white,
                                fontWeight: FontWeight.w600),
                          ),
                          Image.asset('assets/icons/rightarrowwhite.png')
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    color: white,
                    // height: size.height * 0.5,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.06),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'รายการพัสดุเข้าคลัง',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        ProductCardWidget(
                            size: size, greyuserinfo: greyuserinfo, red1: red1),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Container(
                          height: size.height * 0.0002,
                          width: size.width * 0.95,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.05),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'เลือกบริการเสริม',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(size.height * 0.01),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                _buildCheckbox('ตีลังโบกริ่ง', 0),
                                SizedBox(width: 8),
                                _buildCheckbox('ตีลังไม้ทับ', 1),
                                SizedBox(width: 8),
                                _buildCheckbox('พับเก็บแรง', 2),
                                SizedBox(width: 8),
                                _buildCheckbox('ตรวจ QC สินค้า', 3),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: size.height * 0.0005,
                          width: size.width * 0.98,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: EdgeInsets.all(size.height * 0.015),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'หมายเหตุเพิ่มเติม:',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: headingtext),
                              ),
                              Text(
                                'ฝากข้อความหมายเหตุ',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: headingtext),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: size.height * 0.0005,
                          width: size.width * 0.98,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Padding(
                          padding: EdgeInsets.all(size.height * 0.015),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'หมายเหตุการตรวจรับพัสดุ',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: red1,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            'info info info info info info info info info info info info info info info info info info info info info info info info info info info ',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: size.height * 0.085,
        child: BottomAppBar(
          color: white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  Text(
                    'กรุณาตรวจสอบข้อมูลพัสดุุ ประเภท',
                    style: TextStyle(
                        fontSize: 11, color: red1, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'และช่องทางขนส่ง',
                    style: TextStyle(
                        fontSize: 11, color: red1, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'หากพบข้อมูลผิดพลาด โปรดแจ้ง',
                    style: TextStyle(
                        fontSize: 11, color: red1, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  // เมื่อปุ่มถูกคลิก
                  // print("ปุ่มส่งรายการสั่งซื้อถูกคลิก");

                  // แสดง dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.of(context)
                            .pop(); // ปิด dialog หลังจาก 2 วินาที
                      });
                      return AlertDialog(
                        title: Text('เปิดบิล'),
                        content: Text('เปิดบิลเสร็จสิ้น'),
                      );
                    },
                  );
                },
                child: Container(
                  height: size.height * 0.06,
                  width: size.width * 0.4,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: red1, width: 2.0)),
                  child: Center(
                    child: Text(
                      'แจ้งข้อมูลพัสดุผิด',
                      style: TextStyle(
                        color: red1,
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
      ),
    );
  }

  Widget _buildCheckbox(String label, int index) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {
          setState(() {
            // อัปเดต index ที่เลือก หากกดซ้ำจะยกเลิกการเลือก
            selectedIndex = (selectedIndex == index) ? -1 : index;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: selectedIndex == index ? red1 : Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: red1,
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: size.width * 0.05,
                height: size.height * 0.025,
                decoration: BoxDecoration(
                  color:
                      selectedIndex == index ? Colors.white : Colors.grey[300],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: selectedIndex == index
                    ? Icon(Icons.check, color: red1, size: 16)
                    : null,
              ),
              SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: selectedIndex == index ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ));
  }
}
