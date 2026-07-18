import 'package:crafty_bay/features/category/data/model/category_model.dart';
import 'package:crafty_bay/features/products/presentation/screen/product_list_by_categoryScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key, required this.categoryModel,
  });
  final CategoryModel categoryModel;


  @override
  Widget build(BuildContext context) {
    return GestureDetector( // category
      onTap: (){
        Navigator.pushNamed(context, ProductListByCategoryscreen.name, arguments: {
          'categoryId': categoryModel.id,
          'categoryName': categoryModel.title,
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
            ,child: Image.network(categoryModel.icon, width: 40 ,height: 48,
            errorBuilder:(_, _, _) {
              return Icon(Icons.error_outline,size: 48,color: Colors.grey);
            },)
          ),
          const SizedBox(height: 4),
          Text(categoryModel.title,style: TextStyle(
              fontWeight: .w500,
              color: AppColors.themeColor
          ),)],
      ),
    );
  }
}