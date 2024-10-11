import 'package:cargoshipping/account/widgets/CardlistWidget.dart';
import 'package:cargoshipping/account/widgets/alltranspothis.dart';
import 'package:cargoshipping/account/widgets/bookingtourpage.dart';
import 'package:cargoshipping/account/widgets/exportabroadpage.dart';
import 'package:cargoshipping/account/widgets/fclpage.dart';
import 'package:cargoshipping/account/widgets/firsttopup.dart';
import 'package:cargoshipping/account/widgets/firstwithdrown.dart';
import 'package:cargoshipping/account/widgets/howto.dart';
import 'package:cargoshipping/account/widgets/importlist.dart';
import 'package:cargoshipping/account/widgets/importtaxpage.dart';
import 'package:cargoshipping/account/widgets/listimportcorrectwidget.dart';
import 'package:cargoshipping/account/widgets/menulist.dart';
import 'package:cargoshipping/account/widgets/orderlistwidget.dart';
import 'package:cargoshipping/account/widgets/ordersumpage.dart';
import 'package:cargoshipping/account/widgets/paymentpage.dart';
import 'package:cargoshipping/account/widgets/tagunlimited.dart';
import 'package:cargoshipping/account/widgets/topupwidget.dart';
import 'package:cargoshipping/account/widgets/werehousepage.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/widgets/correctimportpage.dart';
import 'package:cargoshipping/home/widgets/importrate.dart';
import 'package:cargoshipping/home/widgets/paperless.dart';
import 'package:cargoshipping/home/widgets/shippingcalpage.dart';
import 'package:cargoshipping/track/chineseWarehouse.dart';
import 'package:cargoshipping/track/inTransitPage.dart';
import 'package:cargoshipping/track/readytosend.dart';
import 'package:cargoshipping/track/sended.dart';
import 'package:cargoshipping/track/successfulDelivery.dart';
import 'package:cargoshipping/track/thaiWarehouse.dart';
import 'package:cargoshipping/track/waitShippingPayment.dart';
import 'package:cargoshipping/track/waitpurchase.dart';
import 'package:cargoshipping/track/waitsumcard.dart';
import 'package:cargoshipping/track/widgets/canclecard.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool isGuangzhouSelected = true;
  @override
  Widget build(BuildContext context) {
    final selectedInfo = isGuangzhouSelected ? guangzhouInfo : yiwuInfo;
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(200.0),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFcd8032),
                      Color(0xFFecc49d),
                    ],
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: size.width * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                'A123456',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Name Surname',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Spacer(),
                          Container(
                            width: size.width * 0.45,
                            height: size.height * 0.06,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [color1, color2],
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                stops: [0.3, 0.7],
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Bronze',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(width: size.width * 0.04),
                                CircleAvatar(
                                  backgroundColor: Colors.grey[300],
                                  radius: 20,
                                  child: Icon(
                                    Icons.person,
                                    size: 20,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.009,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                'TEG+ Point ',
                                style: TextStyle(
                                    color: white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '150 คะแนน ',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: size.width * 0.2),
                                child: Text(
                                  'Wallet ',
                                  style: TextStyle(
                                      color: white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                'คงเหลือ 1025 บาท',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                            fistpagewidget.length,
                            (index) => Topupwidget(
                                size: size,
                                title: topup[index],
                                press: () {
                                  if (index == 0) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Firsttopup()),
                                    );
                                  }
                                  if (index == 1) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Firstwithdrawpage()),
                                    );
                                  }
                                })),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            height: size.height * 0.09,
            width: size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.grey.shade300,
                width: size.width * 0.005,
              ),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Tagunlimited()));
              },
              child: Padding(
                padding: EdgeInsets.all(size.height * 0.01),
                child: Row(
                  children: [
                    Image.asset('assets/images/freetour.png'),
                    SizedBox(
                      width: size.width * 0.04,
                    ),
                    SizedBox(
                      height: size.height * 0.064,
                      width: size.width * 0.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: size.width * 0.3,
                          ),
                          Text(
                            'TEG UNLIMITED',
                            style: TextStyle(
                                fontSize: 13,
                                color: red1,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: size.height * 0.001,
                          ),
                          Text(
                            'รับส่วนลดทุกบริการ TEG CARGO สิทธิประโยชน์พิเศษ และอีกมากมาย',
                            style: TextStyle(
                                fontSize: 12,
                                color: greyuserinfo,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.099,
                    ),
                    Image.asset('assets/icons/rightredarrow.png')
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
            child: Row(
              children: [
                Text(
                  'คำสั่งซื้อของฉัน',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Ordersumpage()));
                  },
                  child: Row(
                    children: [
                      Text(
                        'ประวัติคำสั่งซื้อทั้งหมด',
                        style: TextStyle(fontSize: 12, color: greyuserinfo),
                      ),
                      SizedBox(
                        width: size.width * 0.015,
                      ),
                      Image.asset('assets/icons/history.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
            child: Wrap(
              spacing: 3,
              runSpacing: 3,
              children: List.generate(
                myorder.length,
                (index) => CardlistWidget(
                  size: size,
                  title: myorder[index]['name'],
                  press: () {
                    if (index == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Waitsumcard(),
                        ),
                      );
                    }
                    if (index == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Waitpurchase(),
                        ),
                      );
                    }
                    if (index == 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Readytosend(),
                        ),
                      );
                    }
                    if (index == 3) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Sended(),
                        ),
                      );
                    }
                    if (index == 4) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Canclecard(),
                        ),
                      );
                    }
                  },
                  imagespath: myorder[index]['images'],
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
            child: Row(
              children: [
                Text(
                  'รายการขนส่ง',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Alltranspothis()));
                  },
                  child: Row(
                    children: [
                      Text(
                        'ประวัติการขนส่งทั้งหมด',
                        style: TextStyle(fontSize: 12, color: greyuserinfo),
                      ),
                      SizedBox(
                        width: size.width * 0.015,
                      ),
                      Image.asset('assets/icons/history.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Wrap(
            spacing: 5,
            runSpacing: 5,
            children: List.generate(
              orderlist.length,
              (index) => Orderlist(
                size: size,
                title: orderlist[index]['name'],
                press: () {
                  if (index == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChineseWarehouse(),
                      ),
                    );
                  }
                  if (index == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InTransitPage(),
                      ),
                    );
                  }
                  if (index == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ThaiWarehouse(),
                      ),
                    );
                  }
                  if (index == 3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WaitShippingPayment(),
                      ),
                    );
                  }
                  if (index == 4) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SuccessfulDelivery(),
                      ),
                    );
                  }
                },
                imagespath: orderlist[index]['images'],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
            child: Row(
              children: [
                Text(
                  'รายการนำเข้าถูกต้อง',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Ordersumpage()));
                  },
                  child: Row(
                    children: [
                      Text(
                        'ประวัติสรุปการสั่งซื้อ',
                        style: TextStyle(fontSize: 12, color: greyuserinfo),
                      ),
                      SizedBox(
                        width: size.width * 0.015,
                      ),
                      Image.asset('assets/icons/history.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.2),
            child: Wrap(
              spacing: 3,
              runSpacing: 3,
              children: List.generate(
                listimportcorrect.length,
                (index) => Listimportcorrectwidget(
                  size: size,
                  title: listimportcorrect[index]['name'],
                  press: () {
                    if (index == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Correctimportpage(), //Correctimportpage
                        ),
                      );
                    }
                  },
                  imagespath: listimportcorrect[index]['images'],
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
                child: Text(
                  'รายการบริการ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 5.0,
              left: 10.0,
              right: 10.0,
              bottom: 10.0,
            ),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: importlist.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                // mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: 1.25,
              ),
              itemBuilder: (context, index) {
                return Importlist(
                  size: size,
                  press: () {
                    if (index == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Importtaxpage(),
                        ),
                      );
                    }
                    if (index == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Paperless(),
                        ),
                      );
                    }
                    if (index == 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Fclpage(),
                        ),
                      );
                    }
                    if (index == 3) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Bookingtourpage(),
                        ),
                      );
                    }
                    if (index == 4) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Werehousepage(),
                        ),
                      );
                    }
                    if (index == 5) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Paymentpage(),
                        ),
                      );
                    }
                    if (index == 6) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Exportabroadpage(),
                        ),
                      );
                    }
                    if (index == 7) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShippingCalculatorPage(),
                        ),
                      );
                    }
                    if (index == 8) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Importrate(),
                        ),
                      );
                    }
                  },
                  imagespath: importlist[index],
                );
              },
            ),
          ),

          // Wrap(
          //   spacing: 15,
          //   runSpacing: 10,
          //   children: List.generate(
          //     importlist.length,
          //     (index) => Importlist(
          //       size: size,
          //       press: () {},
          //       imagespath: importlist[index],
          //     ),
          //   ),
          // ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Column(
            children: List.generate(
                howto.length,
                (index) => Howto(
                      size: size,
                      press: () {},
                      title: howto[index],
                    )),
          ),
          Padding(
            padding: EdgeInsets.all(size.height * 0.02),
            child: Column(
              children: [
                Container(
                  width: size.width * 0.9,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: background,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isGuangzhouSelected = true;
                              });
                            },
                            child: Container(
                              decoration: isGuangzhouSelected
                                  ? BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.red,
                                          width: size.width * 0.006,
                                        ),
                                      ),
                                    )
                                  : null,
                              padding: EdgeInsets.only(bottom: 3.0),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'ที่อยู่โกดัง ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: isGuangzhouSelected
                                            ? Colors.black
                                            : Colors.grey,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'กวางโจว',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: isGuangzhouSelected
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isGuangzhouSelected = false;
                              });
                            },
                            child: Container(
                              decoration: isGuangzhouSelected
                                  ? null
                                  : BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.red,
                                          width: size.width * 0.006,
                                        ),
                                      ),
                                    ),
                              padding: EdgeInsets.only(bottom: 3.0),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'ที่อยู่โกดัง ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: !isGuangzhouSelected
                                            ? Colors.black
                                            : Colors.grey,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'อี้อู',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: !isGuangzhouSelected
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      _buildInfoRow(context, '收货人', selectedInfo['收货人']!,
                          Icons.copy, Colors.grey, '(ชื่อผู้รับสินค้า)'),
                      _buildInfoRow(context, '详细地址', selectedInfo['详细地址']!,
                          Icons.copy, Colors.grey, '(รายละเอียดที่อยู่)'),
                      _buildInfoRow(context, '邮编', selectedInfo['邮编']!,
                          Icons.copy, Colors.grey, '(เลขที่ไปรษณีย์)'),
                      _buildInfoRow(context, '手机', selectedInfo['手机']!,
                          Icons.copy, Colors.grey, '(เบอร์โทรศัพท์)'),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  padding: EdgeInsets.all(size.height * 0.015),
                  decoration: BoxDecoration(
                    color: background,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Container(
                                padding: EdgeInsets.only(
                                    bottom: size.height * 0.001),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: red1,
                                      width: size.width * 0.004,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'ที่อยู่โกดังไทย ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            WidgetSpan(
                              child: Container(
                                padding: EdgeInsets.only(
                                    bottom: size.height * 0.001),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: red1,
                                      width: size.width * 0.004,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'TEGCARGO',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: red1,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(vertical: size.height * 0.015),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                '12 6 ตำบลคลองข่อย อำเภอปากเกร็ด\nจังหวัดนนทบุรี 11120',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            // SizedBox(width: size.width * 0.01),
                            Row(
                              children: [
                                Icon(
                                  Icons.copy,
                                  color: Colors.grey,
                                  size: 25,
                                ),
                                Text(
                                  'คัดลอก',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      _buildInfoRow(context, 'เบอร์โทรศัพท์', '061-996-6663',
                          Icons.copy, Colors.grey, ''),
                      _buildInfoRow(
                          context,
                          'Google Maps',
                          'https://maps.app.goo.gl/gmk7B6pgrATazqb167g_st=ic',
                          Icons.copy,
                          Colors.grey,
                          ''),
                      SizedBox(height: size.height * 0.01),
                      Text(
                        'ระเบียบการเข้าคลัง TEG CARGO',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: red1,
                        ),
                      ),
                      Text(
                        '1. ก่อนเข้ารับกรุณาโทรนัดหมายก่อนล่วงหน้า อย่างน้อย 2 ชั่วโมง\n2. กรณีรับพัสดุจำนวนมากรบกวนแจ้งรหัสสินค้าที่จะนำออกให้ครบเพื่อความสะดวก\n3. ไม่อนุญาตให้นำสัตว์เลี้ยงหรือเด็กเข้าคลัง',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                MenuList(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(size.width * 0.04),
                      child: Image.asset('assets/icons/taobao.png',height: size.height * 0.07,),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.width * 0.04),
                      child: Image.asset('assets/icons/tmall.png',height: size.height * 0.07,),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.width * 0.04),
                      child: Image.asset('assets/icons/1688.png',height: size.height * 0.07,),
                    ),
                  ],
                )
              ],
            ),
          ),
        ])));
  }
}

Widget _buildInfoRow(BuildContext context, String title, String detail,
    IconData icon, Color iconColor, String subtitle) {
  final size = MediaQuery.of(context).size; // ใช้ context ที่ส่งเข้ามา

  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: size.height *
          0.005, // ปรับขนาด padding ให้สัมพันธ์กับความสูงของหน้าจอ
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(fontSize: 13, color: headingtext),
              ) //stringsubtitles
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            detail,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          children: [
            Icon(icon, color: iconColor),
            SizedBox(width: size.width * 0.008),
            Text(
              'คัดลอก',
              style: TextStyle(
                color: iconColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
