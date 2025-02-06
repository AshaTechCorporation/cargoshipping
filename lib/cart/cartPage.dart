import 'dart:convert';
import 'dart:developer';

import 'package:cargoshipping/Itempage/confirmorderpage.dart';
import 'package:cargoshipping/cart/widget/customcheck.dart';
import 'package:cargoshipping/cart/widget/storeitem.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/models/itemmodel/item_model.dart';
import 'package:cargoshipping/objectbox.g.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late final Store store;
  late final Box<JsonData> jsonBox;
  List<Map<String, dynamic>> itemCart = [];
  List<bool> _storeItemsSelection = [];
  List<List<bool>> _productItemsSelection = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await initObjectBox();
    });
  }

  @override
  void dispose() {
    store.close();
    super.dispose();
  }

  Future<void> initObjectBox() async {
    store = await openStore();
    jsonBox = store.box<JsonData>(); // เปิด Box สำหรับ Map
    getAllJsonData();
  }

  void getAllJsonData() {
    final allData = jsonBox.getAll(); // ดึงข้อมูลทั้งหมดจาก ObjectBox
    itemCart.clear(); // ล้างข้อมูลเก่าก่อนเพิ่มข้อมูลใหม่

    for (var data in allData) {
      if (data is JsonData) {
        // แปลง List<String> jsonList เป็น List<Map<String, dynamic>>
        List<Map<String, dynamic>> decodedList = data.jsonList.map((jsonStr) {
          return jsonDecode(jsonStr) as Map<String, dynamic>;
        }).toList();

        // แปลง List<String> jsonList เป็น List<Map<String, dynamic>>
        List<Map<String, dynamic>> decodedListProduct = data.jsonProduct.map((jsonStr) {
          return jsonDecode(jsonStr) as Map<String, dynamic>;
        }).toList();

        // จัดรูปแบบข้อมูลให้ตรงกับที่ต้องการ
        Map<String, dynamic> formattedData = {
          "type": data.type,
          "categoryName": data.categoryName,
          "jsonList": decodedList, // เก็บเป็น List ของ Map
          "jsonProduct": decodedListProduct, // เก็บเป็น List ของ Map
        };

        itemCart.add(formattedData);
      }
    }
    setState(() {
      if (itemCart.isNotEmpty) {
        _storeItemsSelection = List.generate(itemCart.length, (_) => false);
        _productItemsSelection = itemCart.map((store) => List<bool>.filled(store['jsonList'].length, false)).toList();
      }
    });

    print("✅ ข้อมูลทั้งหมดใน itemCart:");
    print(jsonEncode(itemCart)); // แสดงผลให้อยู่ในรูป JSON
  }

  bool _isSelected = false;
  // final List<bool> _storeItemsSelection = List.generate(cart.length, (_) => false);
  // late final List<List<bool>> _productItemsSelection = cart.map((store) => List<bool>.filled(store['storeItems'].length, false)).toList();

  void _selectAll(bool? value) {
    setState(() {
      _isSelected = value ?? false;
      _storeItemsSelection.fillRange(0, _storeItemsSelection.length, _isSelected);
      for (int i = 0; i < _productItemsSelection.length; i++) {
        _productItemsSelection[i].fillRange(0, _productItemsSelection[i].length, _isSelected);
      }
    });
  }

  void _updateStoreSelection(int index, bool? value) {
    setState(() {
      _storeItemsSelection[index] = value ?? false;
      _productItemsSelection[index].fillRange(0, _productItemsSelection[index].length, _storeItemsSelection[index]);
      _isSelected = _storeItemsSelection.every((selected) => selected);
    });
  }

  void _updateProductSelection(int storeIndex, int productIndex, bool? value) {
    setState(() {
      _productItemsSelection[storeIndex][productIndex] = value ?? false;
      _storeItemsSelection[storeIndex] = !_productItemsSelection[storeIndex].contains(false);
      _isSelected = _storeItemsSelection.every((selected) => selected);
    });
  }

  void _deleteProduct(int storeIndex, int productIndex) {
    setState(() {
      // ทำสำเนาของรายการ storeItems ที่สามารถแก้ไขได้
      cart[storeIndex]['storeItems'] = List<Map<String, dynamic>>.from(cart[storeIndex]['storeItems']);

      cart[storeIndex]['storeItems'].removeAt(productIndex);

      if (cart[storeIndex]['storeItems'].isEmpty) {
        _deleteStore(storeIndex);
      } else {
        _storeItemsSelection[storeIndex] = !_productItemsSelection[storeIndex].contains(false);
        _isSelected = _storeItemsSelection.every((selected) => selected);
      }
    });
  }

  void _deleteStore(int storeIndex) {
    setState(() {
      // ทำสำเนาของรายการหลักที่สามารถแก้ไขได้
      cart = List<Map<String, dynamic>>.from(cart);

      cart.removeAt(storeIndex);
      _storeItemsSelection.removeAt(storeIndex);
      _productItemsSelection.removeAt(storeIndex);
      _isSelected = _storeItemsSelection.every((selected) => selected);
    });
  }

  Widget _buildCheckbox(String label, bool value, ValueChanged<bool?> onChanged) {
    final size = MediaQuery.of(context).size;

    return Row(
      children: [
        CustomCheckbox(
          value: value,
          onChanged: onChanged,
        ),
        SizedBox(width: size.width * 0.02),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.075,
      child: BottomAppBar(
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildCheckbox('ทั้งหมด', _isSelected, _selectAll),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Confirmorderpage()),
                // );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: red1,
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                  vertical: size.height * 0.007,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'สั่งซื้อสินค้า',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: backgroundColor,
          ),
        ),
        title: const Text(
          'รถเข็น',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 17),
        ),
      ),
      body: itemCart.isEmpty
          ? SizedBox()
          : ListView.builder(
              itemCount: itemCart.length,
              itemBuilder: (context, index) {
                return StoreItem(
                  storeName: itemCart[index]['categoryName'],
                  isSelected: _storeItemsSelection[index],
                  onSelectionChanged: (isSelected) => _updateStoreSelection(index, isSelected),
                  productItemsSelection: _productItemsSelection[index],
                  onProductSelectionChanged: (productIndex, isSelected) => _updateProductSelection(index, productIndex, isSelected),
                  onDeleteStore: () => _deleteStore(index),
                  onDeleteProduct: (productIndex) => _deleteProduct(index, productIndex),
                  storeItems: itemCart[index]['jsonList'],
                );
              },
            ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }
}
