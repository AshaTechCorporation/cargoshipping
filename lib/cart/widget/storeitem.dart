import 'package:flutter/material.dart';

class StoreItem extends StatelessWidget {
  const StoreItem({
    super.key,
    required this.storeName,
    required this.isSelected,
    required this.onSelectionChanged,
    required this.productItemsSelection,
    required this.onProductSelectionChanged,
    required this.onDeleteStore,
    required this.onDeleteProduct,
  });

  final String storeName;
  final bool isSelected;
  final ValueChanged<bool?> onSelectionChanged;
  final List<bool> productItemsSelection;
  final void Function(int, bool?) onProductSelectionChanged;
  final VoidCallback onDeleteStore;
  final void Function(int) onDeleteProduct;

  Widget _buildProductItem({
    required String image,
    required String name,
    required String price,
    required String quantity,
    required bool isSelected,
    required ValueChanged<bool?> onSelectionChanged,
    required VoidCallback onDelete,
    String dropdownValue = 'สีขาวมุก', // ค่าเริ่มต้นของ Dropdown
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: isSelected,
            onChanged: onSelectionChanged,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              image,
              width: 80,
              height: 100,
              fit: BoxFit.fitHeight,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: onDelete,
                      child: const Text(
                        'ลบ',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                // เรียง name, dropdown และ price ในแนวตั้ง
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 20,  // ลดขนาดของไอคอน
                          elevation: 16,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,  // ลดขนาดฟอนต์ของ Dropdown
                          ),
                          onChanged: (String? newValue) {
                            // อัปเดตค่า dropdownValue เมื่อมีการเปลี่ยนแปลง
                          },
                          items: <String>['สีขาวมุก', 'สีแดง', 'สีน้ำเงิน', 'สีเขียว']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          isDense: true,  // ลดความสูงของ DropdownButton
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    _buildQuantitySelector(quantity),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantitySelector(String quantity) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Image.asset('assets/icons/dec.png'),
        ),
        Text(quantity, style: const TextStyle(fontSize: 14)),
        IconButton(
          onPressed: () {},
          icon: Image.asset('assets/icons/inc.png'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isSelected,
                    onChanged: onSelectionChanged,
                  ),
                  Text(
                    storeName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: onDeleteStore,
                    child: const Text(
                      'ลบ',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(),
              for (int i = 0; i < productItemsSelection.length; i++)
                _buildProductItem(
                  image: 'assets/images/shelf.png',
                  name: 'ชั้นวางพลาสติกในครัว, ชั้นวางของในห้องน้ำ...',
                  price: '¥4.88',
                  quantity: '50',
                  isSelected: productItemsSelection[i],
                  onSelectionChanged: (isSelected) =>
                      onProductSelectionChanged(i, isSelected),
                  onDelete: () => onDeleteProduct(i),
                  dropdownValue: i == 0 ? 'สีขาวมุก' : 'สีแดง',
                ),
            ],
          ),
        ),
      ),
    );
  }
}
