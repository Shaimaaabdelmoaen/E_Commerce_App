import 'package:flutter/material.dart';
import 'package:flutter_app/core/extensions/assetss_widgets.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'package:flutter_app/views/pages/payment_method/payment_method_page.dart';
import 'package:flutter_app/views/widgets/cart_item_widget.dart';
import 'package:flutter_app/views/widgets/main_appbar.dart';
import 'package:flutter_app/views/widgets/main_button.dart';
import 'package:flutter_app/views/widgets/main_text.dart';
import 'package:flutter_app/views/widgets/select_widget.dart';


class PaymentConfirmationPage extends StatefulWidget{

  static const routeName='PaymentConfirmationPage';

  const PaymentConfirmationPage({super.key});

  @override
  State<PaymentConfirmationPage> createState() => _PaymentConfirmationPageState();
}

class _PaymentConfirmationPageState extends State<PaymentConfirmationPage> {
  String? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: Padding(
        padding: 15.vhEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: MainText.pageTitle('الدفع',color: AppColors.secondary,)),
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
            10.hSize,
            const MainText.subPageTitle('معلومات الشراء',),
            10.hSize,
            Container(
              width: double.infinity,
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xffcdccdc),
              ),
              child:  CustomSelectorWidget<String>(
                borderColor: const Color(0xffcdccdc),
                items: const ['مصر', 'الفيوم', 'اخرى'],
                hintImage: Image.asset('assets/images/Visa.png'),
                currentValue: selectedGender,
                hint: '2143***************',
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
              ),
            ),
            20.hSize,
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.primary)
              ),
              child:  const Center(
                child: MainText.subPageTitle(
                    'العنوان : المنصورة شارع محمد خالد',
                  textAlign: TextAlign.start,
                ),
              )
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
                Navigator.pushNamed(context, PaymentMethodPage.routeName);
              },
              child: const MainText.subPageTitle('تأكيد الدفع',
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
    );
  }
}