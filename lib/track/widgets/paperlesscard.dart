import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/track/widgets/detailpaper.dart';
import 'package:cargoshipping/track/widgets/paperlesswidget.dart';
import 'package:flutter/material.dart';

class Paperlesscard extends StatefulWidget {
  const Paperlesscard({super.key});

  @override
  State<Paperlesscard> createState() => _PaperlesscardState();
}

class _PaperlesscardState extends State<Paperlesscard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: white,
        title: Text(
          'นำเข้าเอกสาร',
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
                builder: (context) => Detailpaper(),
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
                status: 1,
                carback: 'assets/icons/carback.png',
                iconPosition1: 'assets/icons/docsimport.png',
                iconPosition2: 'assets/icons/greywait.png',
                iconPosition3: 'assets/icons/icon_grayb3.png',
                iconPosition4: 'assets/icons/paperprocess.png',
                iconPosition5: 'assets/icons/correctgrey.png',
                cusNo: 'Order no. A423456',
                press: () {
                  print('click press');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
