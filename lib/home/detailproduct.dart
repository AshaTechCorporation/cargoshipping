import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cargoshipping/home/services/homeApi.dart';
import 'package:cargoshipping/models/categories.dart';
import 'package:cargoshipping/models/item.dart';
import 'package:cargoshipping/models/itemsearch.dart';
import 'package:cargoshipping/models/itemsearch1688.dart';
import 'package:cargoshipping/models/serviceTransporter.dart';
import 'package:cargoshipping/widgets/LoadingDialog.dart';
import 'package:flutter/material.dart';

class Detailproduct extends StatefulWidget {
  Detailproduct({super.key, required this.categoryProduct, required this.type});
  final String categoryProduct;
  final String type;

  @override
  State<Detailproduct> createState() => _DetailproductState();
}

class _DetailproductState extends State<Detailproduct> {
  List<ItemSearch> item = [];
  List<ItemSearch1688> item1688 = [];
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
      // final _item = await HomeApi.getItemCategories(
      //     categories_name: widget.categories.name ?? '');
      final _item = await HomeApi.getItemSearch(type: widget.type, search: widget.categoryProduct);

      if (!mounted) return;

      setState(() {
        if (widget.type == '1688') {
          item1688 = _item;
        } else {
          item = _item;
        }
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
          widget.categoryProduct,
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
                                leading: item[index].pic_url != null || item[index].pic_url != ''
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
                                          placeholder: (context, url) => CircularProgressIndicator(),
                                          errorWidget: (context, url, error) => Image.asset('assets/images/noimages.jpg'),
                                        ),
                                      )
                                    : Image.asset('assets/images/noimages.jpg'),
                                title: Text('${item[index].title}'),
                                subtitle: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [Text('${item[index].price}'), Text('${item[index].promotion_price}')],
                                ),
                              ),
                            )),
                  ),

            //////////////////////
            item1688.isEmpty
                ? SizedBox()
                : Column(
                    children: List.generate(
                        item1688.length,
                        (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                onTap: () {
                                  //
                                },
                                leading: item1688[index].pic_url != null || item1688[index].pic_url != ''
                                    ? SizedBox(
                                        height: size.height * 0.08,
                                        width: size.width * 0.12,
                                        child: CachedNetworkImage(
                                          imageUrl: "${item1688[index].pic_url}",
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
                                          placeholder: (context, url) => CircularProgressIndicator(),
                                          errorWidget: (context, url, error) => Image.asset('assets/images/noimages.jpg'),
                                        ),
                                      )
                                    : Image.asset('assets/images/noimages.jpg'),
                                title: Text('${item1688[index].title}'),
                                subtitle: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [Text('${item1688[index].price}'), Text('${item1688[index].promotion_price}')],
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
