import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Lclpage extends StatelessWidget {
  const Lclpage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(
          'บริการจัดส่ง LCL',
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
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // จัดข้อความและวิดเจ็ตภายในให้ชิดซ้าย
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // ขอบมน
              ),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(10.0), // ขอบมนให้เหมือนกับ Container
                child: Image.asset(
                  'assets/images/lclimages.png',
                  fit: BoxFit.cover, // ให้ภาพครอบคลุมพื้นที่ทั้งหมด
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0, left: 8.0),
              child: Text(
                'บริการส่งพัสดุแบบ LCL',
                style: TextStyle(
                  fontSize: 20,
                  color: red1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'LCL บริการขนส่งแบบไม่เต็มตู้',
                style: TextStyle(
                    color: headingtext,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 10.0),
              child: Text(
                'บริการส่งของจากจีนครบวงจร ขนส่งด่วนทางเรือ 12-18 วัน จากจีนถึงไทย ส่งตรงถึงหน้าบ้าน พร้อมผู้ดูแลส่วนตัว สามารถสั่ง ซื้อสินค้า พร้อมระบบติดตามพัสดุ อำนวยความสะดวก ในการค้าระหว่างสองประเทศ พร้อมได้รับเอกสารนำเข้าแบบถูกต้อง ไม่ว่าจะเป็นเอกสาร ใบขนสินค้าขาเข้า ใบเสร็จจากศุลกากร และ ใบเสร็จต่างๆ ตามจริงของสายเรือ',
                style: TextStyle(
                    color: headingtext,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 5.0),
              child: Text(
                'โกดังเปิดให้บริการ : กว่างโจว ,อี้อู ,เซิ้นเจิ้น ,ซัวเถา ,ชิงเต่า ,เทียนจิน ,เซียงไฮ้ ,เซี่ยเมิน ,ต้าเหลี่ยน',
                style: TextStyle(
                    color: headingtext,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 13.0),
              child: Text(
                'LCL (Less than Container Load) คือ การขนส่งแบบแชร์พื้นที่ใน ตู้คอนเทนเนอร์ ซึ่งจะมีเจ้าของสินค้าหลายรายรวมกันมาในตู้ คอนเทนเนอร์',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 13.0),
              child: Text(
                'ระยะเวลาในการขนส่งจีน-ไทย : 12-18 วันทำการ พัสดุจะถูกจัดส่ง ผ่านคลังสินค้าของกรุงเทพฯ ไปยังจังหวัดต่างๆ หลังจากชำระเงิน 1-2 วันทำการสำหรับการนัดวันจัดส่ง จัดส่งผ่านทางขนส่ง ร่วมให้บริการของบริษัทฯ J&T / IT Transport / นิ่มซีเส็ง และอื่นๆ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 10),
              child: Text(
                'วันและเวลานัดรับพัสดุ : วันจันทร์ - วันเสาร์ เวลา 9.00-18.00 น. (โกดังปิดทุกวันอาทิตย์)',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 13.0),
              child: Text(
                'แจ้งลูกค้า :',
                style: TextStyle(
                    color: red1, fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 13.0),
              child: Text(
                '1. สินค้าจะต้องถูกส่งไปยังคลังสินค้ากว่างโจว หากต้องการให้เข้ารับสินค้าหน้าโรงงานกรุณาติดต่อ WeChat : ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 0),
              child: Text(
                'tegcargo',
                style: TextStyle(
                    color: red1, fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 5.0),
              child: Text(
                '2. หากสินค้ที่ส่งไม่สอดคล้องกับรายละเอียดจะถูกแจ้งความเท็จ ยึด หรือริบโดยศุลกากรหรือของปลอมสินค้าไม่ได้รับการแจ้งเกิดจากความรับผิดทางกฎหมายและสถานการณ์ที่เกี่ยวข้อง ภาระเพิ่มเติมคือความรับผิดชอบของลูกค้า',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 5.0),
              child: Text(
                '3. หลังจากสินค้ามาถึงกรุงเทพฯ คลังสินค้าของเราจะจัดส่งภายในระยะเวลา 3 วัน นับจากวันที่มาถึง หากเกิน 3 วัน จะมีการเรียกเก็บค่าเช่าโกดังสินค้าบางรายการสำหรับการขนส่งแต่ละครั้ง ค่าธรรมเนียม (การเจรจากับเจ้าหน้าที่บริการลูกค้า)',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 13.0),
              child: Text(
                'รูปแบบบการให้บริการปิดตู้ของ TEGCARGO มีหลากหลายรูปแบบ ตามความต้องการของลูกค้าและโรงงาน',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 5.0),
              child: Text(
                'ผลิตภัณฑ์การขนส่งหลัก : เฟอร์นิเจอร์ อุปกรณ์ความงาม ยานพาหนะไฟฟ้า อาหาร เครื่องสำอางค์ วัสดุยา ของเล่นและ ของขวัญ เครื่องใช้ไฟฟ้า วัสดุก่อสร้างและฮาร์ดแวร ์ แบตเตอรี่ลิเธียม แล็ปท็อป โทรศัพท์มือถือ อุปกรณ์สื่อสาร ผลิตภัณฑ์อิเล็กทรอนิกส์ เสื้อผ้า รองเท้า โคมไฟ LED อุปกรณ์ทางการแพทย์ ชิ้นส่วนรถยนต์และอุปกรณ์ รถจักรยานยนต์ ฯลฯ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 13.0),
              child: Text(
                'สามารถตอบสนองความต้องการด้านการขนส่งต่างๆ ของผลิตภัณฑ์ของคุณ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: size.height * 0.08,
        child: BottomAppBar(
          color: white,
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  Future.delayed(Duration(seconds: 2), () {
                    Navigator.of(context).pop(); // ปิด dialog หลังจาก 2 วินาที
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
