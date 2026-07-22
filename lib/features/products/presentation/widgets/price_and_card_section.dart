import 'package:crafty_bay/features/products/presentation/providers/add_to_cart_provider.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/center_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/constants.dart';

class PriceAndCardSection extends StatefulWidget {
  const PriceAndCardSection({super.key, required this.onTapAddToCart});

  final VoidCallback onTapAddToCart;

  @override
  State<PriceAndCardSection> createState() => _PriceAndCardSectionState();
}

class _PriceAndCardSectionState extends State<PriceAndCardSection> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(16),
      decoration: BoxDecoration(
        borderRadius: .only(topLeft: .circular(8), topRight: .circular(8)),
        color: AppColors.themeColor.withAlpha(30),
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            crossAxisAlignment: .start,
            children: [
              Text('Price', style: TextStyle(fontWeight: .w600)),
              Text(
                '${Constants.taskSign}100',
                style: TextStyle(
                  fontWeight: .w600,
                  fontSize: 18,
                  color: AppColors.themeColor,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 140,
            child: Consumer<AddToCartProvider>(
              builder: (context,addToCartProvider,_) {
                if(addToCartProvider.isLoading){
                  return CenterProgressindicator();
                }
                return FilledButton(onPressed:
                    widget.onTapAddToCart, child: Text('Add to cart'));
              }
            ),
          ),
        ],
      ),
    );
  }
}
