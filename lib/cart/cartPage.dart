import 'package:cargoshipping/cart/widget/storeitem.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('สินค้าในรถเข็น'),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: size.height * 0.02,
            ),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_rounded,
                  size: 30,
                  color: Colors.red,
                )),
          )
        ],
      ),
      body: ListView(
        children: [
          StoreItem(storeName: 'MakeMixue.store'),
          StoreItem(storeName: 'MakeMixue.store2'),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('ทั้งหมด'),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('สั่งซื้อสินค้า'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class StoreItem extends StatelessWidget {
//   final String storeName;

//   StoreItem({required this.storeName});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             storeName,
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//         ),
//         for (int i = 0; i < 3; i++) ProductItem(),
//       ],
//     );
//   }
// }

// class ProductItem extends StatefulWidget {
//   @override
//   _ProductItemState createState() => _ProductItemState();
// }

// class _ProductItemState extends State<ProductItem> {
//   bool _isSelected = false;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(8.0),
//       decoration: BoxDecoration(
//         border: Border(
//           bottom: BorderSide(color: Colors.grey[300]!),
//         ),
//       ),
//       child: Row(
//         children: [
//           Checkbox(
//             value: _isSelected,
//             onChanged: (bool? value) {
//               setState(() {
//                 _isSelected = value ?? false;
//               });
//             },
//           ),
//           Placeholder(
//               fallbackHeight: 60, fallbackWidth: 60), // Placeholder for image
//           SizedBox(width: 10),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('ตุ๊กตาหมี สีน้ำตาล ผูกโบว์'),
//                 Text('ตัวเดียว'),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('Y 20'),
//                     Row(
//                       children: [
//                         IconButton(
//                           icon: Icon(Icons.remove),
//                           onPressed: () {},
//                         ),
//                         Text('1'),
//                         IconButton(
//                           icon: Icon(Icons.add),
//                           onPressed: () {},
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
