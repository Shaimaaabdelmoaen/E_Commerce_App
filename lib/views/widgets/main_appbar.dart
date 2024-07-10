import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'package:flutter_app/views/pages/shopping_card/shopping_card_page.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
   return AppBar(
     backgroundColor: AppColors.primary,
     leading: Image.asset(
         'assets/images/appbar_logo.png'
     ),
     actions: [
       IconButton(
           onPressed: (){},
           icon: Icon(Icons.notifications)
       ),
       IconButton(
           onPressed: (){},
           icon: Icon(Icons.favorite_border)
       ),
       IconButton(
           onPressed: (){
             Navigator.pushNamed(context, ShoppingCardPage.routeName);
           },
           icon: Icon(Icons.shopping_cart),
       ),
     ],
   );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}