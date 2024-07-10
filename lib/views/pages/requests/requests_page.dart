import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'package:flutter_app/providers/app_provider.dart';
import 'package:flutter_app/providers/cart_provider.dart';
import 'package:flutter_app/views/widgets/cart_item_widget.dart';
import 'package:flutter_app/views/widgets/main_appbar.dart';
import 'package:flutter_app/views/widgets/main_button.dart';
import 'package:flutter_app/views/widgets/main_spaces.dart';
import 'package:flutter_app/views/widgets/main_text.dart';
import 'package:flutter_app/views/widgets/main_textfield.dart';


class RequestsPage extends StatefulWidget{
  static const routeName='RequestsPage';

  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  String? selectedAddress;
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cart = cartProvider.cart;
    return Scaffold(
      appBar: MainAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: MainText.pageTitle('الدفع',color: AppColors.secondary,)),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (ctx, i) => CartItemWidget(
                    id: '5',
                    productId: '88',
                    title: 'المراعى',
                    price: 55,
                    quantity: 88,
                  ),

                ),
              ),
              MainSpaces.medium(),
              MainText.subPageTitle('معلومات الشراء',),
              MainSpaces.small(),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: 'اختيار العنوان',
                  hintStyle: TextStyle(color: AppColors.primary.withOpacity(.6)),
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                value: selectedAddress,
                items: ['مصر', 'الفيوم', 'Other'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedAddress = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your gender';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),  // Shadow color
                        spreadRadius: 2,  // Spread radius
                        blurRadius: 5,  // Blur radius
                        offset: Offset(0, 3),  // Offset from the container
                      ),
                    ],
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MainText.subPageTitle('الإجمالي'),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
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
                        offset: Offset(0, 3),  // Offset from the container
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MainText.subPageTitle('حالة الدفع'),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MainText.subPageTitle('أجل 30 يوم'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              MainButton(
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