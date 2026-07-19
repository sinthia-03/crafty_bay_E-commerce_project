import 'package:crafty_bay/features/products/presentation/providers/product_list_provider.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ProductListByCategoryscreen extends StatefulWidget {
  const ProductListByCategoryscreen({super.key, required this.catrgotriId, required this.categoryName});

  static const String name = 'product-list-by-category';

  final String catrgotriId;
  final String categoryName;


  @override
  State<ProductListByCategoryscreen> createState() => _ProductListByCategoryscreenState();


}

class _ProductListByCategoryscreenState extends State<ProductListByCategoryscreen> {

  final ProductListProvider _productListProvider = ProductListProvider();
  final ScrollController _scrollController = ScrollController();

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productListProvider.getProductData();
    _scrollController.addListener(_loadMore);
  }
  void _loadMore(){
    if(_productListProvider.isLoading == false
        && _scrollController.position.extentBefore<300){
      _productListProvider.getProductData();
    }
  }




  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider.value(
      value: _productListProvider,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.categoryName),
        ),
        body: Consumer<ProductListProvider>(
          builder: (context,produtListProvider,_) {
            if(produtListProvider.isInitialLoading){
              return CircularProgressIndicator();
            }
            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    controller:  _scrollController,
                    itemCount:produtListProvider.productList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                      crossAxisSpacing: 8,
                        mainAxisSpacing: 4
                      ),
                      itemBuilder: (context,index){
                      return FittedBox(child: ProductCard(productModel: produtListProvider.productList[index]));
                      }
                  ),
                ),
                if(produtListProvider.isLoadingMore)
                LinearProgressIndicator()
              ],
            );
          }
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }
}
