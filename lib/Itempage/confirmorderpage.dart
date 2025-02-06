import 'package:cached_network_image/cached_network_image.dart';
import 'package:cargoshipping/Itempage/widgets/conditionstransport.dart';
import 'package:cargoshipping/cart/widget/Custonredchechkbox.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/models/orders/optionsItem.dart';
import 'package:cargoshipping/models/orders/partService.dart';
import 'package:cargoshipping/track/detailorderpage.dart';
import 'package:flutter/material.dart';

class Confirmorderpage extends StatefulWidget {
  const Confirmorderpage(
      {super.key, required this.name, required this.num_iid, required this.products, required this.type, required this.amount, required this.optionsItems, required this.add_on_services});
  final Map<String, dynamic> products;
  final String num_iid;
  final String type;
  final String name;
  final int amount;
  final List<OptionsItem> optionsItems;
  final List<PartService> add_on_services;

  @override
  State<Confirmorderpage> createState() => _ConfirmorderpageState();
}

class _ConfirmorderpageState extends State<Confirmorderpage> {
  bool carSelected = false;
  bool boatSelected = false;
  String? selectShippingType;
  int payment_term = 1;

  void handleCheckboxChanged(String type) {
    setState(() {
      if (type == 'car') {
        carSelected = true;
        boatSelected = false;
        selectShippingType = type;
      } else if (type == 'Ship') {
        carSelected = false;
        boatSelected = true;
        selectShippingType = type;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: Text(
          'ยืนยันการสั่งซื้อ',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          child: Column(
            children: [
              Container(
                color: white,
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/icons/redpin.png',
                        ),
                        SizedBox(width: size.width * 0.03),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ที่อยู่สำหรับจัดส่ง',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: size.height * 0.005),
                            Row(
                              children: [
                                Text(
                                  'Girati Sukapat',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: size.width * 0.04),
                                Text(
                                  '097 123 4567',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              '111/222 xxxx',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      height: size.height * 0.002,
                      width: size.width * 0.92,
                      color: greymess,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/icons/redtruck.png',
                                height: size.height * 0.025,
                              ),
                              SizedBox(width: size.width * 0.02),
                              Text(
                                'รูปแบบการขนส่ง',
                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.005),
                          SizedBox(
                            height: size.height * 0.025,
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: size.width * 0.07),
                                  child: Text('ขนส่งทางรถ'),
                                ),
                                Spacer(),
                                Customredchechkbox(
                                  isSelected: carSelected, // ใช้ 'isSelected' แทน 'value'
                                  onChanged: () {
                                    setState(() {
                                      handleCheckboxChanged('car');
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.008,
                          ),
                          SizedBox(
                            height: size.height * 0.025,
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: size.width * 0.07),
                                  child: Text('ขนส่งทางเรือ'),
                                ),
                                Spacer(),
                                Customredchechkbox(
                                  isSelected: boatSelected,
                                  onChanged: () {
                                    setState(() {
                                      handleCheckboxChanged('Ship');
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          InkWell(
                            onTap: () async {
                              final _payment_term = await Navigator.push(context, MaterialPageRoute(builder: (context) => Conditionstransport()));
                              setState(() {
                                payment_term = _payment_term;
                              });
                              print(payment_term);
                            },
                            child: Row(
                              children: [
                                Text(
                                  'เงื่อนไขการขนส่ง',
                                  style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Text(
                                  'เลือกเงื่อนไขการขนส่ง',
                                  style: TextStyle(color: red1, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: size.width * 0.03,
                                ),
                                Image.asset('assets/icons/rightarrow.png'),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                color: white,
                height: size.height * 0.06,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'รายการสั่งซื้อสินค้า',
                        style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              // Column(
              //   children: List.generate(
              //     widget.products.length,
              //     (index) => Padding(
              //       padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
              //       child: Align(
              //         alignment: Alignment.topCenter,
              //         child: Container(
              //           color: background,
              //           height: size.height * 0.12,
              //           width: size.width * 0.999,
              //           child: Row(
              //             children: [
              //               ClipRRect(
              //                 borderRadius: BorderRadius.circular(16.0),
              //                 child: Image.asset(
              //                   'assets/images/box.png',
              //                   width: size.width * 0.19,
              //                   height: size.height * 0.1,
              //                   fit: BoxFit.cover,
              //                 ),
              //               ),
              //               SizedBox(
              //                 width: size.width * 0.035,
              //               ),
              //               Expanded(
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     SizedBox(height: size.height * 0.022),
              //                     Text(
              //                       'ชั้นวางพลาสติกในครัว, ชั้นวางของในห้องน้ําแบบไม่มี รูพรุน, สุขโครกติดผนัง, เครื่องใช้ในห้องน้ํา',
              //                       maxLines: 1,
              //                       overflow: TextOverflow.ellipsis,
              //                       style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w600),
              //                     ),
              //                     SizedBox(height: size.height * 0.01),
              //                     Text('สีขาวนวล'),
              //                     SizedBox(height: size.height * 0.01),
              //                     Row(
              //                       children: [
              //                         Text('¥ 4.88 (฿ 00)'),
              //                         Spacer(),
              //                         Text(
              //                           'จำนวน 50',
              //                           style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w500),
              //                         )
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: background,
                        //height: size.height * 0.13,
                        width: size.width * 0.999,
                        child: Row(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: CachedNetworkImage(
                                  width: size.width * 0.19,
                                  height: size.height * 0.1,
                                  imageUrl: "https:${widget.products['pic_url']}",
                                  fit: BoxFit.fill,
                                  placeholder: (context, url) => SizedBox(
                                      height: size.height * 0.001,
                                      width: size.width * 0.001,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 1,
                                      )),
                                  errorWidget: (context, url, error) => Image.asset(
                                    'assets/images/noimages.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                )),
                            SizedBox(
                              width: size.width * 0.035,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: size.height * 0.022),
                                  Text(
                                    '${widget.products['title']}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: size.height * 0.01),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: List.generate(widget.optionsItems.length, (index) => Text('${widget.optionsItems[index].option_name}')),
                                  ),
                                  SizedBox(height: size.height * 0.01),
                                  Row(
                                    children: [
                                      Text('¥ ${widget.products['price']} (฿ 00)'),
                                      Spacer(),
                                      Text(
                                        'จำนวน ${widget.amount}',
                                        style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: size.height * 0.071,
                color: white,
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'หมายเหตุเพิ่มเติม',
                            style: TextStyle(fontSize: 13, color: greyuserinfo, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'ฝากข้อความหมายเหตุ',
                            style: TextStyle(fontSize: 13, color: greyuserinfo, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                      child: Row(
                        children: [
                          Text(
                            'ยอดรวมคำสั่งซื้อทั้งหมด (${widget.amount} ชิ้น):',
                            style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w600),
                          ),
                          Spacer(),
                          Text(
                            '¥ ${widget.products['price']}',
                            style: TextStyle(fontSize: 16, color: red1, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Text(
                            '(~฿ ${widget.products['price']} B)',
                            style: TextStyle(fontSize: 11, color: red1, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width * 0.99,
                child: Text(
                  'อัตราแลกเปลี่ยน ณ วันที่ 00 ส.ค. 00 (00:00:00)\n4.8851 หยวนจีนต่อบาทไทย',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xff004aad), fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                child: Row(
                  children: [
                    Text('บริการเสริม'),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Container(
                color: white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Column(
                        children: List.generate(
                          widget.add_on_services.length,
                          (index) => Row(
                            children: [
                              Image.asset(
                                'assets/icons/correctred.png',
                                height: size.height * 0.018,
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              widget.add_on_services[index].add_on_service_id == 1
                                  ? Text(
                                      'ตีลังไม้',
                                      style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w600),
                                    )
                                  : Text(
                                      'ห่อฟองสบู่ ดี',
                                      style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w600),
                                    ),
                              Spacer(),
                              Text(
                                '¥ ${widget.add_on_services[index].add_on_service_price}',
                                style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              Text(
                                '(~฿ ${widget.add_on_services[index].add_on_service_price})',
                                style: TextStyle(fontSize: 11, color: Colors.black, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.007),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'ชั้นวางพลาสติกในครัว, ชั้นวาง... สีขาวมวล',
                              style: TextStyle(fontSize: 13),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.001),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'ชั้นวางพลาสติกในครัว, ชั้นวาง... สีแดงอิฐ',
                              style: TextStyle(fontSize: 14),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.008,
                      ),
                      Container(
                        color: Colors.grey,
                        height: size.height * 0.001,
                        width: double.infinity,
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        children: [
                          Text(
                            'ยอดรวมค่าบริการเสริมทั้งหมด:',
                            style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w600),
                          ),
                          Spacer(),
                          Text(
                            '¥ 500',
                            style: TextStyle(fontSize: 16, color: red1, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          Text(
                            '(~฿ 2,447.94)',
                            style: TextStyle(fontSize: 11, color: red1, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '*ค่าบริการเสริมขึ้นอยู่กับขนาดสินค้า จะแจ้งค่าใช้จ่ายเมื่อพัสดุถึงโกดังจีน',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 11, color: red1, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                child: Row(
                  children: [
                    Text('บริการเสริม'),
                  ],
                ),
              ),
              Container(
                color: white,
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                      child: Row(
                        children: [
                          Text(
                            'ค่าขนส่งจีน - จีน',
                            style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            '฿ 0',
                            style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                      child: Row(
                        children: [
                          Text('รอสรุปยอดขนส่ง'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.006,
                    ),
                    Container(
                      color: Colors.grey,
                      height: size.height * 0.001,
                      width: size.width * 0.99,
                    ),
                    SizedBox(
                      height: size.height * 0.006,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('ยอดรวมค่าขนส่งในจีนทั้งหมด'),
                          Text(
                            'รอสรุปยอด',
                            style: TextStyle(fontSize: 17, color: greyuserinfo, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '*อัตราแลกเปลี่ยน ณ วันที่ 1 ส.ค. 2567',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.black,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '**ราคานี้ยังไม่รวมค่าขนส่งในจีน และจากจีนมาไทย',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.black,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '**กรุณารอรวมยอดค่าขนส่งในจีนหลังแอดมินได้รับคำสั่งซื้อ',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.black,
                  ),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  // ใส่โค้ดที่จะทำเมื่อคลิกปุ่ม
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Detailordertrackpage(
                              name: widget.name,
                              num_iid: widget.num_iid,
                              type: widget.type,
                              products: widget.products,
                              amount: widget.amount,
                              add_on_services: widget.add_on_services,
                              optionsItems: widget.optionsItems,
                              shipping_type: selectShippingType!,
                              payment_term: payment_term.toString(),
                            )),
                  );
                },
                child: Container(
                  height: size.height * 0.06,
                  width: size.width * 0.5,
                  decoration: BoxDecoration(
                    color: red1,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'ส่งรายการสั่งซื้อ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
