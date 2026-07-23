import 'package:crafty_bay/features/shared/presentation/widgets/center_progress_indicator.dart';
import 'package:crafty_bay/features/wishlist/presentation/providers/wish_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../shared/presentation/providers/main_nav_holder_provider.dart';
import '../../../shared/presentation/widgets/product_card.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  static const String name = '/wishlist';

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();

}


class _WishlistScreenState extends State<WishlistScreen> {

 final WishListProvider _wishListProvider = WishListProvider();
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _wishListProvider.getWishlistData();
    _scrollController.addListener(_loadMore);

  }

  void _loadMore(){
    if((_wishListProvider.isLoading == false) &&
        _scrollController.position.extentAfter < 300){
      _wishListProvider.getWishlistData();
    }
  }



  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, _) => _backToHome(),
      child: ChangeNotifierProvider.value(
        value: _wishListProvider,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Wishlist'),
            leading: IconButton(
              onPressed: _backToHome,
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
          body: Consumer<WishListProvider>(
            builder: (context,wishListProvider,_) {
              if(wishListProvider.isInitialLoading){
                return CenterProgressindicator();
              }

              return Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      itemCount: wishListProvider.productList.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 4,
                      ),
                      itemBuilder: (context, index) {
                        return  FittedBox(
                          child: Stack(children: [
                            ProductCard(
                              productModel: wishListProvider
                                  .productList[index]
                                  .productModel,
                            ),
                            Positioned(
                              right: 10,
                              top: 10,
                              child: GestureDetector(
                                onTap: () {
                                  _onTapRemoveItem(
                                    wishListProvider.productList[index].cartId,
                                  );
                                },
                                child: CircleAvatar(
                                  child: Icon(Icons.close_outlined),
                                ),
                              ),
                            ),
                          ]
                          ),
                        );
                      },
                    ),
                  ),
                  if(wishListProvider.isLoadingMore)
                    const LinearProgressIndicator()
                ],
              );
            }
          ),
        ),
      ),
    );
  }


   void _onTapRemoveItem(String itemId){

   }

  void _backToHome() {
    context.read<MainNavHolderProvider>().backToHome();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
_scrollController.dispose();
  }

}