import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/home/presentation/screens/home_screen.dart';
import 'package:crafty_bay/features/shared/presentation/presentation/providers/main_nav_holder_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainNaviHolderScreen extends StatefulWidget {
  const MainNaviHolderScreen({super.key});

  static const String name = '/main-navi-holder-screen';

  @override
  State<MainNaviHolderScreen> createState() => _MainNaviHolderScreenState();
}

class _MainNaviHolderScreenState extends State<MainNaviHolderScreen> {

  final List<Widget> _screens = [
    HomeScreen(),
  HomeScreen(),
  HomeScreen(),
  HomeScreen()

  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainNavHolderProvider>(
      builder: (context, mainNameHolderProvider, _) {
        return Scaffold(
          body: _screens[mainNameHolderProvider.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: mainNameHolderProvider.currentIndex,
            unselectedItemColor: Colors.grey,
            selectedItemColor: AppColors.themeColor,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: mainNameHolderProvider.changeIndex, // method signature

            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket_outlined),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline),
                label: 'Wishlist',
              ),
            ],
          ),
        );
      },
    );
  }
}
