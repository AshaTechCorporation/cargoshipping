import 'package:cargoshipping/cart/widget/Custonredchechkbox.dart';
import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Conditionstransport extends StatefulWidget {
  const Conditionstransport({super.key});

  @override
  State<Conditionstransport> createState() => _ConditionstransportState();
}

class _ConditionstransportState extends State<Conditionstransport> {
  int _selectedOption = -1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'เงื่อนไขการขนส่ง',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 17),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 0.5,
          ),
        ),
        backgroundColor: background,
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height *0.02,
          ),
          _buildCustomCheckboxListTile(
            title: 'ชำระแยกครั้ง',
            subtitle:
                'ครั้งแรกชำระค่าสินค้า และค่าขนส่งในจีน\nครั้งที่สองชำระค่าขนส่งจีน-ไทย และค่าขนส่งในไทย',
            value: 0,
          ),
          SizedBox(height: size.height * 0.01,),
          Container(
            height: size.height * 0.0005,
            color: Colors.grey,
          ),
           SizedBox(height: size.height * 0.01,),
          _buildCustomCheckboxListTile(
            title: 'ชำระครั้งเดียว',
            subtitle: 'เฉพาะสินค้าประเภทเสื้อผ้าเท่านั้น',
            value: 1,
          ),
          SizedBox(height: size.height * 0.01,),
          Container(
            height: size.height * 0.0005,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildCustomCheckboxListTile({required String title, required String subtitle, required int value}) {
    bool isSelected = _selectedOption == value;

    return ListTile(
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
      subtitle: Text(subtitle,style: TextStyle(fontSize: 13,color: headingtext),),
      trailing: Customredchechkbox(
        isSelected: isSelected,
        onChanged: () {
          setState(() {
            _selectedOption = isSelected ? -1 : value;
          });
        },
      ),
    );
  }
}

