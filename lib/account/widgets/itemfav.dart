import 'package:cargoshipping/cart/widget/customcheck.dart';
import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Itemfav extends StatefulWidget {
  const Itemfav({super.key});

  @override
  State<Itemfav> createState() => _ItemfavState();
}

class _ItemfavState extends State<Itemfav> {
  // เก็บสถานะการเลือกของแต่ละร้านค้าและสินค้าภายในร้านค้า
  List<bool> storeSelections = [false];
  late List<List<bool>> storeItemSelections;

  @override
  void initState() {
    super.initState();

    // Initialize selections to match the size of itemfav
    storeSelections = List.generate(itemfav.length, (_) => false);
    storeItemSelections = itemfav
        .map<List<bool>>(
            (store) => List.generate(store['storeItems'].length, (_) => false))
        .toList();
  }

  void _selectStore(int storeIndex, bool? isSelected) {
    setState(() {
      storeSelections[storeIndex] = isSelected ?? false;
      for (int i = 0; i < storeItemSelections[storeIndex].length; i++) {
        storeItemSelections[storeIndex][i] = storeSelections[storeIndex];
      }
    });
  }

  void _selectStoreItem(int storeIndex, int itemIndex, bool? isSelected) {
    setState(() {
      storeItemSelections[storeIndex][itemIndex] = isSelected ?? false;
      storeSelections[storeIndex] =
          storeItemSelections[storeIndex].every((item) => item);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: const Text(
          'รายการโปรด',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: itemfav.length,
        itemBuilder: (context, storeIndex) {
          final store = itemfav[storeIndex];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomCheckbox(
                          value: storeSelections[storeIndex],
                          onChanged: (isSelected) =>
                              _selectStore(storeIndex, isSelected),
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Text(
                          store['storeName'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'ลบ',
                            style: TextStyle(color: greyuserinfo),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    ...List.generate(
                      store['storeItems'].length,
                      (itemIndex) => Column(
                        children: [
                          _buildProductItem(
                            context,
                            storeIndex,
                            itemIndex,
                            store['storeItems'][itemIndex],
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          width: size.width,
          height: size.height * 0.8,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: red1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {
              // เพิ่มสินค้าที่เลือกไปยังรถเข็น
            },
            child: const Text(
              'เพิ่มสินค้าที่เลือกไปยังรถเข็น',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, int storeIndex, int itemIndex,
      Map<String, dynamic> item) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        CustomCheckbox(
          value: storeItemSelections[storeIndex][itemIndex],
          onChanged: (isSelected) =>
              _selectStoreItem(storeIndex, itemIndex, isSelected),
        ),
        SizedBox(
          width: size.width * 0.03,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            item['imageAssetPath'],
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: size.width * 0.03,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item['name'],
                style: const TextStyle(fontSize: 14),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              const Text(
                '¥4.88',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width * 0.03,
        ),
        Column(
          children: [
            const Text(
              'ลบ',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Image.asset(
              'assets/icons/shoppingbutton.png',
              width: size.width * 0.12,
              height: size.height * 0.044,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ],
    );
  }
}
