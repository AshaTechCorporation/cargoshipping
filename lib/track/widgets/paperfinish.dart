import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/track/widgets/paperfinishdetail.dart';
import 'package:cargoshipping/track/widgets/paperlesswidget.dart';
import 'package:flutter/material.dart';

class Paperfinish extends StatefulWidget {
  const Paperfinish({super.key});

  @override
  State<Paperfinish> createState() => _PaperfinishState();
}

class _PaperfinishState extends State<Paperfinish> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: white,
        title: Text(
          'เสร็จสิ้น',
          style: TextStyle(
              fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(30.0),
            child: Column(
              children: [
                Container(
                  width: size.width * 0.95,
                  height: size.height * 0.04,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(color: greyuserinfo, width: 0.5)),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'ค้นหาเลข Tracking, Order, Container ',
                            hintStyle: TextStyle(
                                fontSize: 13,
                                color: greyuserinfo,
                                fontWeight: FontWeight.bold),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                bottom: size.height * 0.018,
                                left: size.width * 0.03),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: size.height * 0.037,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: red1,
                            ),
                            child: Center(
                              child: Text(
                                'ค้นหา',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  color: Colors.grey,
                  height: size.height * 0.0003,
                  // width: size.width * 0.9,
                )
              ],
            )),
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Paperfinishdetail(),
              ),
            );
          },
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.015,
              ),
              Paperlesswidget(
                size: size,
                status: 5,
                carback: 'assets/icons/carback.png',
                iconPosition1: 'assets/icons/docsimport.png',
                iconPosition2: 'assets/icons/duringprogress.png',
                iconPosition3: 'assets/icons/waitingorderpayment.png',
                iconPosition4: 'assets/icons/redpaper1.png',
                iconPosition5: 'assets/icons/delivery.png',
                cusNo: 'Custom no. A423456',
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Paperfinishdetail(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
