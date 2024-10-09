import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Correctimportservice extends StatelessWidget {
  const Correctimportservice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(
          'บริการนำเข้าถูกต้อง',
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
                  'assets/images/correctimportimages.png',
                  fit: BoxFit.cover, // ให้ภาพครอบคลุมพื้นที่ทั้งหมด
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0, left: 8.0),
              child: Text(
                'บริการนำเข้าแบบถูกต้อง ออกใบขนสินค้า',
                style: TextStyle(
                  fontSize: 20,
                  color: red1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 10.0),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text:
                          'บริการออกเอกสารนำเข้า ใบขนส่ง ใบเสร็จศุลกากร ใบกำกับภาษี เอกสารที่เกี่ยวข้อง ทุกชนิด ในนามลูกค้า ทั้งในนามบุคคลธรรมดา และนิติบุคคล ',
                    ),
                    TextSpan(
                      text: 'โดยไม่มีค่าบริการขั้นต่ำ',
                      style: TextStyle(
                        color: red1,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 15.0),
              child: Text(
                'เอกสารที่ต้องใช้ประกอบการนำเข้าสินค้า',
                style: TextStyle(
                    color: red1, fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 5.0),
              child: Text(
                '1. ใบตราส่งสินค้า Bill Of Landing (B/L)',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '2. บัญชีราคาสินค้า (Invoice)',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '3. บัญชีรายละเอียดบรรจุหีบห่อ (Packing List)',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '4. ใบอนุญาต หรือ หนังสืออนุญาตสำหรับสินค้าควบคุมการนำเข้า (License)',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '5. ใบรับรองแหล่งกำเนิดสินค้า (Certificate of Origin / Form E) กรณีขอลดหรือยกเว้นอัตรากากรขาเข้า',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '6. เอกสารอื่น ๆ เช่น เอกสารแสดงส่วนผสม คุณลักษณะการใช้งานของสินค้า เป็นต้น',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '7. สำเนาบัตรประชาชน เซ็นสำเนาถูกต้อง',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '8. กรณี นิติบุคคล สำเนาหนังสือจดทะเบียนบริษัท เซ็นลงนามผู้มีอำนาจและประทับตรา',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '9. ใบลงทะเบียน paperless กับกรมศุลกากร',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '10. หนังสือมอบอำนาจส่งข้อมูลใบขนสินค้าทางอิเล็กทรอนิกส์',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 15.0),
              child: Text(
                'เอกสารที่ได้รับ',
                style: TextStyle(
                    color: red1, fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 5.0),
              child: Text(
                '1. ใบขนสินค้า',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '2. ใบเสร็จค่าธรรมเนียมจากกรมศุลกากร',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '3. ใบเสร็จค่าภาษีอากรขาเข้าและภาษีมูลค่าเพิ่ม',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '4. ใบกำกับภาษีค่าบริการขนส่งสินค้า',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 15.0),
              child: Text(
                'ค่าบริการ',
                style: TextStyle(
                    color: red1, fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 5.0),
              child: Text(
                '1. ค่าดำเนินการพิธีการทางศุลกากร จีน – ไทย',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '2. ค่าภาษีอากรขาเข้า ภาษีอื่น ๆ ภาษีมูลค่าเพิ่ม (ตามจริง)',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '3. ค่าขนส่งสินค้า จีน – ไทย',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '4. ค่าบริการ Form E',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 1.0),
              child: Text(
                '5. ค่าบริการ เอกสารขอคืนภาษีฝั่งจีน (TAX refund) ขนส่งทางรถ , ขนส่งทางเรือ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 10.0),
              child: Text(
                'หมายเหตุ :',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 3.0),
              child: Text(
                'รายละเอียดของเอกสารการนำเข้าทั้งหมด ต้องตรงกันทุกตัวอักษร ถ้าข้อมูลใน Form E ไม่ตรงกับข้อมูลในเอกสารที่ยื่นประกอบควบคู่กัน เจ้าหน้าที่มีสิทธิ์ปฏิเสธ Form และไม่อนุญาตให้ลดหย่อนภาษีของ สินค้านำเข้าได้',
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
