import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  final String title;
  final int price;
  final bool isItemSelected;
  final ValueChanged<bool?> onSelectionChanged;

  const ProductItem({
    super.key,
    required this.title,
    required this.price,
    required this.isItemSelected,
    required this.onSelectionChanged,
  });

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool _isSelected = false;
  int _quantity = 1;

  @override
  void didUpdateWidget(ProductItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isItemSelected != oldWidget.isItemSelected) {
      setState(() {
        _isSelected = widget.isItemSelected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      child: Row(
        children: [
          Checkbox(
            value: _isSelected,
            onChanged: (bool? value) {
              setState(() {
                _isSelected = value ?? false;
                widget.onSelectionChanged(_isSelected);
              });
            },
          ),
          SizedBox(
            width: 75,
            height: 75,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/bear.jpg',
                fit: BoxFit.fill,
                scale: 5.5,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey),
                  width: 200,
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Y ${widget.price * _quantity}'),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (_quantity > 1) {
                                _quantity--;
                              }
                            });
                          },
                        ),
                        Text('$_quantity'),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              _quantity++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
