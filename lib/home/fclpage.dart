import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Fclpage1 extends StatelessWidget {
  const Fclpage1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(
          'บริการเหมาตู้ขนส่ง FCL',
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
                  'assets/images/fclpage.png',
                  fit: BoxFit.cover, // ให้ภาพครอบคลุมพื้นที่ทั้งหมด
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0, left: 8.0),
              child: Text(
                'บริการขนส่งแบบเหมาตู้ FCL',
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
                'ขนส่งเหมาตู้ FCL',
                style: TextStyle(
                    color: headingtext,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 10.0),
              child: Text(
                'บริการส่งของจากจีนครบวงจร ขนส่งด่วนที่สุด 4-7 วัน จากจีนถึงไทย ทางบริษัทดำเนินพิธีการศุลกากรดำเนินเอกสาร Form E ใบขนสินค้าขาเข้าและใบเสร็จรับเงินศุลกากรเป็นชื่อของลูกค้าทั้งหมด ส่งตรงถึงหน้าบ้าน พร้อมผู้ดูแลส่วนตัว พร้อมระบบติดตามพัสดุ อำนวยความสะดวกในการค้าระหว่างสองประเทศเส้นทางการขนส่ง ทางบก',
                style: TextStyle(
                    color: headingtext,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 13.0),
              child: Text(
                'บริการส่งของจากจีนครบวงจร ขนส่งด่วนที่สุด 12-18 วัน จากจีน ถึงไทย ทางบริษัทดำเนินพิธีการศุลกากรดำเนินเอกสาร Form E ใบขนสินค้าขาเข้าและใบเสร็จรับเงินศุลกากรเป็นชื่อของลูกค้าทั้งหมด ส่งตรงถึงหน้าบ้าน พร้อมผู้ดูแลส่วนตัว พร้อมระบบติดตามพัสดุ อำนวยความสะตวกในการค้าระหว่างสองประเทศเส้นทางการขนส่งทางทะเล',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 5.0),
              child: Text(
                'โกดังเปิดให้บริการ : กว่างโจว ,อี้อู ,เซิ้นเจิ้น ,ซัวเถา',
                style: TextStyle(
                    color: headingtext,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 13.0),
              child: Text(
                'ขนส่งเหมาตู้ คือ การขนส่งแบบ FCL สะดวกกว่า คล่องตัวกว่า ดำเนินบริการพิธีการศุลกากรปลอดภัย รวดเร็ว ง่ายและสะดวก ส่งฟรีในตัวเมืองกรุงเทพ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 10),
              child: Text(
                'ระยะเวลาในการขนส่งจีน-ไทย :',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 5),
              child: Text(
                '- ทางบก 4-7 วันทำการ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 18, top: 1),
              child: Text(
                'พัสดุจะถูกจัดส่งถึงหน้าโรงงานของท่านโดยตรง',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 5),
              child: Text(
                '- ทางทะเล 12-18 วันทำการ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 18, top: 1),
              child: Text(
                'พัสดุจะถูกจัดส่งถึงหน้าโรงงานของท่านโดยตรง',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 13.0),
              child: Text(
                'วันและเวลานัดรับพัสดุ: วันจันทร์ – วันเสาร์ เวลา 9.00-18.00 น. (โกดังปิดทุกวันอาทิตย์)',
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
                'ขนส่งปิดตู้พร้อมจัดการเอกสารต่างๆ เคลียร์ภาษีทั้งหมด และส่ง สินค้าถึงโกดังของลูกค้าในไทย แบบครบวงจรสะดวก รวดเร็ว บริการประทับใจ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 13.0),
              child: Text(
                'รูปแบบเงื่อนไขการปิดตู้',
                style: TextStyle(
                    color: red1, fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 13.0),
              child: Text(
                '1. ปิดตู้ แบบ Ex-work (EXW)',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '– ผู้ขาย โรงงานเตรียมสินค้า ไว้ที่โรงงาน',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '– ลูกค้า / TEG CARGO ไปรับสินค้าจากโรงงานผู้ผลิตสินค้า แล้วปิดตู้ สินค้าให้ลูกค้า พร้อมจัดทำเอกสาร Form ต่างๆ ให้ลูกค้าทั้งหมด และลากตู้ Container ส่งถึงโกดังปลายทาง ที่ประเทศไทย',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 13.0),
              child: Text(
                '2. ปิดตู้ แบบ Free On Board (FOB)',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '– ผู้ขาย โรงงานส่งสินค้าถึง ท่าเรือต้นทาง',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '– ลูกค้า / TEG CARGO ดำเนินการนำตู้ Container สินค้าเข้ามายังใน ประเทศไทย พร้อมจัดทำเอกสารต่างๆ เคลียร์ภาษี ให้ลูกค้าทั้งหมด และลากตู้ Container ส่งถึงโกดังปลายทางที่ประเทศไทย',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 13.0),
              child: Text(
                '3. ปิดตู้แบบ Cost Insurance Freight (CIF)',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '– ผู้ขาย โรงงานส่งสินค้าถึง ท่าเรือประเทศไทย',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '– ลูกค้า / TEG CARGO จัดทำเอกสารต่างๆ เคลียร์ตู้ Container เคลียร์ภาษี ให้ลูกค้าทั้งหมด และลากตู้ Container ส่งถึงโกดังปลาย ทางที่ประเทศไทย',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 10.0),
              child: Text(
                'TEG CARGO ยินดีให้บริการปิดตู้ ทุกรูปแบบ ไม่ว่าลูกค้าจะต้องการ รูปแบบไหน หรือรูปแบบอื่นๆ นอกจากที่กล่าวมาข้างต้น สามารถติดต่อเราเพื่อสอบถามข้อมูลเพิ่มเติม ได้ตลอด ยินดีให้บริการ ครบจบในที่เดียว ถูกต้องตามกฎหมาย ทุกขั้นตอน ติดต่อเรา',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '@TEGCargo',
                style: TextStyle(
                    color: red1, fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 13.0),
              child: Text(
                'ประเภทสินค้าที่สามารถปิดตู้ได้',
                style: TextStyle(
                    color: red1, fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                'ให้บริการขนส่งและนำเข้าสินค้าทางเรือแบบปิดตู้ สินค้าที่เราให้บริการมี 2 ประเภท ได้แก่ สินค้าทั่วไป และ สินค้า มอก. อัตราค่าบริการขนส่ง แตกต่างกัน มีเจ้าหน้าที่ให้คำปรึกษาและดำเนินการตามมาตรฐาน สากล',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 13.0),
              child: Text(
                'สินค้าทั่วไป',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                'เสื้อผ้า เครื่องแต่งกาย กระเป๋า เข็มขัด ผ้าเช็ดตัว เฟอร์นิเจอร์ เหล็ก บรรจุภัณฑ์ ฯลฯ สิ่งของเครื่องใช้ต่าง ๆ ที่ไม่ใช้ไฟฟ้า ไม่มีโลโก้ แบรนด์ และลายลิขสิทธิ์ เป็นต้น',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 13.0),
              child: Text(
                'สินค้า มอก.',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 3.0),
              child: Text(
                'ของเล่น ตุ๊กตา กระเบื้อง เซรามิก ท่อน้ำ ยางรถยนต์ เครื่องใช้ไฟฟ้า สินค้าอิเล็กทรอนิกส์ แบตเตอรี่ รถมอไซค์ใช้แบตเตอรี่ โครมไฟระย้า Power Bank เป็นต้น',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 13.0),
              child: Text(
                'ประเภทที่ให้บริการขนส่งแบบปิดตู้ทางเรือ',
                style: TextStyle(
                    color: red1, fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 5.0),
              child: Text(
                '(รูปภาพ)',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 5.0),
              child: Text(
                'ประเภทที่ให้บริการขนส่งแบบปิดตู้ทางรถ',
                style: TextStyle(
                    color: red1, fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 5.0),
              child: Text(
                '(รูปภาพ)',
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
