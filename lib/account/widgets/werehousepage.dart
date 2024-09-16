import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Werehousepage extends StatelessWidget {
  const Werehousepage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'บริการจัดหาโรงงาน',
          style: TextStyle(
              fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: background,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: size.height * 0.9,
                width: size.width * 0.93,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: white,
                  border: Border.all(color: greyuserinfo, width: 0.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text('บริการจัดหาโรงงาน',style: TextStyle(
                      fontSize: 16, color: red1, fontWeight: FontWeight.w600
                    ),),
                    SizedBox(height: size.height *0.01,),
                    Container(
                      height: size.height *0.75,
                      width: size.width * 0.85,
                      decoration: BoxDecoration(
                        color: background
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Content',style: TextStyle(
                            fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    ),
                    SizedBox(
                      height:size.height * 0.04,
                    ),
                    Container(
                      height: size.height * 0.05,
                      width: size.width * 0.85,
                      decoration: BoxDecoration(
                        color: red1,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text('สนใจใช้บริการนี้',style: TextStyle(
                          fontSize: 17,color: white,fontWeight: FontWeight.bold
                        ),),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}