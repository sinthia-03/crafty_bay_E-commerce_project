import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(child: Column()),
          Container(
            child: Row(
              children: [
                Column(
                  children: [
                    Text('Total Price'),
                    Text('Total Price')
                  ],
                ),
                SizedBox(
                  width: 140,
                  child: FilledButton(onPressed: (){},
                      child: Text('Checkout')),
                )
              ],
            ),
          )

        ],
      ),

    );
  }
}
