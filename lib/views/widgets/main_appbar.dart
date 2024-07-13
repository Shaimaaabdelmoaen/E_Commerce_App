import 'package:flutter/material.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'package:flutter_app/views/pages/shopping_card/shopping_card_page.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

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
           icon: const Icon(Icons.notifications)
       ),
       IconButton(
           onPressed: (){},
           icon: const Icon(Icons.favorite_border)
       ),
       IconButton(
           onPressed: (){
             Navigator.pushNamed(context, ShoppingCardPage.routeName);
           },
           icon: const Icon(Icons.shopping_cart),
       ),
     ],
   );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}