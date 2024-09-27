import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/services/homeApi.dart';
import 'package:cargoshipping/home/widgets/historydetail.dart';
import 'package:cargoshipping/home/widgets/problemcard.dart';
import 'package:cargoshipping/models/problemtype.dart';
import 'package:cargoshipping/widgets/LoadingDialog.dart';
import 'package:flutter/material.dart';

class ReportProblemPage extends StatefulWidget {
  const ReportProblemPage({super.key});

  @override
  _ReportProblemPageState createState() => _ReportProblemPageState();
}

class _ReportProblemPageState extends State<ReportProblemPage> {
  int _selectedChoice = 0;
  List<ProblemType> problem = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getProblem();
    });
  }

  //ดึงข้อมูล api problem
  Future<void> getProblem() async {
    try {
      LoadingDialog.open(context);
      final _problem = await HomeApi.getProblem();
      if (!mounted) return;

      setState(() {
        problem = _problem;
      });
      //inspect(problem);
      LoadingDialog.close(context);
    } on Exception catch (e) {
      if (!mounted) return;
      LoadingDialog.close(context);
      print(e);
    }
  }



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
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
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
      padding: const EdgeInsets.all(16.0),
      children: problemData.map((problem) {
        // แทนที่การเรียก _buildProblemCard ด้วยการสร้าง ProblemCardPage
        return ProblemCardPage(
          imagePath: problem['imagePath'],
          title: problem['title'],
          options: List<String>.from(problem['options']),
        );
      }).toList(),
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
            elevation: 2,
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
