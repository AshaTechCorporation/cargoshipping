import 'package:flutter/material.dart';

class Guidepage extends StatefulWidget {
  const Guidepage({super.key});

  @override
  _GuidepageState createState() => _GuidepageState();
}

class _GuidepageState extends State<Guidepage> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Test',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Container ด้านบน
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: isExpanded ? 0 : 300, // ถ้าขยาย Container บนจะย่อ
            width: size.width,  // เต็มความกว้างหน้าจอ
            color: Colors.blue,  // สีของ Container บน
            child: Center(
              child: Text(
                'Container ด้านบน',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: 10),
          // Container ด้านล่าง
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded; // เปลี่ยนสถานะขยาย/ย่อ
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: isExpanded 
                  ? size.height - kToolbarHeight - MediaQuery.of(context).padding.top - 10 // ความสูงเต็มหน้าจอเมื่อขยาย 
                  : 470, // ถ้ายังไม่ขยาย ให้มีความสูง 470
              width: size.width,  // เต็มความกว้างหน้าจอ
              color: Colors.red,  // สีของ Container ล่าง
              child: Center(
                child: Text(
                  'Container ด้านล่าง',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
