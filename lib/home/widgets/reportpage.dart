import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/services/homeApi.dart';
import 'package:cargoshipping/home/widgets/historydetail.dart';
import 'package:cargoshipping/home/widgets/problemcard.dart';
import 'package:cargoshipping/home/widgets/reportformpage.dart';
import 'package:cargoshipping/models/problemtype.dart';
import 'package:cargoshipping/models/reportproblems.dart';
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
  List<ReportProblems> reportHistory = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getProblem();
      await getReportHistory();
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

  // ฟังก์ชันดึงข้อมูล report
  Future<void> getReportHistory() async {
    try {
      LoadingDialog.open(context);
      final _reportHistory =
          await HomeApi.getReport(); // ใช้ฟังก์ชัน getReport()
      if (!mounted) return;

      setState(() {
        reportHistory = _reportHistory;
      });
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
                ? Column(
                    children: [
                      problem.isNotEmpty
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.04),
                              child: Column(
                                  children: List.generate(
                                problem.length,
                                (index) => GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ReportFormPage(
                                          problemType: problem[index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 6.0),
                                    elevation: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(16.0),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color:
                                                pinkmess, // คุณสามารถใช้สี youngpink ตามที่คุณต้องการ
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/icons/bills.png',
                                                width: 24,
                                                height: 24,
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                problem[index].title,
                                                style: const TextStyle(
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
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                          child: problem[index]
                                                  .problem_bodies!
                                                  .isNotEmpty
                                              ? Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: List.generate(
                                                      problem[index]
                                                          .problem_bodies!
                                                          .length,
                                                      (index1) => Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    bottom:
                                                                        4.0),
                                                            child: Text(
                                                              '• ${problem[index].problem_bodies![index1].body}',
                                                              style: const TextStyle(
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          )))
                                              : SizedBox(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                            )
                          : SizedBox(),
                      // _buildNewProblemTab(),
                    ],
                  )
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
      shrinkWrap: true,
      padding: const EdgeInsets.all(16.0),
      children: problemData.map((problem) {
        return ProblemCardPage(
          imagePath: problem['imagePath'],
          title: problem['title'],
          options: List<String>.from(problem['options']),
        );
      }).toList(),
    );
  }
//   Widget _buildNewProblemTab() {
//   return ListView(
//     padding: const EdgeInsets.all(16.0),
//     children: problemData.map((problemDataItem) {
//       // แปลงเป็น ProblemType
//       final problem = ProblemType.fromJson(problemDataItem);

//       // สร้าง List<String> สำหรับ options จาก problem_bodies
//       List<String> options = problem.problem_bodies?.map((body) => body.body).toList() ?? [];

//       return ProblemCardPage(
//         imagePath: problemDataItem['imagePath'], // ถ้าต้องการใช้ imagePath
//         title: problem.title, // ใช้ title จาก ProblemType
//         options: options, // ใช้ options ที่ได้จาก problem_bodies
//       );
//     }).toList(),
//   );
// }

  Widget _buildHistoryTab() {
    // Tab ประวัติการแก้ไขปัญหา
    return ListView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: reportHistory.length,
      itemBuilder: (context, index) {
        final report = reportHistory[index];
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
                        report.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'แจ้งเมื่อ ${report.createdAt.day} ${report.createdAt.month} ${report.createdAt.year} (${report.createdAt.hour}:${report.createdAt.minute} น.)',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'แก้ไขเสร็จเมื่อ ${report.updatedAt.day} ${report.updatedAt.month} ${report.updatedAt.year} (${report.updatedAt.hour}:${report.updatedAt.minute} น.)',
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
