import 'package:cargoshipping/cart/widget/customcheck.dart';
import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class StoreItem extends StatefulWidget {
  StoreItem({
    super.key,
    required this.storeName,
    required this.isSelected,
    required this.onSelectionChanged,
    required this.productItemsSelection,
    required this.onProductSelectionChanged,
    required this.onDeleteStore,
    required this.onDeleteProduct,
    required this.storeItems,
  });

  final String storeName;
  final bool isSelected;
  final ValueChanged<bool?> onSelectionChanged;
  final List<bool> productItemsSelection;
  final void Function(int, bool?) onProductSelectionChanged;
  final VoidCallback onDeleteStore;
  final void Function(int) onDeleteProduct;
  final List<Map<String, dynamic>> storeItems;

  @override
  State<StoreItem> createState() => _StoreItemState();
}

class _StoreItemState extends State<StoreItem> {
  List<int> quantities = []; // สร้างตัวแปรเก็บจำนวนสินค้าแต่ละรายการ
  List<String> dropdownValues = []; // เก็บค่า dropdown ที่เลือกไว้

  @override
  void initState() {
    super.initState();

    // ตรวจสอบให้แน่ใจว่า quantities ตรงกับขนาดของ storeItems
    quantities = List<int>.filled(widget.storeItems.length, 1);

    // ตรวจสอบให้แน่ใจว่า dropdownValues ตรงกับขนาดของ storeItems
    // dropdownValues = widget.storeItems
    //     .map<String>((item) => item['color'][0] as String)
    //     .toList();

    // ตรวจสอบขนาดของ productItemsSelection
    assert(widget.productItemsSelection.length == widget.storeItems.length, 
      'productItemsSelection และ storeItems ควรมีขนาดเท่ากัน');
  }

  void _incrementQuantity(int index) {
    setState(() {
      quantities[index]++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (quantities[index] > 1) {
        quantities[index]--;
      }
    });
  }

  Widget _buildProductItem({
    required String image,
    required String name,
    required String price,
    required int quantity,
    required bool isSelected,
    required ValueChanged<bool?> onSelectionChanged,
    required VoidCallback onDelete,
    required int index,
    //required List<String> colors,
  }) {
    final size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCheckbox(
          value: isSelected,
          onChanged: onSelectionChanged,
        ),
        SizedBox(
          width: size.width * 0.02,
        ),
        // ClipRRect(
        //   borderRadius: BorderRadius.circular(8.0),
        //   child: Image.asset(
        //     image,
        //     width: size.width * 0.2,
        //     height: size.height * 0.1,
        //     fit: BoxFit.cover,
        //   ),
        // ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            image,
            width: size.width * 0.2,
            height: size.height * 0.1,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: size.width * 0.03),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: onDelete,
                    child: Text(
                      'ลบ',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              // Container(
              //   height: size.height * 0.03,
              //   width: size.width * 0.23,
              //   padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
              //   decoration: BoxDecoration(
              //     color: background,
              //     borderRadius: BorderRadius.circular(4.0),
              //   ),
              //   child: DropdownButtonHideUnderline(
              //     child: DropdownButton<String>(
              //       value: dropdownValues[index], // แสดงค่าปัจจุบันของ dropdown
              //       icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
              //       iconSize: 15,
              //       elevation: 16,
              //       style: TextStyle(
              //         color: Colors.black,
              //         fontSize: 12,
              //       ),
              //       onChanged: (String? newValue) {
              //         // เมื่อมีการเลือกค่าใหม่ ให้ใช้ setState เพื่ออัปเดต dropdownValue
              //         setState(() {
              //           dropdownValues[index] = newValue!;
              //         });
              //       },
              //       items: colors.map<DropdownMenuItem<String>>((String value) {
              //         return DropdownMenuItem<String>(
              //           value: value,
              //           child: Text(value),
              //         );
              //       }).toList(),
              //       isDense: true,
              //     ),
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '¥${(double.parse(price.replaceAll('¥', '')) * quantity).toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  _buildQuantitySelector(quantity, index),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuantitySelector(int quantity, int index) {
    return Row(
      children: [
        IconButton(
          onPressed: () => _decrementQuantity(index),
          icon: Image.asset('assets/icons/dec.png'),
        ),
        Text(quantity.toString(), style: TextStyle(fontSize: 12)),
        IconButton(
          onPressed: () => _incrementQuantity(index),
          icon: Image.asset('assets/icons/inc.png'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomCheckbox(
                    value: widget.isSelected,
                    onChanged: widget.onSelectionChanged,
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Text(
                    widget.storeName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: widget.onDeleteStore,
                    child: Text(
                      'ลบ',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(),
              for (int i = 0; i < widget.storeItems.length; i++)
                _buildProductItem(
                  image: 'https:${widget.storeItems[i]['pic_url']}',
                  name: widget.storeItems[i]['title'],
                  price: widget.storeItems[i]['price'],
                  quantity: quantities[i],
                  isSelected: widget.productItemsSelection[i],
                  onSelectionChanged: (isSelected) =>
                      widget.onProductSelectionChanged(i, isSelected),
                  onDelete: () => widget.onDeleteProduct(i),
                  index: i,
                  //colors: List<String>.from(widget.storeItems[i]['color']),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
