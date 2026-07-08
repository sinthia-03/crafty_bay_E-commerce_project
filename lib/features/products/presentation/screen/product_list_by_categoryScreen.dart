import 'package:crafty_bay/features/shared/presentation/widgets/product_card.dart';
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
      body: GridView.builder(
        itemCount:12 ,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
          crossAxisSpacing: 8,
            mainAxisSpacing: 4
          ),
          itemBuilder: (context,index){
          return FittedBox(child: ProductCard());
          }
      ),
    );
  }
}
