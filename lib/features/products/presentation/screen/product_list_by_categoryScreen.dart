import 'package:flutter/material.dart';
class ProductListByCategoryscreen extends StatefulWidget {
  const ProductListByCategoryscreen({super.key, required this.catrgotriId, required this.categoryName});

  static const String name = 'product-list-by-category';

  final String catrgotriId;
  final String categoryName;


  @override
  State<ProductListByCategoryscreen> createState() => _ProductListByCategoryscreenState();
}

class _ProductListByCategoryscreenState extends State<ProductListByCategoryscreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),

    );
  }
}
