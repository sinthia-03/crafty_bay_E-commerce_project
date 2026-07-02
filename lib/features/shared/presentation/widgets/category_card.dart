import 'package:crafty_bay/features/products/presentation/screen/product_list_by_categoryScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // category
      onTap: (){
        Navigator.pushNamed(context, ProductListByCategoryscreen.name, arguments: {
          'categoryId': 'ffggh-sjdfhf-dd',
          'categoryName': 'Electronics',
        });
      },
      child: Column(
        children: [
          Container(
            padding: .all(8),
            decoration: BoxDecoration(
              color: AppColors.themeColor.withAlpha(20),
              borderRadius: .circular(8),
            )
            ,child: Icon(Icons.computer,size: 48,color: AppColors.themeColor),
          ),
          const SizedBox(height: 4),
          Text('Eelectronic',style: TextStyle(
              fontWeight: .w500,
              color: AppColors.themeColor
          ),)],
      ),
    );
  }
}