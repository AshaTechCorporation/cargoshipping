import 'package:cargoshipping/cart/widget/storeitem.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool _isSelected = false;
   final List<bool> _storeItemsSelection = [false, false];
   final List<String> _storeNames = ['MakeMixue.store','MakeMixue.store2'];

   void _selectAll(bool? value) {
    setState(() {
      _isSelected = value ?? false;
      _storeItemsSelection.fillRange(0, _storeItemsSelection.length,_isSelected);
    });
  }

  void _updateStoreSelection(int index, bool? value) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _storeItemsSelection[index] = value ?? false;
        _isSelected = _storeItemsSelection.every((selected) => selected);
      });
    });
  }


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
     body: ListView.builder(
        itemCount: _storeItemsSelection.length,
        itemBuilder: (context, index) {
          return StoreItem(
            storeName: _storeNames[index],
            isSelected: _storeItemsSelection[index],
            onSelectionChanged: (isSelected) => _updateStoreSelection(index, isSelected),
          );
        },
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _isSelected,
                      onChanged: _selectAll,
                    ),
                    Text('ทั้งหมด'),
                  ],
                ),
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
