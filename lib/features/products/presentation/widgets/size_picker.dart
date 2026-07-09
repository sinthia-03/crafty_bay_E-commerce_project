import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.size, required this.onChange});

  final List<String> size;
  final Function(String) onChange;

  @override
  State<SizePicker> createState() => _SizePickerState();
}
class _SizePickerState extends State<SizePicker> {
  String? _selectedSize; //size select

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: widget.size.map((size) {
        return GestureDetector(
          // size select jonno call
          onTap: () {
            _selectedSize = size;
            widget.onChange(size);
            setState(() {});
          },
          child: Container(
            padding: .symmetric(horizontal: 18, vertical: 6),
            decoration: BoxDecoration(
              border: .all(color: Colors.grey),
              borderRadius: .circular(4), // size select
              color: size == _selectedSize ? AppColors.themeColor : null,
            ),
            child: Text(
              size,
              style: TextStyle(
                fontSize: 16,
                color: size == _selectedSize ? Colors.white : null,
                fontWeight: .w500,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
