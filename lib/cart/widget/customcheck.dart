import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const CustomCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          color: value ? greymess : greymess, // สีพื้นหลัง
          borderRadius: BorderRadius.circular(6.0), // ขอบมน
          // border: Border.all(
          //   color: Colors.grey.shade400,
          //   width: 1.5,
          // ),
        ),
        child: value
            ?  Icon(
                Icons.check,
                size: 21.0,
                color: red1,
                
              )
            : null,
      ),
    );
  }
}
