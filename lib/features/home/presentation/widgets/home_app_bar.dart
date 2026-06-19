import 'package:crafty_bay/features/home/presentation/widgets/circle_icon_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/asset_paths.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SvgPicture.asset(AssetPaths.navLogoSvg),
      actions: [
        CircleiconButton(icon: Icons.person, onTap: () {}),
        const SizedBox(width: 8),
       CircleiconButton(icon: Icons.call, onTap: () {}),
        const SizedBox(width: 8),
        CircleiconButton(
          icon: Icons.notifications_active_outlined,
          onTap: () {},
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}