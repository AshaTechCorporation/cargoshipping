import 'package:cargoshipping/account/services/accountApi.dart';
import 'package:cargoshipping/account/widgets/tagDetailPage.dart';
import 'package:cargoshipping/account/widgets/tagManualPage.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/models/manualtype.dart';
import 'package:cargoshipping/widgets/LoadingDialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Guidepage extends StatefulWidget {
  const Guidepage({super.key});

  @override
  _GuidepageState createState() => _GuidepageState();
}

class _GuidepageState extends State<Guidepage> {
  late PageController _pageController; // ประกาศ late เพื่อระบุว่าจะกำหนดในภายหลัง
  int selectedIndex = 0;
  List<ManualType> manualTyped = [];
  ManualType? manualType;

  @override
  void initState() {
    super.initState();
    // กำหนดค่า PageController ทันทีใน initState ก่อนใช้งาน
    _pageController = PageController(initialPage: selectedIndex);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getlistManualType();
    });
  }

  @override
  void dispose() {
    // อย่าลืมเรียกใช้ dispose เพื่อปิด PageController
    _pageController.dispose();
    super.dispose();
  }

  String formatDateto(DateTime date) {
    var buddhistCalendarYear = date.year + 543; // Convert to Buddhist calendar year
    return DateFormat('dd-MM-yyyy').format(
      DateTime(buddhistCalendarYear, date.month, date.day),
    );
  }

  //ดึงข้อมูล api ManualType
  Future<void> getlistManualType() async {
    try {
      LoadingDialog.open(context);
      final _manualTyped = await AccountApi.getManualType();
      if (!mounted) return;
      setState(() {
        manualTyped = _manualTyped;
      });
      //inspect(categories);
      LoadingDialog.close(context);
      getManualTypeById(manual_id: manualTyped[0].id);
    } on Exception catch (e) {
      if (!mounted) return;
      LoadingDialog.close(context);
      print(e);
    }
  }

  //ดึงข้อมูล api ManualType By ID
  Future<void> getManualTypeById({required int manual_id}) async {
    try {
      //LoadingDialog.open(context);
      final _articleType = await AccountApi.getManualTypeById(manual_id: manual_id);
      if (!mounted) return;        
      setState(() {
        manualType = _articleType;
      });
      //inspect(categories);
      //LoadingDialog.close(context);
    } on Exception catch (e) {
      if (!mounted) return;
      LoadingDialog.close(context);
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text('คู่มือการใช้งาน',style: TextStyle(
          color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17
        ),),
        backgroundColor: background,
      ),
      body: Column(
        children: [

          manualTyped.isEmpty
              ? SizedBox()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03, vertical: size.height * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(manualTyped.length, (index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                      child: _buildTabItem(index, "${manualTyped[index].name}"),
                    )),
                  ),
                ),
          manualTyped.isEmpty
              ? SizedBox()
              : manualType != null
              ?Expanded(
                  child: PageView(
                    controller: _pageController, // ใช้ PageController ที่ถูกกำหนดแล้ว
                    onPageChanged: (index) {
                      setState(() {
                        selectedIndex = index; // อัปเดตเมื่อเปลี่ยนหน้า
                      });
                      getManualTypeById(manual_id: manualTyped[index].id);
                    },
                    children: List.generate(manualTyped.length, (index1) => _buildTagContent(size: size, manualTyped: manualType!)),
                  ),
                ):SizedBox(),

          // ListView.builder(
          //   itemCount: guidelist.length,
          //   itemBuilder: (context, index) {
          //     final item = guidelist[index];
          //     return Padding(
          //       padding: EdgeInsets.symmetric(
          //         horizontal: size.width * 0.03,
          //         vertical: size.height * 0.01,
          //       ),
          //       child: Card(
          //         color: Colors.white,
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(15),
          //         ),
          //         child: Row(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Expanded(
          //               flex: 3,
          //               child: ClipRRect(
          //                 borderRadius: BorderRadius.horizontal(
          //                   left: Radius.circular(10),
          //                 ),
          //                 child: Image.asset(
          //                   item['image'],
          //                   height: size.height * 0.11,
          //                   width: size.height * 0.1,
          //                   fit: BoxFit.fill,
          //                 ),
          //               ),
          //             ),
          //             Expanded(
          //               flex: 10,
          //               child: Padding(
          //                 padding: EdgeInsets.symmetric(
          //                   horizontal: size.width * 0.03,
          //                   vertical: size.height * 0.012,
          //                 ),
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Text(
          //                       item['title'],
          //                       maxLines: 2,
          //                       style: TextStyle(
          //                         fontSize: 15,
          //                         fontWeight: FontWeight.bold,
          //                       ),
          //                     ),
          //                     if (item['subtitle'].isNotEmpty)
          //                       Padding(
          //                         padding: EdgeInsets.only(top: 4.0),
          //                         child: Text(
          //                           item['subtitle'],
          //                           style: TextStyle(
          //                             fontSize: 13,
          //                             color: Colors.grey[600],
          //                           ),
          //                         ),
          //                       ),
          //                     SizedBox(height: 8),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }

  Widget _buildTabItem(int index, String title) {
    final size = MediaQuery.of(context).size;
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          // ใช้ PageController เพื่อเลื่อนไปยังหน้าเมื่อแท็บถูกกด
          _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
        });
      },
      child: Container(
        height: size.height * 0.04,
        width: size.width * 0.29,
        padding: EdgeInsets.symmetric(vertical: size.height * 0.01, horizontal: size.width * 0.01),
        decoration: BoxDecoration(color: isSelected ? red1 : Colors.white, borderRadius: BorderRadius.circular(15.0), boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ]),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : greyuserinfo,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTagContent({required Size size, required ManualType manualTyped}) {
    return ListView(
      padding: EdgeInsets.all(size.height * 0.009),
      children: List.generate(
          manualTyped.manuals!.length,
          (index) => _buildCard(
                size: size,
                imagePath:  '${manualTyped.manuals![index].photo_content_url}',
                title: '${manualTyped.manuals![index].title}',
                date:  '${formatDateto(manualTyped.manuals![index].created_at!)}',
                press: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TagManualPage(manual: manualTyped.manuals![index],)));
                }
              )),
      
    );
  }

  Widget _buildCard({required Size size, required String imagePath, required String title, required String date, required VoidCallback press}) {
    return GestureDetector(
      onTap: press,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
                child: Image.network(
                  imagePath,
                  height: size.height * 0.11,
                  width: size.height * 0.1,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03, vertical: size.height * 0.012),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: size.height * 0.06,
                      width: double.infinity,
                      //color: Colors.amber,
                      child: Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    //SizedBox(height: size.height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          date,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}
