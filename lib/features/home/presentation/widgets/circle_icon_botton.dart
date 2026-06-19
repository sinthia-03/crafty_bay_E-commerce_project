import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleiconButton extends StatelessWidget {
  const CircleiconButton({
    super.key, required this.icon, this.onTap,
  });

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius:16,
        backgroundColor: Colors.grey.shade200,
        child: Icon(icon,
          color: Colors.grey.shade500,size: 20,),
      ),
    );
  }
}
