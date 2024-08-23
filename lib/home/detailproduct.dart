import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cargoshipping/home/services/homeApi.dart';
import 'package:cargoshipping/models/categories.dart';
import 'package:cargoshipping/models/item.dart';
import 'package:cargoshipping/widgets/LoadingDialog.dart';
import 'package:flutter/material.dart';

class Detailproduct extends StatefulWidget {
  const Detailproduct({super.key, required this.categories});
  final Categories categories;

  @override
  State<Detailproduct> createState() => _DetailproductState();
}

class _DetailproductState extends State<Detailproduct> {
  List<Item> item = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getlistCategories();
    });
  }

  Future<void> getlistCategories() async {
    try {
      LoadingDialog.open(context);
      final _item = await HomeApi.getItemCategories(
          categories_name: widget.categories.name ?? '');

      if (!mounted) return;

      setState(() {
        item = _item;
      });
      inspect(item);
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categories.name ?? '',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            item.isEmpty
                ? SizedBox()
                : Column(
                    children: List.generate(
                        item.length,
                        (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                onTap: () {
                                  //
                                },
                                leading: item[index].pic_url != null ||
                                        item[index].pic_url != ''
                                    ? SizedBox(
                                        height: size.height * 0.08,
                                        width: size.width * 0.12,
                                        child: CachedNetworkImage(
                                          imageUrl: "${item[index].pic_url}",
                                          fit: BoxFit.cover,
                                          // imageBuilder:
                                          //     (context, imageProvider) =>
                                          //         Container(
                                          //   height: size.height * 0.08,
                                          //   width: size.width * 0.12,
                                          //   decoration: BoxDecoration(
                                          //     image: DecorationImage(
                                          //       image: imageProvider,
                                          //       fit: BoxFit.fill,
                                          //       // colorFilter: ColorFilter.mode(
                                          //       //     Colors.red,
                                          //       //     BlendMode.colorBurn)
                                          //     ),
                                          //   ),
                                          // ),
                                          placeholder: (context, url) =>
                                              CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              Image.asset(
                                                  'assets/images/noimages.jpg'),
                                        ),
                                      )
                                    : Image.asset('assets/images/noimages.jpg'),
                                title: Text('${item[index].title}'),
                                subtitle: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${item[index].price}'),
                                    Text('${item[index].promotion_price}')
                                  ],
                                ),
                              ),
                            )),
                  )
          ],
        ),
      ),
    );
  }
}
