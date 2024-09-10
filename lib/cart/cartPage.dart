import 'package:cargoshipping/cart/widget/customcheck.dart';
import 'package:cargoshipping/cart/widget/storeitem.dart';
import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool _isSelected = false;
  final List<bool> _storeItemsSelection = [false, false];
  final List<String> _storeNames = ['1688严选店', '1688严选店2'];
  final List<List<bool>> _productItemsSelection = [
    [false, false],
    [false, false]
  ]; // บันทึกการเลือกสินค้าแต่ละตัว

  void _selectAll(bool? value) {
    setState(() {
      _isSelected = value ?? false;
      _storeItemsSelection.fillRange(
          0, _storeItemsSelection.length, _isSelected);
      for (int i = 0; i < _productItemsSelection.length; i++) {
        _productItemsSelection[i]
            .fillRange(0, _productItemsSelection[i].length, _isSelected);
      }
    });
  }

  void _updateStoreSelection(int index, bool? value) {
    setState(() {
      _storeItemsSelection[index] = value ?? false;
      _productItemsSelection[index].fillRange(
          0, _productItemsSelection[index].length, _storeItemsSelection[index]);
      _isSelected = _storeItemsSelection.every((selected) => selected);
    });
  }

  void _updateProductSelection(int storeIndex, int productIndex, bool? value) {
    setState(() {
      _productItemsSelection[storeIndex][productIndex] = value ?? false;
      // Update store selection based on product selections
      _storeItemsSelection[storeIndex] =
          !_productItemsSelection[storeIndex].contains(false);
      _isSelected = _storeItemsSelection.every((selected) => selected);
    });
  }

  void _deleteStore(int storeIndex) {
    setState(() {
      _storeNames.removeAt(storeIndex);
      _storeItemsSelection.removeAt(storeIndex);
      _productItemsSelection.removeAt(storeIndex);
      _isSelected = _storeItemsSelection.every((selected) => selected);
    });
  }

  void _deleteProduct(int storeIndex, int productIndex) {
    setState(() {
      _productItemsSelection[storeIndex].removeAt(productIndex);
      if (_productItemsSelection[storeIndex].isEmpty) {
        _deleteStore(storeIndex);
      } else {
        _storeItemsSelection[storeIndex] =
            !_productItemsSelection[storeIndex].contains(false);
        _isSelected = _storeItemsSelection.every((selected) => selected);
      }
    });
  }

  Widget _buildCheckbox(
      String label, bool value, ValueChanged<bool?> onChanged) {
    return Row(
      children: [
        CustomCheckbox(
          // ใช้ CustomCheckbox ที่คุณสร้างขึ้น
          value: value,
          onChanged: onChanged,
        ),
        const SizedBox(width: 8), // เพิ่มช่องว่างระหว่าง checkbox และ label
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
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
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: red1,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), 
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
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: const Text(
          'รถเข็น',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _storeItemsSelection.length,
        itemBuilder: (context, index) {
          return StoreItem(
            storeName: _storeNames[index],
            isSelected: _storeItemsSelection[index],
            onSelectionChanged: (isSelected) =>
                _updateStoreSelection(index, isSelected),
            productItemsSelection: _productItemsSelection[index],
            onProductSelectionChanged: (productIndex, isSelected) =>
                _updateProductSelection(index, productIndex, isSelected),
            onDeleteStore: () => _deleteStore(index),
            onDeleteProduct: (productIndex) =>
                _deleteProduct(index, productIndex),
          );
        },
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }
}
