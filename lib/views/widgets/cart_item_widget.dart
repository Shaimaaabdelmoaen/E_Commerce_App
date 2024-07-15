import 'package:flutter/material.dart';
import 'package:flutter_app/core/extensions/assetss_widgets.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'package:flutter_app/providers/cart/cart_provider.dart';
import 'package:flutter_app/views/widgets/main_text.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final double price;
  final int quantity;

  const CartItemWidget({super.key,
    required this.id,
    required this.productId,
    required this.title,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: 4.vhEdge,
          leading: Image.asset('assets/images/milk8.png'),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainText.subPageTitle(title),
              const MainText.title('حليب وأجبان')
            ],
          ),
          subtitle: MainText.body('\$${price.toStringAsFixed(2)}'),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(Icons.close,size: 20,),
              5.hSize,
              Container(
                width: 120,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  color: AppColors.primary,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.add,color: Colors.white,size: 18,),
                      onPressed: () {
                        Provider.of<CartProvider>(context, listen: false)
                            .addItem(productId, title, price);
                      },
                    ),
                    MainText.body('$quantity',color: Colors.white,),
                    IconButton(
                      icon: const Icon(Icons.remove,color: Colors.white,size: 18,),
                      onPressed: () {
                        Provider.of<CartProvider>(context, listen: false)
                            .removeSingleItem(productId);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: 8.hEdge,
          child: const Divider(height: 2,),
        )
      ],
    );
  }
}
