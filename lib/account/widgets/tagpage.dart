import 'package:cargoshipping/account/services/accountApi.dart';
import 'package:cargoshipping/account/widgets/tagDetailPage.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/models/articletype.dart';
import 'package:cargoshipping/models/newsPaper/newsPaper.dart';
import 'package:cargoshipping/models/newsPaper/newsPaperShow.dart';
import 'package:cargoshipping/models/serviceTransporter.dart';
import 'package:cargoshipping/widgets/LoadingDialog.dart';
import 'package:flutter/material.dart';
import 'package:cargoshipping/extension/dateExtension.dart';
import 'package:intl/intl.dart';

class TagsPage extends StatefulWidget {
  const TagsPage({super.key});

  @override
  _TagsPageState createState() => _TagsPageState();
}

class _TagsPageState extends State<TagsPage> {
  late PageController _pageController; // ประกาศ late เพื่อระบุว่าจะกำหนดในภายหลัง
  int selectedIndex = 0;
  List<NewsPaperShow> articleTyped = [];
  ArticleType? articleType;
  List<NewsPaper> newsPaper = [];

  @override
  void initState() {
    super.initState();
    // กำหนดค่า PageController ทันทีใน initState ก่อนใช้งาน
    _pageController = PageController(initialPage: selectedIndex);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getlistArticleType();
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

  //ดึงข้อมูล api ArticleType
  Future<void> getlistArticleType() async {
    try {
      LoadingDialog.open(context);
      final _articleTyped = await AccountApi.getNewsPaper();
      if (!mounted) return;
      setState(() {
        articleTyped = _articleTyped;
        newsPaper.addAll(_articleTyped[0].news!);
      });
      //inspect(categories);
      LoadingDialog.close(context);
      // getArticleTypeById(article_id: articleTyped[0].id);
    } on Exception catch (e) {
      if (!mounted) return;
      LoadingDialog.close(context);
      print(e);
    }
  }

  //ดึงข้อมูล api ArticleType By ID
  Future<void> getArticleTypeById({required int article_id}) async {
    try {
      //LoadingDialog.open(context);
      final _articleType = await AccountApi.getArticleTypeById(article_id: article_id);
      if (!mounted) return;
      setState(() {
        articleType = _articleType;
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
        backgroundColor: background,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey[300],
            height: size.height * 0.001,
          ),
        ),
        title: Text(
          'บทความ',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          // Padding(
          //   padding: EdgeInsets.symmetric(
          //       horizontal: size.width * 0.03, vertical: size.height * 0.01),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       _buildTabItem(0, "TAG 1"),
          //       _buildTabItem(1, "TAG 2"),
          //       _buildTabItem(2, "TAG 3"),
          //     ],
          //   ),
          // ),
          articleTyped.isEmpty
              ? SizedBox()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03, vertical: size.height * 0.01),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        articleTyped.length,
                        (index) => GestureDetector(
                          onTap: () {
                            LoadingDialog.open(context);
                            setState(() {
                              selectedIndex = index;
                              newsPaper.clear();
                              newsPaper.addAll(articleTyped[index].news!);
                            });
                            Future.delayed(Duration(seconds: 1), () {
                              if (!mounted) return;
                              LoadingDialog.close(context);
                            });
                          },
                          child: Container(
                            height: size.height * 0.05,
                            width: size.width * 0.29,
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            padding: EdgeInsets.symmetric(vertical: size.height * 0.01, horizontal: size.width * 0.01),
                            decoration: BoxDecoration(
                              color: selectedIndex == index ? red1 : Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                articleTyped[index].name ?? '',
                                style: TextStyle(
                                  color: selectedIndex == index ? Colors.white : greyuserinfo,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: List.generate(
                newsPaper.length,
                (index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TagDetailPage(
                                  article: newsPaper[index],
                                )));
                  },
                  child: Container(
                    margin: EdgeInsets.all(4),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: ClipRRect(
                            borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
                            child: Image.network(
                              newsPaper[index].name ?? '',
                              height: size.height * 0.11,
                              width: size.height * 0.1,
                              fit: BoxFit.contain, // ให้ภาพครอบคลุมพื้นที่ทั้งหมด
                              errorBuilder: (context, error, stackTrace) => Image.asset(
                                height: size.height * 0.11,
                                width: size.height * 0.1,
                                'assets/images/logofull.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            // Image.asset(
                            //   'assets/images/logofull.png',
                            //   height: size.height * 0.11,
                            //   width: size.height * 0.1,
                            //   fit: BoxFit.contain,
                            // ),
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
                                    newsPaper[index].name ?? ' - ',
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
                                      DateFormat('dd-MM-yyyy').format(newsPaper[index].created_at!),
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
                ),
              ),
            ),
          )

          // Expanded(
          //   child: PageView(
          //     controller: _pageController, // ใช้ PageController ที่ถูกกำหนดแล้ว
          //     onPageChanged: (index) {
          //       setState(() {
          //         selectedIndex = index; // อัปเดตเมื่อเปลี่ยนหน้า
          //       });
          //     },
          //     children: [
          //       _buildTagContent(size),
          //       _buildTagContent(size),
          //       _buildTagContent(size),
          //     ],
          //   ),
          // ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: size.height * 0.07,
        color: Colors.white,
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(size.height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/redstar.png'),
                SizedBox(
                  width: size.width * 0.04,
                ),
                Text(
                  'ติดตามบทความใหม่ๆ ได้ที่นี่',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.04,
                ),
                Image.asset('assets/images/redstar.png'),
              ],
            ),
          ),
        ),
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
        margin: EdgeInsets.symmetric(horizontal: 4),
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

  Widget _buildTagContent({required Size size, required ArticleType articleType}) {
    return ListView(
      padding: EdgeInsets.all(size.height * 0.009),
      children: List.generate(
          articleType.articles!.length,
          (index) => _buildCard(
              size: size,
              imagePath: '${articleType.articles![index].photo_content_url}',
              title: '${articleType.articles![index].title}',
              date: '${formatDateto(articleType.articles![index].created_at!)}',
              press: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => TagDetailPage(
                //               article: articleType.articles![index],
                //             )));
              })),
      // children: [
      //   _buildCard(
      //     size,
      //     'assets/images/tag1.png',
      //     'THC Charge รู้ไว้ก่อน! ค่าใช้จ่ายเบื้องหลังใบขนสินค้านำเข้า',
      //     '24 กรกฎาคม 2567',
      //   ),
      //   SizedBox(height: 8),
      //   _buildCard(
      //     size,
      //     'assets/images/tag2.png',
      //     '3 เอกสารสำคัญเมื่อใบขนสินค้าจากจีนที่จำเป็นต้องมี',
      //     '24 กรกฎาคม 2567',
      //   ),
      //   SizedBox(height: 8),
      //   _buildCard(
      //     size,
      //     'assets/images/tag3.png',
      //     'สิ่งที่ควรรู้ก่อนสั่งซื้อสินค้าเกี่ยวกับใบขนส่งสินค้า',
      //     '24 กรกฎาคม 2567',
      //   ),
      //   SizedBox(height: 8),
      //   _buildCard(
      //     size,
      //     'assets/images/tag1.png',
      //     'THC Charge รู้ไว้ก่อน! ค่าใช้จ่ายเบื้องหลังใบขนสินค้านำเข้า',
      //     '24 กรกฎาคม 2567',
      //   ),
      //   SizedBox(height: 8),
      //   _buildCard(
      //     size,
      //     'assets/images/tag2.png',
      //     '3 เอกสารสำคัญเมื่อใบขนสินค้าจากจีนที่จำเป็นต้องมี',
      //     '24 กรกฎาคม 2567',
      //   ),
      //   SizedBox(height: 8),
      //   _buildCard(
      //     size,
      //     'assets/images/tag3.png',
      //     'สิ่งที่ควรรู้ก่อนสั่งซื้อสินค้าเกี่ยวกับใบขนส่งสินค้า',
      //     '24 กรกฎาคม 2567',
      //   ),
      // ],
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
