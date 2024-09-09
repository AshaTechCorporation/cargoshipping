import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/widgets/historydetail.dart';
import 'package:cargoshipping/home/widgets/reportformpage.dart';
import 'package:flutter/material.dart';

class ReportProblemPage extends StatefulWidget {
  const ReportProblemPage({super.key});

  @override
  _ReportProblemPageState createState() => _ReportProblemPageState();
}

class _ReportProblemPageState extends State<ReportProblemPage> {
  int _selectedChoice = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String appBarTitle =
        _selectedChoice == 0 ? 'แจ้งปัญหา' : 'ประวัติการแก้ไขปัญหา';

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: Text(
          appBarTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey[300],
            height: size.height * 0.001,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildChoiceChip(size, 'แจ้งปัญหาใหม่', 0),
                _buildChoiceChip(size, 'ประวัติการแก้ไขปัญหา', 1),
              ],
            ),
          ),
          Expanded(
            child: _selectedChoice == 0
                ? _buildNewProblemTab()
                : _buildHistoryTab(),
          ),
        ],
      ),
    );
  }

  Widget _buildChoiceChip(Size size, String label, int value) {
    return ChoiceChip(
      label: Container(
        width: size.width * 0.35,
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
              color: _selectedChoice == value ? Colors.white : greyuserinfo,
              fontSize: 13,
              fontWeight: FontWeight.bold),
        ),
      ),
      selected: _selectedChoice == value,
      selectedColor: red1,
      backgroundColor: Colors.white,
      onSelected: (selected) {
        setState(() {
          _selectedChoice = value;
        });
      },
      showCheckmark: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      side: BorderSide(
        color: Colors.grey,
        width: 0.5,
      ),
    );
  }

  Widget _buildNewProblemTab() {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        _buildProblemCard(
          imagePath: 'assets/icons/bills.png',
          title: 'ติดตามสถานะบิลสั่งซื้อ และสินค้า',
          options: [
            'ติดตามการสั่งซื้อ',
            'ติดตามการจัดส่งสินค้า',
            'ติดตามการรับเงินจากร้านค้า',
            'ตรวจสอบยอดรวมที่ไม่ถูกต้อง',
          ],
        ),
        _buildProblemCard(
          imagePath: 'assets/icons/importproblem.png',
          title: 'ปัญหาด้านการขนส่ง',
          options: [
            'ติดตามการจัดส่งสินค้าในไทย',
            'ขออัปเดตสินค้าไปยังสถานที่จัดส่ง',
            'เปลี่ยนเส้นทางการจัดส่ง',
            'ปัญหาสินค้าหาย / ปริมาณไม่ถูกต้อง',
            'แจ้งสินค้าเสียหายที่เกิดขึ้นในไทย',
          ],
        ),
        _buildProblemCard(
          imagePath: 'assets/icons/moneyproblem.png',
          title: 'ปัญหาด้านการเงิน',
          options: [
            'เพิ่มเงิน / คืนเงิน / ถอนเงิน',
            'ติดตามการรับเงินจากร้านของขวัญ',
            'สอบถามการเปลี่ยนแปลง / ใบกำกับภาษี',
            'ค่าธรรมเนียมที่ไม่ได้ถูกต้อง',
          ],
        ),
      ],
    );
  }

  Widget _buildProblemCard({
    required String imagePath,
    required String title,
    required List<String> options,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ReportFormPage()),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.symmetric(vertical: 8.0),
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: youngpink,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    imagePath,
                    width: 24,
                    height: 24,
                  ),
                  SizedBox(width: 8),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            // Container สำหรับ options
            Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...options.map((option) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        '• $option',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryTab() {
    // Tab ประวัติการแก้ไขปัญหา
    return ListView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: 4,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HistoryDetailPage()),
            );
          },
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '(หัวข้อเรื่อง)',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'แจ้งเมื่อ 00 ส.ค. 00 (00:00 น.)',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'แก้ไขเสร็จเมื่อ 00 ส.ค. 00 (00:00 น.)',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
