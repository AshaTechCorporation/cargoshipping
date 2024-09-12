import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Guidepage extends StatefulWidget {
  const Guidepage({super.key});

  @override
  _GuidepageState createState() => _GuidepageState();
}

class _GuidepageState extends State<Guidepage> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Test',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Container ด้านบน
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: isExpanded ? 0 : 270, // ถ้าขยาย Container บนจะย่อ
            width: size.width, // เต็มความกว้างหน้าจอ
            color: Colors.blue, // สีของ Container บน
            child: Center(
              child: Text(
                'Container ด้านบน',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: 10),
          // Container ด้านล่าง
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded; // เปลี่ยนสถานะขยาย/ย่อ
              });
            },
            child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: isExpanded
                    ? size.height -
                        kToolbarHeight -
                        MediaQuery.of(context).padding.top -
                        10 // ความสูงเต็มหน้าจอเมื่อขยาย
                    : 500, // ถ้ายังไม่ขยาย ให้มีความสูง 470
                width: size.width, // เต็มความกว้างหน้าจอ
                color: Colors.white, // สีของ Container ล่าง
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'ข้อความ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                fontFamily: 'SukhumvitSet'),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isExpanded = !isExpanded;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(10),
                              color: Colors.red,
                              child: Icon(
                                isExpanded
                                    ? Icons.keyboard_arrow_down
                                    : Icons.keyboard_arrow_up,
                                color: Colors.white,
                                size: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.04),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/icons/Frame 61.png',
                            width: 30,
                            height: 30,
                          ),
                          SizedBox(width: size.width * 0.04),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: pinkmess,
                                ),
                                width: size.width * 0.55,
                                height: size.height * 0.07,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 7, top: 8),
                                    child: Text(
                                      'สวัสดีครับ (username)TEG Cargo ยินดีให้บริการครับ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * 0.01),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: pinkmess,
                                ),
                                width: size.width * 0.66,
                                height: size.height * 0.08,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: size.width * 0.04,
                                      top: size.height * 0.02),
                                  child: Text(
                                    'ท่านสามารถเลือกคำถามจากปุ่มตัวเลือก หรือพิมพ์คำถามในช่องแชทได้เลยครับ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.085,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: size.width * 0.07),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: greymess,
                                              ),
                                              width: size.width * 0.6,
                                              height: size.height * 0.07,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  left: size.width * 0.03,
                                                  right: size.width * 0.03,
                                                  top: size.height * 0.015,
                                                ),
                                                child: Text(
                                                  'การรับส่งของแต่ละครั้งมีจำนวนขั้นต่ำไหม',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                                height: size.height * 0.01),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: greymess,
                                              ),
                                              width: size.width * 0.6,
                                              height: size.height * 0.07,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  left: size.width * 0.03,
                                                  right: size.width * 0.03,
                                                  top: size.height * 0.015,
                                                ),
                                                child: Text(
                                                  'ต้องการทราบราคาค่าขนส่งสินค้า ทั้งทาง รถ และทางเรือ',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                                height: size.height * 0.01),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: greymess,
                                              ),
                                              width: size.width * 0.6,
                                              height: size.height * 0.07,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  left: size.width * 0.03,
                                                  right: size.width * 0.03,
                                                  top: size.height * 0.015,
                                                ),
                                                child: Text(
                                                  'วิธีการคิดค่าขนส่งจากราคาที่คิดเป็น CBM',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
