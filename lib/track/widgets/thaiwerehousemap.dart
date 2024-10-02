import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/message/widgets/customdivider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Thaiwerehousemap extends StatefulWidget {
  const Thaiwerehousemap({super.key});

  @override
  State<Thaiwerehousemap> createState() => _ThaiwerehousemapState();
}

class _ThaiwerehousemapState extends State<Thaiwerehousemap> {
  late GoogleMapController mapController;
  Set<Marker> markers = {};

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
      // เพิ่มปักหมุดที่ตำแหน่งที่กำหนด
      markers.add(
        Marker(
          markerId: MarkerId('SomeId'),
          position: LatLng(13.7442, 100.4608),
          // position:
          //     LatLng(widget.listlocation!.lat!, widget.listlocation!.lon!),
          infoWindow:
              InfoWindow(title: 'ชื่อสถานที่', snippet: 'รายละเอียดเพิ่มเติม'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ข้อมูลการจัดส่ง',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
      // body: Stack(
      //   children: [
      //     SizedBox(
      //       height: size.height * 0.72,
      //       width: double.infinity,
      //       child: GoogleMap(
      //         onTap: (argument) {},
      //         zoomControlsEnabled: false,
      //         mapType: MapType.normal,
      //         initialCameraPosition: CameraPosition(
      //           target: LatLng(13.7442, 100.4608),
      //           zoom: 16,
      //         ),
      //         markers: markers,
      //         onMapCreated: _onMapCreated,
      //       ),
      //     ),
      //   ],
      // ),
      body: Stack(
        children: [
          // แสดงแผนที่ Google Map
          SizedBox(
            height: size.height,
            width: double.infinity,
            child: GoogleMap(
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(22.3193, 114.1694), // ตำแหน่งแสดงในแผนที่
                zoom: 5,
              ),
              markers: markers,
              onMapCreated: _onMapCreated,
            ),
          ),

          // กล่องที่ด้านบนแผนที่ (กล่องโปร่งแสง)
          Positioned(
            // top: size.height * 0.1,
            bottom: size.height * 0.8,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9), // โปร่งแสง
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/maptruck.png',
                        height: size.height * 0.08,
                      ), // รูปรถบรรทุก
                      SizedBox(width: size.width * 0.04),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'สินค้าถึงโกดังไทย',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff004aad)),
                          ),
                          Text(
                            'กำหนดจัดส่งที่ถึงที่หมายใน',
                            style: TextStyle(
                                fontSize: 13,
                                color: headingtext,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '25 ส.ค. - 26 ส.ค.',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: red1),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // กล่องที่อยู่ด้านล่าง
          DraggableScrollableSheet(
              initialChildSize: 0.15,
              minChildSize: 0.15,
              maxChildSize: 0.34,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.01),
                          child: Row(
                            children: [
                              Text('หมายเลขติดตามพัสดุ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13)),
                              Spacer(),
                              Text('TH12345678910',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: headingtext)),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              Text(
                                'คัดลอก',
                                style: TextStyle(
                                    color: Color(0xff004aad),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        CustomDivider(heightFactor: size.height * 0.000001),
                        SizedBox(height: size.height * 0.02),
                        Padding(
                          padding: EdgeInsets.only(left: size.width * 0.01),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '1 ส.ค. 67',
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: headingtext,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '15:34',
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: headingtext,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              Image.asset(
                                'assets/icons/icon_red3.png',
                                height: size.height * 0.04,
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: size.width * 0.1),
                                    child: Text(
                                      'สินค้าถึงโกดังไทย',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: headingtext,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    'กำลังเตรียมจัดส่งพัสดุไปยังที่หมาย',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: headingtext,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: size.height * 0.005),
                        Padding(
                          padding: EdgeInsets.only(left: size.width * 0.19),
                          child: Container(
                            color: red1,
                            height: size.height * 0.02,
                            width: size.width * 0.005,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '31 ก.ค. 67',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: headingtext,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '15:34',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: headingtext,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            SizedBox(
                              width: size.width * 0.03,
                            ),
                            Image.asset(
                              'assets/icons/icon_grayb1.png',
                              height: size.height * 0.04,
                            ),
                            SizedBox(
                              width: size.width * 0.03,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(right: size.width * 0.1),
                                  child: Text(
                                    'สินค้าอยู่ระหว่างการขนส่ง',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: headingtext,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(right: size.width * 0.09),
                                  child: Text(
                                    'สินค้ากำลังเดินทางมาไทย',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: headingtext,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: size.width * 0.19),
                          child: Container(
                            color: red1,
                            height: size.height * 0.02,
                            width: size.width * 0.005,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '31 ก.ค. 67',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: headingtext,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '15:34',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: headingtext,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            SizedBox(
                              width: size.width * 0.025,
                            ),
                            Image.asset(
                              'assets/icons/chiwerehousegrey.png',
                              height: size.height * 0.04,
                            ),
                            SizedBox(
                              width: size.width * 0.03,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(right: size.width * 0.1),
                                  child: Text(
                                    'สินค้าถึงโกดังจีน',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: headingtext,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  'กำลังเตรียมเดินทางมาไทย',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: headingtext,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
