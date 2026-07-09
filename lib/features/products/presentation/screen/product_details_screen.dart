import 'package:crafty_bay/features/products/presentation/widgets/color_picker.dart';
import 'package:crafty_bay/features/products/presentation/widgets/price_and_card_section.dart';
import 'package:crafty_bay/features/products/presentation/widgets/product_image_carousel.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/inc_dec_button.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../widgets/size_picker.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  static const String name = '/product-details';
  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text('product details')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImageCarousel(),
                  Padding(
                    padding: .symmetric(horizontal: 14),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Adidas Sneaker New Edition 2026 Black',
                                style: textTheme.titleMedium?.copyWith(
                                  fontSize: 18,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 90,
                              child: IncDecButton(
                                maxCount: 20,
                                minCount: 1,
                                initalValue: 1,
                                onChange: (newValue) {},
                              ),
                            ),
                          ],
                        ),
                        Wrap(
                          spacing: 8,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Wrap(
                              spacing: 4,
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 20),
                                Text('4.5'),
                              ],
                            ),
              
                            TextButton(onPressed: () {}, child: Text('Review')),
                            Container(
                              padding: .all(2),
                              decoration: BoxDecoration(
                                borderRadius: .circular(4),
                                color: AppColors.themeColor,
                              ),
                              child: Icon(
                                Icons.favorite_outline,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
              
                        _sectionHeader('Color'),
                        const SizedBox(height: 12),
                        ColorPicker(
                          colors: ['Red', 'Yellow', 'white', 'Black'],
                          onChange: (String seletedColor) {
                            print(seletedColor);
                          },
                        ),
                        const SizedBox(height: 8),
                        _sectionHeader('Size'),
                        const SizedBox(height: 12),
                        SizePicker(
                          size: ['s', 'M', 'L', 'XL'],
                          onChange: (String seletedColor) {
                            print(seletedColor);
                          },
                        ),
                        const SizedBox(height: 16),
                        _sectionHeader('Description'),
                        const SizedBox(height: 12,),
                        Text(
                          '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when designers at Letraset and James Mosley, the librarian at St Bride Printing Library in London, took a 1914 Cicero translation and scrambled it to make dummy tex''',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16,),
                ],
              ),
            ),
          ),
          PriceAndCardSection(),
        ],
      ),
    );
  }

  Widget _sectionHeader(String header) {
    return Text(
      header,
      style: TextStyle(color: Colors.black54, fontSize: 18, fontWeight: .w600),
    );
  }
}
