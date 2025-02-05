import 'package:cached_network_image/cached_network_image.dart';
import 'package:cargoshipping/Itempage/itempage.dart';
import 'package:cargoshipping/cart/cartPage.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/services/homeApi.dart';
import 'package:cargoshipping/models/categories.dart';
import 'package:cargoshipping/models/item.dart';
import 'package:cargoshipping/models/itemsearch.dart';
import 'package:cargoshipping/models/itemsearch1688.dart';
import 'package:cargoshipping/models/serviceTransporter.dart';
import 'package:cargoshipping/widgets/LoadingDialog.dart';
import 'package:flutter/material.dart';

class Allproduct extends StatefulWidget {
  @override
  _AllproductState createState() => _AllproductState();
}

class _AllproductState extends State<Allproduct> with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  final List<String> items = [
    'taobao',
    '1688',
  ];
  List<Categories> categories = [];
  List<ItemSearch> item = [];
  List<ItemSearch1688> item1688 = [];
  List<ServiceTransporter> categoryProduct = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getlistCategories(name: items[0]);
    });
  }

  void onTabTapped({required int index, required String name}) {
    setState(() {
      selectedIndex = index;
    });
    getlistCategoriesByName(categories_name: name);
  }

  //ดึงข้อมูล api Category
  Future<void> getlistCategories({required String name}) async {
    try {
      LoadingDialog.open(context);
      //final _categories = await HomeApi.getCategories(name: name);
      final _categoryProduct = await HomeApi.getCategoryProduct();
      if (!mounted) return;
      setState(() {
        //categories = _categories;
        categoryProduct = _categoryProduct;
      });
      getlistCategoriesByName(categories_name: categoryProduct[0].taobao!);
      //inspect(categories);
      LoadingDialog.close(context);
    } on Exception catch (e) {
      if (!mounted) return;
      LoadingDialog.close(context);
      print(e);
    }
  }

  //ดูข้อมูลสินค้าตาม Category Name
  Future<void> getlistCategoriesByName({required String categories_name}) async {
    try {
      LoadingDialog.open(context);
      // final _item = await HomeApi.getItemCategories(categories_name: categories_name);
      final _item = await HomeApi.getItemSearch(search: categories_name, type: items[0]);

      if (!mounted) return;

      setState(() {
        item = _item;
      });
      //inspect(item);
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
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: Text(
          'หมวดหมู่สินค้าทั้งหมด',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            height: size.height * 0.90,
            //color: Colors.red,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   width: size.width * 0.29,
                //   color: Colors.white,
                //   child: ListView(
                //     children: [
                //       _buildTabItem('เสื้อผ้า', 'assets/icons/clothmock.png', 0),
                //       _buildTabItem('เครื่องประดับ', 'assets/icons/bagmock.png', 1),
                //       _buildTabItem('อุปกรณ์กีฬา', 'assets/icons/bagmock.png', 2),
                //       _buildTabItem('สินค้าคู่เด็ก', 'assets/icons/bagmock.png', 3),
                //     ],
                //   ),
                // )
                categoryProduct.isNotEmpty
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              width: size.width * 0.29,
                              color: Colors.white,
                              child: ListView(
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                children: List.generate(
                                  categoryProduct.length,
                                  (index) => _buildTabItem('${categoryProduct[index].name}', '${categoryProduct[index].image}', index, '${categoryProduct[index].taobao}'),
                                  //_buildTabItem('${categoryProduct[index].name}', 'assets/images/noimages.jpg', index, '${categoryProduct[index].taobao}'),
                                ),
                              ),
                            ),
                            SizedBox(
                              // height: size.height * 0.025,
                              height: size.height * 0.12,
                            ),
                          ],
                        ),
                      )
                    : SizedBox(),
                categoryProduct.isNotEmpty
                    ? Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IndexedStack(
                            index: selectedIndex,
                            children: List.generate(
                              categoryProduct.length,
                              (index) => SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    item.isNotEmpty
                                        ? ListView(
                                            shrinkWrap: true,
                                            physics: ClampingScrollPhysics(),
                                            //children: List.generate(item.length, (index1)=> _buildSection(title: categories[index].name!, items: item)),
                                            children: [
                                              _buildSection(title: categoryProduct[index].name!, items: item),
                                            ],
                                          )
                                        : SizedBox(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),

                // Main Content for each tab
                // Expanded(
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: IndexedStack(
                //       index: selectedIndex,
                //       children: [
                //         _buildClothingSection(),
                //         Center(child: Text('เครื่องประดับ')),
                //         Center(child: Text('อุปกรณ์กีฬา')),
                //         Center(child: Text('สินค้าคู่เด็ก')),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, String imagePath, int index, String search) {
    bool isSelected = selectedIndex == index;
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => onTabTapped(index: index, name: search),
      child: Container(
        height: size.height * 0.17,
        child: Stack(
          children: [
            if (!isSelected)
              Positioned.fill(
                child: Container(
                  color: Colors.white,
                ),
              ),
            if (isSelected)
              Positioned.fill(
                child: Container(
                  color: background,
                ),
              ),
            if (isSelected)
              Positioned(
                left: 0,
                right: MediaQuery.of(context).size.width * (101 / 400),
                bottom: 0,
                top: 0,
                child: FractionallySizedBox(
                  widthFactor: 0.2,
                  child: Container(
                    color: red1,
                  ),
                ),
              ),
            Positioned.fill(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Column(
                  children: [
                    imagePath != null || imagePath != ''
                        ? CachedNetworkImage(
                            imageUrl: "${imagePath}",
                            fit: BoxFit.fill,
                            placeholder: (context, url) => SizedBox(
                                height: size.height * 0.001,
                                width: size.width * 0.001,
                                child: CircularProgressIndicator(
                                  strokeWidth: 1,
                                )),
                            errorWidget: (context, url, error) => Image.asset(
                              'assets/images/noimages.jpg',
                              fit: BoxFit.fill,
                            ),
                          )
                        : Image.asset(
                            imagePath,
                            width: 40,
                            height: 40,
                            fit: BoxFit.fill,
                          ),
                    SizedBox(height: 8),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
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

  Widget _buildSection({required String title, required List<ItemSearch> items}) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
      child: GestureDetector(
        child: Container(
          padding: EdgeInsets.all(size.height * 0.01),
          margin: EdgeInsets.only(left: size.width * 0.01),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.02),
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                mainAxisSpacing: 15,
                crossAxisSpacing: 5,
                physics: NeverScrollableScrollPhysics(),
                children: items.map((item) {
                  return GestureDetector(
                    onTap: () {
                      print(item.title);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Itempage(
                                    size: size,
                                    title: title,
                                    price: 4.88,
                                    press: () {},
                                    products: listProducts[0],
                                    num_iid: item.num_iid!,
                                    type: 'taobao',
                                  )));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        item.pic_url != null || item.pic_url != ''
                            ? SizedBox(
                                height: size.height * 0.063,
                                width: size.width * 0.9,
                                child: CachedNetworkImage(
                                  imageUrl: "${item.pic_url}",
                                  fit: BoxFit.fill,
                                  placeholder: (context, url) => SizedBox(
                                      height: size.height * 0.001,
                                      width: size.width * 0.001,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 1,
                                      )),
                                  errorWidget: (context, url, error) => Image.asset(
                                    'assets/images/noimages.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              )
                            : Image.asset(
                                'assets/images/noimages.jpg',
                                fit: BoxFit.fill,
                              ),
                        // แสดงภาพจาก assets
                        // Image.network(
                        //   item.pic_url!,
                        //   width: size.width * 0.9,
                        //   height: size.height * 0.063,
                        //   fit: BoxFit.fill,
                        // ),
                        SizedBox(height: size.height * 0.006),
                        Text(
                          '${item.title! ?? ''}',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildClothingSection() {
  //   return ListView(
  //     children: listallProducts.map((section) {
  //       return _buildSection(
  //         section['category'],
  //         section['products'],
  //       );
  //     }).toList(),
  //   );
  // }

  // Widget _buildSection(String title, List<Map<String, String>> items) {
  //   final size = MediaQuery.of(context).size;
  //   return Padding(
  //     padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
  //     child: Container(
  //       padding: EdgeInsets.all(size.height * 0.01),
  //       margin: EdgeInsets.only(left: size.width * 0.01),
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(12.0),
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.black12,
  //             blurRadius: 6.0,
  //             offset: Offset(0, 2),
  //           ),
  //         ],
  //       ),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             title,
  //             style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
  //           ),
  //           SizedBox(height: size.height * 0.02),
  //           GridView.count(
  //             crossAxisCount: 3,
  //             shrinkWrap: true,
  //             mainAxisSpacing: 5,
  //             crossAxisSpacing: 5,
  //             physics: NeverScrollableScrollPhysics(),
  //             children: items.map((item) {
  //               return Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   // แสดงภาพจาก assets
  //                   Image.asset(
  //                     item['image']!,
  //                     width: size.width * 0.9,
  //                     height: size.height * 0.063,
  //                   ),
  //                   SizedBox(height: size.height * 0.006),
  //                   Text(
  //                     item['name']!,
  //                     style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
  //                     textAlign: TextAlign.center,
  //                   ),
  //                 ],
  //               );
  //             }).toList(),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
