import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/widgets/reportformpage.dart';
import 'package:flutter/material.dart';

class ReportProblemPage extends StatefulWidget {
  @override
  _ReportProblemPageState createState() => _ReportProblemPageState();
}

class _ReportProblemPageState extends State<ReportProblemPage> {
  int _selectedChoice = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String _appBarTitle =
        _selectedChoice == 0 ? 'แจ้งปัญหา' : 'ประวัติการแก้ไขปัญหา';
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: Text(_appBarTitle,style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
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
              color: _selectedChoice == value ? Colors.white : Colors.black,
              fontSize: 13),
        ),
      ),
      selected: _selectedChoice == value,
      selectedColor: red1,
      backgroundColor: white,
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
    return ListView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: 6,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReportFormPage()),
                        );
          },
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  'หัวข้อปัญหา',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHistoryTab() {
    return ListView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: 4,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            print('รายการประวัติ $index กดแล้ว');
          },
          child: Card(
            color: white,
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
                          color: greyuserinfo,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'แก้ไขเสร็จเมื่อ 00 ส.ค. 00 (00:00 น.)',
                        style: TextStyle(
                          color: greyuserinfo,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/icons/rightarrow.png',
                    color: arrowcolor,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
