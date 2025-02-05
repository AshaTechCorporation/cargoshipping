import 'package:cargoshipping/All_product_categories/widget/product.dart';
import 'package:cargoshipping/Itempage/itempage.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/widgets/OurItem.dart';
import 'package:flutter/material.dart';

class ShoppingCategories extends StatefulWidget {
  @override
  _ShoppingCategoriesState createState() => _ShoppingCategoriesState();
}

class _ShoppingCategoriesState extends State<ShoppingCategories> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: EdgeInsets.only(top: 70),
          //   child: Container(
          //     width: 100,
          //     color: Colors.grey.shade200,
          //     child: ListView(
          //       children: [
          //         ListTile(
          //           title: Text(
          //             'เสื้อ',
          //             style: TextStyle(fontSize: 14),
          //           ),
          //           onTap: () {},
          //         ),
          //         ListTile(
          //           title: Text(
          //             'กางเกง',
          //             style: TextStyle(fontSize: 14),
          //           ),
          //           onTap: () {},
          //         ),
          //         ListTile(
          //           title: Text(
          //             'กระโปรง',
          //             style: TextStyle(fontSize: 14),
          //           ),
          //           onTap: () {},
          //         ),
          //         ListTile(
          //           title: Text(
          //             'เดรส',
          //             style: TextStyle(fontSize: 14),
          //           ),
          //           onTap: () {},
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.red,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CategoryButton(
                            label: 'เสื้อผ้าลดราคา',
                            isSelected: true,
                            onPressed: () {
                              print('เสื้อผ้าลดราคา clicked');
                            },
                          ),
                          CategoryButton(
                            label: 'เสื้อผ้าผู้หญิง',
                            isSelected: false,
                            onPressed: () {
                              print('เสื้อผ้าผู้หญิง clicked');
                            },
                          ),
                          CategoryButton(
                            label: 'ชุดชั้นใน',
                            isSelected: false,
                            onPressed: () {
                              print('ชุดชั้นใน clicked');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(),
                // Expanded(
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
                //     child: GridView.builder(
                //       shrinkWrap: true,
                //       physics: NeverScrollableScrollPhysics(),
                //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //         crossAxisCount: 3,
                //         crossAxisSpacing: 8.0,
                //         mainAxisSpacing: 8.0,
                //       ),
                //       itemCount: 6,
                //       itemBuilder: (context, index) {
                //         return Column(
                //           children: [
                //             Image.network(
                //               'https://via.placeholder.com/50',
                //               width: 50,
                //               height: 50,
                //             ),
                //             Text('ชื่อหมวดหมู่'),
                //           ],
                //         );
                //       },
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    spacing: 70,
                    runSpacing: 70,
                    alignment: WrapAlignment.spaceBetween,
                    children: List.generate(
                        shirtproductimg.length,
                        (index) => Product(
                            size: MediaQuery.of(context).size, 
                            title: shirtproductimg[index]['title'], 
                            press: (){
                  
                            }, 
                            image: shirtproductimg[index]['images'])),
                  ),
                ),
                Padding(
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.02, horizontal: size.width * 0.035),
                child: Row(
                  children: [
                    Expanded(
                      child: RichText(
                          text: TextSpan(
                              text: 'สินค้าแนะนำ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                              children: <TextSpan>[
                            TextSpan(
                              text: ' จาก 1668',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )
                          ])),
                    ),
                  ],
                ),
              ),
              Center(
                child: Wrap(
                  spacing: 15,
                  runSpacing: 10,
                  children: List.generate(
                      listProducts.length,
                      (index) => Ouritem(
                            image: listProducts[index]['image'],
                            sale: listProducts[index]['sale'],
                            send: listProducts[index]['send'],
                            size: MediaQuery.of(context).size,
                            price: listProducts[index]['price'].toString(),
                            detail: listProducts[index]['detail'],
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Itempage(
                                    size: size,
                                    title: listProducts[index]['detail'],
                                    price: (listProducts[index]['price'] as num)
                                        .toDouble(),
                                    products: listProducts[index],
                                    press: () {},
                                    num_iid: '721593979484',
                                    type: 'taobao',
                                    name: 'xxx',
                                  ),
                                ),
                              );
                            },
                          )),
                ),
              ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  CategoryButton({
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor:
              isSelected ? Colors.white : Colors.white, // เปลี่ยนสีตามการเลือก
        ),
      ),
    );
  }
}