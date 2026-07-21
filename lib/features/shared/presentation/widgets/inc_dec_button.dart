import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class IncDecButton extends StatefulWidget {
  const IncDecButton({
    super.key,
    required this.maxCount,
    required this.minCount,
    required this.initalValue,
    required this.onChange,
  });
  final int maxCount;
  final int minCount;
  final int initalValue;
  final Function(int) onChange;

  @override
  State<IncDecButton> createState() => _IncDecButtonState();
}

class _IncDecButtonState extends State<IncDecButton> {
  late int _counter = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _counter = widget.initalValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        _iconbutton(Icons.remove, () {
          if (_counter > widget.maxCount) {
            _counter--;
            widget.onChange(_counter);
            setState(() {});
          }
        }, _counter <= widget.minCount),
        const SizedBox(width: 8),
        Text('$_counter', style: TextStyle(fontSize: 24)),
        _iconbutton(Icons.add, () {
          if (_counter < widget.minCount) {
            _counter++;
            widget.onChange(_counter);
            setState(() {});
          }
        }, _counter >= widget.maxCount),
      ],
    );
  }

  Widget _iconbutton(IconData icon, VoidCallback onTap, bool disable) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: .all(4),
        decoration: BoxDecoration(
          color: disable ? Colors.grey : AppColors.themeColor,
          borderRadius: .circular(4),
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
}
