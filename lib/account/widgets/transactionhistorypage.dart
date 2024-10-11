import 'package:cargoshipping/account/widgets/Refund.dart';
import 'package:cargoshipping/account/widgets/accumulatedpoints.dart';
import 'package:cargoshipping/account/widgets/statement.dart';
import 'package:cargoshipping/account/widgets/topuphis.dart';
import 'package:cargoshipping/account/widgets/withdrown.dart';
import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Transactionhistorypage extends StatefulWidget {
  const Transactionhistorypage({super.key});

  @override
  State<Transactionhistorypage> createState() => _TransactionhistorypageState();
}

class _TransactionhistorypageState extends State<Transactionhistorypage>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  late PageController _pageController;


  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text(
          'ประวัติธุรกรรม',
          style: TextStyle(
              fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
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
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.01,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: AnimatedBuilder(
              animation: _pageController,
              builder: (context, _) {
                return Row(
                  children: [
                    buildTabItem(0, 'ประวัติการเติมเงิน'),
                    buildTabItem(1, 'ประวัติการถอนเงิน'),
                    buildTabItem(2, 'รายการเดินบัญชี'),
                    buildTabItem(3, 'ใบแจ้งยอดการคืนเงิน'),
                    buildTabItem(4, 'รายการคะแนนสะสม'),
                  ],
                );
              },
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              children: [
                Topuphis(),
                Withdrown(),
                Statement(),
                Refund(),
                Accumulatedpoints(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTabItem(int index, String title) {
    final size = MediaQuery.of(context).size;
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(index,
            duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: size.height * 0.01),
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.008),
        decoration: BoxDecoration(
          color: isSelected ? red1 : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: greymess),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : headingtext,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
