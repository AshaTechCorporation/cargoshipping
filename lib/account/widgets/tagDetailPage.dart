import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/models/article.dart';
import 'package:flutter/material.dart';

class TagDetailPage extends StatefulWidget {
  TagDetailPage({super.key, required this.article});

  final Article article;

  @override
  State<TagDetailPage> createState() => _TagDetailPageState();
}

class _TagDetailPageState extends State<TagDetailPage> {
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
          '${widget.article.title}',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), // ขอบมน
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0), // ขอบมนให้เหมือนกับ Container
                  child: Image.network(
                    '${widget.article.photo_content_url}',
                    fit: BoxFit.fill, // ให้ภาพครอบคลุมพื้นที่ทั้งหมด
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0, left: 8.0),
                child: Text(
                  '${widget.article.title}',
                  style: TextStyle(
                    fontSize: 20,
                    color: red1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  '${widget.article.content}',
                  style: TextStyle(color: headingtext, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
