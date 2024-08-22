import 'package:cargoshipping/home/widgets/ProductCategories.dart';
import 'package:cargoshipping/models/categories.dart';
import 'package:flutter/material.dart';

class Detailproduct extends StatefulWidget {
  const Detailproduct({super.key, required this.categories});
  final Categories categories;

  @override
  State<Detailproduct> createState() => _DetailproductState();
}

class _DetailproductState extends State<Detailproduct> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categories.name ?? ''),
      ),
      body: Column(
        children: [
          Wrap(
              children: List.generate(
                  widget.categories.subcategories?.length ?? 0,
                  (index) => Column(
                        children: [
                          Text(widget.categories.subcategories?[index].name ??
                              ''),
                          Wrap(
                            children: List.generate(
                                widget.categories.subcategories?[index].items
                                        ?.length ??
                                    0,
                                (index2) => Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(widget
                                              .categories
                                              .subcategories?[index]
                                              .items?[index2] ??
                                          ''),
                                    )),
                          )
                        ],
                      )
                  //  ProductCategories(
                  //   size: size,
                  //   title: widget.productid.subcategories?[index].name ?? '',
                  //   press: () {},
                  //   imagespath: 'assets/images/noimages.jpg',
                  // ),
                  ))
        ],
      ),
    );
  }
}
