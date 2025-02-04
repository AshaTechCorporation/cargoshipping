import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Worldexport extends StatelessWidget {
  const Worldexport({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(
          'บริการส่งออก',
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
                    'assets/images/worldexport.png',
                    fit: BoxFit.cover, // ให้ภาพครอบคลุมพื้นที่ทั้งหมด
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0, left: 8.0),
                child: Text(
                  'บริการส่งออกสินค้าทั่วโลก',
                  style: TextStyle(
                    fontSize: 20,
                    color: red1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 10.0),
                child: Text(
                  'บริการส่งออก สินค้าทุกประเทศ ทั่วโลก!! ส่งออกสินค้าโดย ขนส่งทางเรือ SEA Freight, ทางรถ TRUCK Freight, ทางอากาศ AIR Freightเหมาะสำหรับสินค้าทุกๆ ประเภท สามารถส่งออกไปยัง ประเทศในเอเชียและยุโรป เช่น สิงคโปร์ ไต้หวัน เกาหลีใต้ ฮ่องกง สหรัฐอหรับเอมิเรตส์ สหราชอาณาจักร ฝรั่งเศส ออสเตรเลีย แคนาดา USA สหรัฐอเมริกาฯ สามารถติดตามสถานะได้ตลอดเวลา และบริการประทับใจ',
                  style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 13.0),
                child: Text(
                  'ทางเรือ',
                  style: TextStyle(color: red1, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 5.0),
                child: Text(
                  'ส่งออกทางเรือ (SEA) 12-15 วัน',
                  style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 5.0),
                child: Text(
                  'สำหรับสินค้าที่ขนาดใหญ่ หรือปริมาณมากไปหลายประเทศทั่วโลก',
                  style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, top: 2.0),
                child: Text(
                  'ประเภทการส่งของทางเรือ',
                  style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 5.0),
                child: Text(
                  '– LCL แบบไม่เต็มตู้คอนเทนเนอร์ คิดเป็นคิวบิกเมตร (CBM)',
                  style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 5.0),
                child: Text(
                  '– FCL แบบเต็มตู้คอนเทนเนอร์ขนาดมาตรฐานได้แก่ 20 ฟุต, 40 ฟุต และ 40 HQ',
                  style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0, top: 13.0),
                child: Text(
                  'ทางรถ',
                  style: TextStyle(color: red1, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 5.0),
                child: Text(
                  'ส่งออกทางรถบรรทุก (EK) 7-14 วัน',
                  style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 5.0),
                child: Text(
                  'สำหรับสินค้าขนาดใหญ่ไปประเทศที่มีเส้นทางข้ามพรมแดนได้แก่ กัมพูชา ลาว เมียนมาร์ เวียดนาม มาเลเซีย สิงคโปร์ และจีน',
                  style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, top: 2.0),
                child: Text(
                  'ประเภทการส่งของทางรถบรรทุก',
                  style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 5.0),
                child: Text(
                  '– LTL แบบไม่เต็มคันรถ โดยคิดเป็นกิโล(KG) หรือคิวบิกเมตร(CBM)',
                  style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 5.0),
                child: Text(
                  '– FTL แบบเต็มคันรถ ได้แก่ รถ 6 ล้อ, 10 ล้อ, รถเทรลเลอร์ เป็นต้น',
                  style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0, top: 13.0),
                child: Text(
                  'ทางเครื่องบิน',
                  style: TextStyle(color: red1, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 5.0),
                child: Text(
                  'ส่งออกทางเครื่องบิน (AIR) 5-7 วัน',
                  style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 5.0),
                child: Text(
                  'สำหรับ เอกสาร พัสดุขนาดเล็ก และสินค้าขนาดใหญ่ไปทุกประเทศ ทั่วโลก',
                  style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, top: 2.0),
                child: Text(
                  'ประเภทการส่งของทางเครื่องบิน',
                  style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 5.0),
                child: Text(
                  '– AIR COURIER แบบถึงหน้าประตูบ้านทั้งแบบด่วนและแบบประหยัด)',
                  style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 5.0),
                child: Text(
                  '– AIR CARGO แบบถึงสนามบินปลายทาง',
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
