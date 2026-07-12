import 'package:flutter/material.dart';

class CenterProgressindicator extends StatelessWidget {
  const CenterProgressindicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(),);
  }
}