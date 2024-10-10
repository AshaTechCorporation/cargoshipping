import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class paperlesslistwidget extends StatelessWidget {
  const paperlesslistwidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.24,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
      child: Column(
        children: [
          Container(
            height: size.height * 0.12,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffe0f1e7), // สีแรก
                  Color(0xfffffbe3), // สีที่สอง
                ],
                begin: Alignment.centerLeft, // เริ่มจากทางซ้าย
                end: Alignment.centerRight, // ไปทางขวา
                stops: [0.2, 1.0], // สัดส่วน 70% สีแรก และ 30% สีที่สอง
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          '1. PO no. A99999',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              fontFamily: 'SukhumvitSet'),
                        ),
                        SizedBox(
                          width: size.width * 0.53,
                          child: Row(
                            children: [
                              Expanded(
                                // ให้ข้อความสามารถใช้พื้นที่ใน Row ได้เต็มที่
                                child: Text(
                                  'ชั้นวางพลาสติกในครัว, ชั้นวางของในห้องน้ําแบบไม่มี รูพรุน, สุขโครกติดผนัง, เครื่องใช้ในห้องน้ํา',
                                  style: TextStyle(
                                      color: greyuserinfo,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'สีแดงอิฐ',
                              style: TextStyle(
                                  color: greyuserinfo,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.0001,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'ประเภท ',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              fontFamily: 'SukhumvitSet'
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'A',
                                style: TextStyle(
                                  color: greyuserinfo,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.006,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: size.height * 0.099,
                    width: size.width * 0.1,
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'โกดัง ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'SukhumvitSet'
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'กวางโจว',
                                style: TextStyle(
                                    color: greyuserinfo, fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.003,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'โดย ',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              fontFamily: 'SukhumvitSet'
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'EK',
                                style: TextStyle(
                                    color: greyuserinfo, fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'unit ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'SukhumvitSet'
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'กล่องลังจำนวน1',
                                style: TextStyle(
                                  color: greyuserinfo,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Row(
                                  children: [
                                    Text(
                                      'น้ำหนัก',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                    SizedBox(width: size.width * 0.02),
                                    Text(
                                      '2.5 กก.',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: greyuserinfo,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 8,
                                child: Row(
                                  children: [
                                    Text(
                                      'จำนวน',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                    SizedBox(width: size.width * 0.02),
                                    Text(
                                      '000',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: greyuserinfo,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.01),
                          Row(
                            children: [
                              Text(
                                'ขนาด',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: size.width * 0.02),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: size.width * 0.02),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'ยาว 50 x สูง 60 x กว้าง 40 cm',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: greyuserinfo,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: size.height * 0.005,
                                    ),
                                    Text(
                                      '(30 CBM)',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: greyuserinfo,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: size.height * 0.098,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
