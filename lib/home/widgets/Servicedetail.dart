import 'package:flutter/material.dart';

class Servicedetail extends StatelessWidget {
  const Servicedetail({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontSize: 17),
        ),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter, // จัดตำแหน่งที่ด้านบนกลาง
          child: Container(
            width: 358,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      top: 16.0), // เพิ่มระยะห่างจากด้านบน
                  height: 130,
                  width: 358,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0), // ขอบมน
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        10.0), // ขอบมนให้เหมือนกับ Container
                    child: Image.asset(
                      'assets/images/image 45.png',
                      fit: BoxFit.cover, // ให้ภาพครอบคลุมพื้นที่ทั้งหมด
                    ),
                  ),
                ),
                SizedBox(
                  height: 16, // เพิ่มระยะห่างระหว่างรูปภาพและข้อความ
                ),
                Text(
                  'บริการขนส่งพัสดุทางบก (ทางรถ)',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  textAlign:
                      TextAlign.center, // จัดตำแหน่งข้อความให้อยู่ตรงกลาง
                ),
                SizedBox(
                  height: 8, // เพิ่มระยะห่างระหว่างข้อความและเนื้อหา
                ),
                Container(
                  decoration: BoxDecoration(
                    // color: Colors.amber,
                    borderRadius:
                        BorderRadius.circular(10.0), // เพิ่มขอบมนถ้าต้องการ
                  ),
                  child: Column(
                    children: [
                      // เพิ่มระยะห่างจากขอบซ้าย
                      Text(
                        'นำเข้า Door to Door ทางบก บริการส่งของจากจีนครบวงจร ขนส่งด่วนที่สุด 4-7 วัน จากจีนถึงไทย ส่งตรงถึงหน้าบ้าน พร้อมผู้ดูแลส่วนตัว สามารถสั่งซื้อสินค้าพร้อมระบบติดตาม พัสดุ อำนวยความสะดวกในการค้าระหว่างสองประเทศเส้นทางการขนส่งทางบก ค่าขนส่งเริ่มต้น 20 บาทต่อกิโลกรัม',
                        style: TextStyle(
                          fontSize: 13, // น้ำหนักของข้อความ
                          color: const Color.fromARGB(
                              255, 0, 0, 0), // สีของข้อความ
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'โกดังเปิดให้บริการ : กว่างโจว ,อี้อู ,เซิ้นเจิ้น ,ซัวเถา',
                          style: TextStyle(
                            fontSize: 13, // น้ำหนักของข้อความ
                            color: const Color.fromARGB(
                                255, 0, 0, 0), // สีของข้อความ
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'ขนส่งทางบก คือ  การขนส่งทางรถบรรทุก ซึ่งมีต้นทุนต่ำเมื่อ เทียบกับการขนส่งทางอากาศ และง่ายกว่า ในระยะเท่ากัน และ สะดวกกว่า คล่องตัวกว่าถ้าเทียบกับการขนส่งทางทะเล บริการพิธีการ ศุลกากรและแพ็คเกจภาษีแบบ door-to-door ปลอดภัย รวดเร็ว ง่ายและสะดวก ส่งฟรีในตัวเมืองกรุงเทพ',
                        style: TextStyle(
                          fontSize: 13, // น้ำหนักของข้อความ
                          color: const Color.fromARGB(
                              255, 0, 0, 0), // สีของข้อความ
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'ระยะเวลาในการขนส่งจีน-ไทย : 4-7 วันทำการ พัสดุจะถูกจัดส่งผ่านคลังสินค้าของกรุงเทพฯไปยังจังหวัด ต่างๆ หลังจากชำระเงิน1-2วันทำการสำหรับการนัดวันจัดสั่ง จัดส่งผ่านทางขนส่งร่วมให้บริการของบริษัทฯ J&T / IT Transport / นิ่มซีเส็ง และอื่นๆ',
                        style: TextStyle(
                          fontSize: 13, // น้ำหนักของข้อความ
                          color: const Color.fromARGB(
                              255, 0, 0, 0), // สีของข้อความ
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'วันและเวลานัดรับพัสดุ: วันจันทร์ – วันเสาร์ เวลา 9.00-18.00 น. (โกดังปิดทุกวันอาทิตย์)',
                        style: TextStyle(
                          fontSize: 13, // น้ำหนักของข้อความ
                          color: const Color.fromARGB(
                              255, 0, 0, 0), // สีของข้อความ
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'แจ้งลูกค้า',
                          style: TextStyle(
                            fontSize: 13, // น้ำหนักของข้อความ
                            color: const Color.fromARGB(
                                255, 0, 0, 0), // สีของข้อความ
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '1. สินค้าจะต้องถูกส่งไปยังคลังสินค้ากว่างโจว หากต้องการให้เข้ารับสินค้าหน้าโรงงานกรุณาติดต่อ WeChat : tegcargo',
                          style: TextStyle(
                            fontSize: 13, // น้ำหนักของข้อความ
                            color: const Color.fromARGB(
                                255, 0, 0, 0), // สีของข้อความ
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '2. หากสินค้ที่ส่งไม่สอดคล้องกับรายละเอียดจะถูกแจ้งความเท็จ ยึด หรือริบโดยศุลกากรหรือของปลอมสินค้าไม่ได้รับการแจ้งเกิดจากความรับผิดทางกฎหมายและสถานการณ์ที่เกี่ยวข้อง ภาระเพิ่มเติมคือความรับผิดชอบของลูกค้า',
                          style: TextStyle(
                            fontSize: 13, // น้ำหนักของข้อความ
                            color: const Color.fromARGB(
                                255, 0, 0, 0), // สีของข้อความ
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '3. หลังจากสินค้ามาถึงกรุงเทพฯ คลังสินค้าของเราจะจัดส่งภายในระยะเวลา 3 วัน นับจากวันที่มาถึง หากเกิน 3 วัน จะมีการเรียกเก็บค่าเช่าโกดังสินค้าบางรายการสำหรับการขนส่งแต่ละครั้ง ค่าธรรมเนียม (การเจรจากับเจ้าหน้าที่บริการลูกค้า)',
                          style: TextStyle(
                            fontSize: 13, // น้ำหนักของข้อความ
                            color: const Color.fromARGB(
                                255, 0, 0, 0), // สีของข้อความ
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'ผลิตภัณฑ์การขนส่งหลัก : เฟอร์นิเจอร์ อุปกรณ์ความงาม ยานพาหนะไฟฟ้า อาหาร เครื่องสำอางค์ วัสดุยา ของเล่นและ ของขวัญ เครื่องใช้ไฟฟ้า วัสดุก่อสร้างและฮาร์ดแวร ์ แบตเตอรี่ลิเธียม แล็ปท็อป โทรศัพท์มือถือ อุปกรณ์สื่อสาร ผลิตภัณฑ์อิเล็กทรอนิกส์ เสื้อผ้า รองเท้า โคมไฟ LED อุปกรณ์ทางการแพทย์ ชิ้นส่วนรถยนต์และอุปกรณ์ รถจักรยานยนต์ ฯลฯ',
                        style: TextStyle(
                          fontSize: 13, // น้ำหนักของข้อความ
                          color: const Color.fromARGB(
                              255, 0, 0, 0), // สีของข้อความ
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'สามารถตอบสนองความต้องการด้านการขนส่งต่างๆ ของผลิตภัณฑ์ของคุณ',
                        style: TextStyle(
                          fontSize: 13, // น้ำหนักของข้อความ
                          color: const Color.fromARGB(
                              255, 0, 0, 0), // สีของข้อความ
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                          height: 45,
                          width: 306,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.red),
                          child: Center(
                              child: Text(
                            'สนใจใช้บริการนี้',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                        SizedBox(height: 20,)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
