import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Shippingservice extends StatelessWidget {
  const Shippingservice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(
          'บริการ Shipping ดำเนินพิธีการศุลกากร',
          style: TextStyle(
              fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
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
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // จัดข้อความและวิดเจ็ตภายในให้ชิดซ้าย
            children: [
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), // ขอบมน
                ),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(10.0), // ขอบมนให้เหมือนกับ Container
                  child: Image.asset(
                    'assets/images/shippingservice.png',
                    fit: BoxFit.cover, // ให้ภาพครอบคลุมพื้นที่ทั้งหมด
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0, left: 8.0),
                child: Text(
                  'บริการ Shipping ดำเนินพิธีการศุลกากร',
                  style: TextStyle(
                    fontSize: 20,
                    color: red1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 10.0),
                child: Text(
                  'บริการ SHIPPING เคลียร์สินค้า ภาษีศุลกากร สนามบินสุวรรณภูมิ(ทางรถ ทางเรือ ทางเครื่องบิน)',
                  style: TextStyle(
                      color: headingtext,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 13.0),
                child: Text(
                  '*ทางบริษัทฯ มีความชำนาญและประสบการณ์ในด้านกฎระเบียบ พิธีการศุลกากร พิกัดอัตราศุลกากร สามารถให้บริการลูกค้า และแก้ไขปัญหาเชิงลึกได้ เคลียร์สินค้าทุกประเภท(ไม่ผิดกฎหมาย) สามารถแก้ปัญหาการเคลียร์สินค้ากับเจ้าหน้าที่กรมศุลกากร จัดการด้านภาษีรูปแบบต่าง ๆ เช่น การใช้สิทธิ์ลดภาษีในการ นำเข้าสินค้าบางประเภท การขอคืนภาษี เคลียร์สินค้า ขาเข้า-ขาออก ชำระภาษี พิธีการศุลกากรรวมทั้งบริการทำประกันสินค้าทุกประเภท ให้บริการลูกค้าได้ตามความต้องการที่เหมาะสมอย่างรวดเร็ว และสะดวกที่สุด',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 15.0),
                child: Text(
                  'บริการเคลียร์จบทุกปัญหา (ไม่มีขั้นต่ำ!!)',
                  style: TextStyle(
                      color: red1, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 5.0),
                child: Text(
                  '1. ปัญหาเกี่ยวกับพิกัดอัตราศุลกากร',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 1.0),
                child: Text(
                  '2. ปัญหางานใบอนุญาต',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 1.0),
                child: Text(
                  '3. ปัญหาเอกสารผิด',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 1.0),
                child: Text(
                  '4. การใช้ฟอร์มต่างๆ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 1.0),
                child: Text(
                  '5. ปัญหาราคาสินค้า',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 1.0),
                child: Text(
                  '6. การนำเข้าสัตว์ สิ่งมีชีวิต',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 1.0),
                child: Text(
                  '7. การนำเข้าอาหาร ผลไม้ ของสด',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 1.0),
                child: Text(
                  '8. เสื้อผ้า เครื่องแต่งกาย',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 1.0),
                child: Text(
                  '9. เครื่องประดับ ของใช้ส่วนตัว',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 1.0),
                child: Text(
                  '10. รับเคลียร์สินค้าลงคลังสุวรรณภูมิ เช่น fedx , tnt , dhl , ups , bfs',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 20.0),
                child: Text(
                  'เราเป็นผู้ชำนาญการศุลกากร ด้วยทีมงานผู้เชี่ยวชาญมาก ประสบการณ์ในระบบการขนส่งกว่าหลายปี ให้บริการเป็นตัวแทน ออกสินค้าแทนลูกค้า ตั้งแต่กระบวนการในการทำเอกสาร การเดินเอกสาร ติดต่อประสานงานกับเจ้าหน้าที่ศุลกากร รับประกันได้ว่าสินค้าจะผ่านพิธีการทางศุลกากรอย่างรวดเร็ว ไม่มีปัญหาเรื่องสินค้าถูกกัก ลูกค้าสามารถวางใจได้ สินค้าจะไม่ถูกยึดและถูกเรียกเก็บภาษีเพิ่มเติม',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 15.0),
                child: Text(
                  'หมายเหตุ :',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 5.0),
                child: Text(
                  'ติดต่อชิปปิ้งจีน TEG Cargo',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 1.0),
                child: Text(
                  'ต้องการรายละเอียดเพิ่มเติมหรือโปรโมชั่นพิเศษ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 1.0),
                child: Text(
                  'Line : @tegcargo',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 1.0),
                child: Text(
                  'Tel : 061-996-6663',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 1.0),
                child: Text(
                  'ติดต่อได้ในวันทำการ : จันทร์ - เสาร์  เวลาทำการ : 09.00 - 18.00 น.',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: size.height * 0.08,
        child: BottomAppBar(
          color: white,
          child: GestureDetector(
            onTap: () {
              // showDialog(
              //   context: context,
              //   builder: (BuildContext context) {
              //     Future.delayed(Duration(seconds: 2), () {
              //       Navigator.of(context).pop(); // ปิด dialog หลังจาก 2 วินาที
              //     });
              //     return AlertDialog(
              //       title: Text('เปิดบิล'),
              //       content: Text('เปิดบิลเสร็จสิ้น'),
              //     );
              //   },
              // );
            },
            child: Container(
              height: size.height * 0.06,
              width: size.width * 0.42,
              decoration: BoxDecoration(
                  color: red1,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: size.width * 0.003, color: red1)),
              child: Center(
                child: Text(
                  'สนใจใช้บริการนี้',
                  style: TextStyle(
                    color: white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
