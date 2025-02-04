import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Servicedetail extends StatelessWidget {
  const Servicedetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(
          'บริการขนส่งทางบก',
          style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
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
            crossAxisAlignment: CrossAxisAlignment.start, // จัดข้อความและวิดเจ็ตภายในให้ชิดซ้าย
            children: [
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), // ขอบมน
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0), // ขอบมนให้เหมือนกับ Container
                  child: Image.asset(
                    'assets/images/image 45.png',
                    fit: BoxFit.cover, // ให้ภาพครอบคลุมพื้นที่ทั้งหมด
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0, left: 8.0),
                child: Text(
                  'บริการขนส่งพัสดุทางบก (ทางรถ)',
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
                  'นำเข้า Door to Door ทางบก',
                  style: TextStyle(color: headingtext, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 10.0),
                child: Text(
                  'บริการส่งของจากจีนครบวงจร ขนส่งด่วนที่สุด 4-7 วัน จากจีน ถึงไทย ส่งตรงถึงหน้าบ้าน พร้อมผู้ดูแลส่วนตัว สามารถสั่งซื้อ สินค้าพร้อมระบบติดตาม พัสดุ อำนวยความสะดวกใน การค้าระหว่างสองประเทศเส้นทาง การขนส่งทางบก ค่าขนส่งเริ่มต้น 20 บาทต่อกิโลกรัม',
                  style: TextStyle(color: headingtext, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 13.0),
                child: Text(
                  'โกดังเปิดให้บริการ : กว่างโจว ,อี้อู ,เซิ้นเจิ้น ,ซัวเถา',
                  style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 5.0),
                child: Text(
                  'ขนส่งทางบก คือ  การขนส่งทางรถบรรทุก ซึ่งมีต้นทุนต่ำเมื่อ เทียบกับการขนส่งทางอากาศ และง่ายกว่า ในระยะเท่ากัน และ สะดวกกว่า คล่องตัวกว่าถ้าเทียบกับการขนส่งทางทะเล บริการพิธีการ ศุลกากรและแพ็คเกจภาษีแบบ door-to-door ปลอดภัย รวดเร็ว ง่ายและสะดวก ส่งฟรีในตัวเมืองกรุงเทพ',
                  style: TextStyle(color: headingtext, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 13.0),
                child: Text(
                  'ระยะเวลาในการขนส่งจีน-ไทย : 4-7 วันทำการ ',
                  style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 5.0),
                child: Text(
                  'พัสดุจะถูกจัดส่งผ่านคลังสินค้าของกรุงเทพฯไปยังจังหวัด ต่างๆ หลังจากชำระเงิน1-2วันทำการสำหรับการนัดวันจัดสั่ง จัดส่งผ่านทางขนส่งร่วมให้บริการของบริษัทฯ J&T / IT Transport / นิ่มซีเส็ง และอื่นๆ',
                  style: TextStyle(color: headingtext, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 13.0),
                child: Text(
                  'วันและเวลานัดรับพัสดุ: วันจันทร์ – วันเสาร์ เวลา 9.00-18.00 น. (โกดังปิดทุกวันอาทิตย์)',
                  style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 13.0),
                child: Text(
                  'แจ้งลูกค้า :',
                  style: TextStyle(color: red1, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 13.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        '1. ',
                        style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 18,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'สินค้าจะต้องถูกส่งไปยังคลังสินค้ากว่างโจว หากต้องการให้เข้ารับสินค้าหน้าโรงงานกรุณาติดต่อ WeChat',
                            style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            ':tegcargo',
                            style: TextStyle(color: red1, fontSize: 13, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(left: 8.0, top: 0),
              //   child: Text(
              //     'tegcargo',
              //     style: TextStyle(color: red1, fontSize: 13, fontWeight: FontWeight.bold),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        '2. ',
                        style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 18,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'หากสินค้ที่ส่งไม่สอดคล้องกับรายละเอียดจะถูกแจ้งความเท็จ ยึด หรือริบโดยศุลกากรหรือของปลอมสินค้าไม่ได้รับการแจ้งเกิดจากความรับผิดทางกฎหมายและสถานการณ์ที่เกี่ยวข้อง ภาระเพิ่มเติมคือความรับผิดชอบของลูกค้า',
                            style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        '3. ',
                        style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 18,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'หลังจากสินค้ามาถึงกรุงเทพฯ คลังสินค้าของเราจะจัดส่งภายในระยะเวลา 3 วัน นับจากวันที่มาถึง หากเกิน 3 วัน จะมีการเรียกเก็บค่าเช่าโกดังสินค้าบางรายการสำหรับการขนส่งแต่ละครั้ง ค่าธรรมเนียม (การเจรจากับเจ้าหน้าที่บริการลูกค้า)',
                            style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 13.0),
                child: Text(
                  'ผลิตภัณฑ์การขนส่งหลัก : เฟอร์นิเจอร์ อุปกรณ์ความงาม ยานพาหนะไฟฟ้า อาหาร เครื่องสำอางค์ วัสดุยา ของเล่นและ ของขวัญ เครื่องใช้ไฟฟ้า วัสดุก่อสร้างและฮาร์ดแวร ์ แบตเตอรี่ลิเธียม แล็ปท็อป โทรศัพท์มือถือ อุปกรณ์สื่อสาร ผลิตภัณฑ์อิเล็กทรอนิกส์ เสื้อผ้า รองเท้า โคมไฟ LED อุปกรณ์ทางการแพทย์ ชิ้นส่วนรถยนต์และอุปกรณ์ รถจักรยานยนต์ ฯลฯ',
                  style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 5.0),
                child: Text(
                  'สามารถตอบสนองความต้องการด้านการขนส่งต่างๆ ของผลิตภัณฑ์ของคุณ',
                  style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        child: BottomAppBar(
          color: white,
          child: GestureDetector(
            onTap: () {
              // showDialog(
              //   context: context,
              //   builder: (BuildContext context) {
              //     Future.delayed(Duration(seconds: 2), () {
              //       Navigator.of(context)
              //           .pop(); // ปิด dialog หลังจาก 2 วินาที
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
              decoration: BoxDecoration(color: red1, borderRadius: BorderRadius.circular(15), border: Border.all(width: size.width * 0.003, color: red1)),
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
