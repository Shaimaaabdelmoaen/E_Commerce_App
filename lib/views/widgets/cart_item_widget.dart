import 'package:flutter/material.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'package:flutter_app/providers/cart_provider.dart';
import 'package:flutter_app/views/widgets/main_text.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final double price;
  final int quantity;

  CartItemWidget({
    required this.id,
    required this.productId,
    required this.title,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset('assets/images/pasta2.png'),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainText.subPageTitle(title),
            MainText.title('حليب وأجبان')
          ],
        ),
        subtitle: MainText.body('\$${price.toStringAsFixed(2)}'),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(Icons.close,size: 20,),
            Container(
              width: 120,
              height: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                color: AppColors.primary,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.add,color: Colors.white,),
                    onPressed: () {
                      Provider.of<CartProvider>(context, listen: false)
                          .addItem(productId, title, price);
                    },
                  ),
                  MainText.body('$quantity',color: Colors.white,),
                  IconButton(
                    icon: Icon(Icons.remove,color: Colors.white,),
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
    );
  }
}
