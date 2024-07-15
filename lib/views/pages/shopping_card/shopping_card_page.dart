import 'package:flutter/material.dart';
import 'package:flutter_app/core/extensions/assetss_widgets.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'package:flutter_app/views/pages/payment_ways/payment_ways_page.dart';
import 'package:flutter_app/views/widgets/cart_item_widget.dart';
import 'package:flutter_app/views/widgets/main_appbar.dart';
import 'package:flutter_app/views/widgets/main_button.dart';
import 'package:flutter_app/views/widgets/main_text.dart';
import 'package:flutter_app/views/widgets/main_textfield.dart';
import 'package:flutter_app/views/widgets/select_widget.dart';


class ShoppingCardPage extends StatefulWidget{

  static const routeName='ShoppingCardPage';

  const ShoppingCardPage({super.key});

  @override
  State<ShoppingCardPage> createState() => _ShoppingCardPageState();
}

class _ShoppingCardPageState extends State<ShoppingCardPage> {
  String? selectedGender;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: const MainAppBar(),
     body: Padding(
       padding: 15.vhEdge,
       child: Center(
         child: Column(
           children: [
             const MainText.pageTitle('سلة المشتريات',color: AppColors.secondary,),
             const MainTextField(
               hint: 'بحث',
               prefixIcon: Icon(Icons.search),
             ),
             10.hSize,
             Expanded(
               child: ListView.builder(
                 itemCount:3,
                 itemBuilder: (ctx, i) => const CartItemWidget(
                   id: '5',
                   productId: '88',
                   title: 'المراعى',
                   price: 55,
                   quantity: 3,
                 ),

               ),
             ),
             20.hSize,
             CustomSelectorWidget<String>(
               items: const ['مصر', 'الفيوم', 'اخرى'],
               currentValue: selectedGender,
               hint: 'العنوان',
               hintColor: AppColors.primary,
               fontSize: 20,
               onChanged: (newValue) {
                 setState(() {
                   selectedGender = newValue;
                 });
               },
               validator: (value) {
                 if (value == null || value.isEmpty) {
                   return 'Please select your gender';
                 }
                 return null;
               },
               fillColor: Colors.white,
             ),
           20.hSize,
           Container(
             decoration: BoxDecoration(
               boxShadow: [
                 BoxShadow(
                   color: Colors.grey.withOpacity(0.5),
                   spreadRadius: 2,
                   blurRadius: 5,
                   offset: const Offset(0, 3),
                 ),
               ],
             ),
             child: Container(
               width: 500,
               height: 50,
               color: Colors.white,
               child: Padding(
                 padding: 10.aEdge,
                 child: const Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     MainText.subPageTitle('الإجمالي'),
                     MainText.subPageTitle('200'),
                   ],
                 ),
               ),
             ),
           ),
             20.hSize,
         Container(
           decoration: BoxDecoration(
             boxShadow: [
               BoxShadow(
                 color: Colors.grey.withOpacity(0.5),
                 spreadRadius: 2,
                 blurRadius: 5,
                 offset: const Offset(0, 3),
               ),
             ],
           ),
           child: Container(
             width: 500,
             height: 50,
             color: Colors.white,
             child: Padding(
               padding: 10.aEdge,
               child: const Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   MainText.subPageTitle('حالة الدفع'),
                   MainText.subPageTitle('أجل 30 يوم'),
                 ],
               ),
             ),
           ),
         ),
             20.hSize,
              MainButton(
               onPressed: (){
                 Navigator.pushNamed(context, PaymentWaysPage.routeName);
               },
               child: const MainText.subPageTitle('الدفع',
                 color: Colors.white,
                 textAlign: TextAlign.center,)
               ,)

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