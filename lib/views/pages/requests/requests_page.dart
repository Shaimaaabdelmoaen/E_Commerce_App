import 'package:flutter/material.dart';
import 'package:flutter_app/core/extensions/assetss_widgets.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'package:flutter_app/views/widgets/cart_item_widget.dart';
import 'package:flutter_app/views/widgets/main_appbar.dart';
import 'package:flutter_app/views/widgets/main_button.dart';
import 'package:flutter_app/views/widgets/main_text.dart';


class RequestsPage extends StatefulWidget{
  static const routeName='RequestsPage';

  const RequestsPage({super.key});

  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  String? selectedAddress;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: Padding(
        padding: 5.aEdge,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(child: MainText.pageTitle('الدفع',color: AppColors.secondary,)),
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
              18.hSize,
              const MainText.subPageTitle('معلومات الشراء',),
              18.hSize,
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: 'اختيار العنوان',
                  hintStyle: TextStyle(color: AppColors.primary.withOpacity(.6)),
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.primary),
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
                padding: 5.aEdge,
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
                    padding: 10.aEdge,
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      color: Colors.white,
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const MainText.subPageTitle('حالة الدفع'),
                          Padding(
                            padding: 8.aEdge,
                            child: const MainText.subPageTitle('أجل 30 يوم'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
               MainButton(
                onPressed: (){
                },
                child: const MainText.subPageTitle('الدفع',
                color: Colors.white,
                textAlign: TextAlign.center,
                ),

              )

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