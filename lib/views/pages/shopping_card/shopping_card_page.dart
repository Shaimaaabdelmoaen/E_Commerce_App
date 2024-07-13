import 'package:flutter/material.dart';
import 'package:flutter_app/core/extensions/assetss_widgets.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'package:flutter_app/views/widgets/cart_item_widget.dart';
import 'package:flutter_app/views/widgets/main_appbar.dart';
import 'package:flutter_app/views/widgets/main_button.dart';
import 'package:flutter_app/views/widgets/main_text.dart';
import 'package:flutter_app/views/widgets/main_textfield.dart';


class ShoppingCardPage extends StatelessWidget{
  static const routeName='ShoppingCardPage';

  const ShoppingCardPage({super.key});
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: const MainAppBar(),
     body: Padding(
       padding: 5.aEdge,
       child: Center(
         child: Column(
           children: [
             const MainText.pageTitle('سلة المشتريات',color: AppColors.secondary,),
             const MainTextField(
               hint: 'بحث',
               prefixIcon: Icon(Icons.search),
             ),
             20.hSize,
             Expanded(
               child: ListView.builder(
                 itemCount: 3,
                 itemBuilder: (ctx, i) => const CartItemWidget(
                   id: '5',
                   productId: '88',
                   title: 'المراعى',
                   price: 55,
                   quantity: 88,
                 ),

               ),
             ),
           Padding(
             padding: 8.aEdge,
             child: Container(
               decoration: BoxDecoration(
                 boxShadow: [
                   BoxShadow(
                     color: Colors.grey.withOpacity(0.5),  // Shadow color
                     spreadRadius: 2,  // Spread radius
                     blurRadius: 5,  // Blur radius
                     offset: const Offset(0, 3),  // Offset from the container
                   ),
                 ],
               ),
               child: Container(
                 width: double.infinity,
                 height: 50,
                 color: Colors.white,
                 child: const Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     MainText.subPageTitle('الإجمالي'),
                     Padding(
                       padding: EdgeInsets.all(8.0),
                       child: MainText.subPageTitle('200'),
                     ),
                   ],
                 ),
               ),
             ),
           ),
         Padding(
           padding: const EdgeInsets.all(5.0),
           child: Container(
             decoration: BoxDecoration(
               boxShadow: [
                 BoxShadow(
                   color: Colors.grey.withOpacity(0.5),  // Shadow color
                   spreadRadius: 2,  // Spread radius
                   blurRadius: 5,  // Blur radius
                   offset: const Offset(0, 3),  // Offset from the container
                 ),
               ],
             ),
             child: Padding(
               padding: const EdgeInsets.only(bottom: 10.0),
               child: Container(
                 width: double.infinity,
                 height: 50,
                 color: Colors.white,
                 child: const Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     MainText.subPageTitle('حالة الدفع'),
                     Padding(
                       padding: EdgeInsets.all(8.0),
                       child: MainText.subPageTitle('أجل 30 يوم'),
                     ),
                   ],
                 ),
               ),
             ),
           ),
         ),
             const MainButton(
               child: MainText.subPageTitle('الدفع',
                 color: Colors.white,
                 textAlign: TextAlign.center,),)

         /*Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (ctx, i) => CartItemWidget(
                id: cart.values.toList()[i].id,
                productId: cart.keys.toList()[i],
                title: cart.values.toList()[i].title,
                price: cart.values.toList()[i].price,
                quantity: cart.values.toList()[i].quantity,
              ),
            ),
          ),*/
           ],
         ),
       ),
     ),
   );
  }

}