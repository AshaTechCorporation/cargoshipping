import 'package:cargoshipping/cart/widget/productitem.dart';
import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class StoreItem extends StatefulWidget {
  final String storeName;
  final bool isSelected;
  final ValueChanged<bool?> onSelectionChanged;

  StoreItem({super.key, 
  required this.storeName,
  required this.isSelected,
  required this.onSelectionChanged,
  });
  @override
  _StoreItemState createState() => _StoreItemState();
}

class _StoreItemState extends State<StoreItem> {
  bool _isStoreSelected = false;
  final List<bool> _productSelection = List.generate(3, (index) => false);

    @override
  void didUpdateWidget(StoreItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected != oldWidget.isSelected) {
      setState(() {
        _isStoreSelected = widget.isSelected;
        _productSelection.fillRange(0, _productSelection.length, _isStoreSelected);
        widget.onSelectionChanged(_isStoreSelected);
      });
    }
  }

  void _updateProductSelection(bool? isSelected) {
    setState(() {
      _isStoreSelected = isSelected ?? false;
      _productSelection.fillRange(0, _productSelection.length, _isStoreSelected);
      widget.onSelectionChanged(_isStoreSelected);
    });
  }

  void _handleProductSelection(int index, bool? isSelected) {
    setState(() {
      _productSelection[index] = isSelected ?? false;
      _isStoreSelected = _productSelection.every((selected) => selected);
      widget.onSelectionChanged(_isStoreSelected); // Notify CartPage
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: _isStoreSelected,
                    onChanged: _updateProductSelection,
                  ),
                  Text(
                    widget.storeName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
        ...List.generate(
          3,
          (i) => ProductItem(
            title: reccomproduct[i],
            price: 20,
            isItemSelected: _productSelection[i],
            onSelectionChanged: (bool? isSelected) =>
                _handleProductSelection(i, isSelected),
          ),
        ),
      ],
    );
  }
}
