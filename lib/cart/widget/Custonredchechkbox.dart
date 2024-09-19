import 'package:flutter/material.dart';

// Custonredchechkbox Widget
class Customredchechkbox extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onChanged;

  Customredchechkbox({super.key, 
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red, // สีขอบกรอบของ Checkbox
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(4.0), // ขอบโค้งมนของ Checkbox
        ),
        width: 24.0,
        height: 24.0,
        child: isSelected
            ? Icon(
                Icons.check,
                size: 20.0,
                color: Colors.red, // สีของเครื่องหมายถูก
              )
            : null,
      ),
    );
  }
}
