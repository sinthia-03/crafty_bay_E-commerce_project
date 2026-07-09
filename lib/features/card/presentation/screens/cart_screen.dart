
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/presentation/providers/main_nav_holder_provider.dart';
import '../widget/card_item.dart';
import '../widget/total_price_and_checkout_scetion.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (_,_)=> _backToHome(),
      child: Scaffold(
        appBar: AppBar(title: Text('Cart'),
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
                    itemBuilder: (context, index){
                  return CardItem();
                },
                )
            ),
            TotalPriceAndCheckoutScreen(),
          ],
        ),
      ),
    );
  }

  void _backToHome(){
    context.read<MainNavHolderProvider>().backToHome();
  }
}



