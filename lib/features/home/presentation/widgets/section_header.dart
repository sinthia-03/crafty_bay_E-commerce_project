import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.headerText, required this.onTapSeeAll,
  });

  final String headerText;
  final VoidCallback onTapSeeAll;

  @override
  Widget build(BuildContext context) {

    final textTheme = TextTheme.of(context);
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(headerText, style: textTheme.titleMedium,),
        TextButton(onPressed: (){},
            child: Text('See All',style: TextStyle(fontWeight: .w600),))
      ],
    );
  }
}