import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapTest extends StatefulWidget {
  const MapTest({super.key});

  @override
  State<MapTest> createState() => _MapTestState();
}

class _MapTestState extends State<MapTest> {
  late GoogleMapController mapController;
  Set<Marker> markers = Set();

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
          infoWindow: InfoWindow(title: 'ชื่อสถานที่', snippet: 'รายละเอียดเพิ่มเติม'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('ทดสอบ Map', style: TextStyle(color: Colors.black),),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: size.height * 0.72,
            width: double.infinity,
            child: GoogleMap(
              onTap: (argument) {},
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(13.7442, 100.4608),
                zoom: 16,
              ),
              markers: markers,
              onMapCreated: _onMapCreated,
            ),
          ),
        ],
      ),
    );
  }
}
