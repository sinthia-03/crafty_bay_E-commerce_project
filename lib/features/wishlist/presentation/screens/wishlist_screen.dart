import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/presentation/presentation/providers/main_nav_holder_provider.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  static const String name = '/wishlist';

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (_, _) => _backToHome(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Wishlist'),
          leading: IconButton(
            onPressed: _backToHome,
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return ;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _backToHome() {
    context.read<MainNavHolderProvider>().backToHome();
  }
}