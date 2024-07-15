// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_app/core/extensions/assetss_widgets.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'package:flutter_app/views/pages/payment_method/payment_method_page.dart';
import 'package:flutter_app/views/widgets/main_button.dart';
import 'package:flutter_app/views/widgets/main_text.dart';

class PaymentForm extends StatefulWidget {
  const PaymentForm({super.key});

  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  String _selectedPaymentMethod = 'paypal';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MainText.subPageTitle('إضافة بطاقة جديدة'),
              MainText.subPageTitle(
                'طريقة الدفع',
                color: Colors.black,
              ),
            ],
          ),
          15.hSize,
          Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.primary)
            ),
            child: ListTile(
              title: const Text('PayPal'),
              leading:Image.asset('assets/images/PayPal.png'),
              trailing: Radio<String>(
                value: 'paypal',
                groupValue: _selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    _selectedPaymentMethod = value!;
                  });
                },
              ),
            ),
          ),
          15.hSize,
          Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.primary)
            ),
            child: ListTile(
              title: const Text('مدى'),
              leading:Image.asset('assets/images/مدى.png'),
              trailing: Radio<String>(
                value: 'مدى',
                groupValue: _selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    _selectedPaymentMethod = value!;
                  });
                },
              ),
            ),
          ),
          15.hSize,
          Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.primary)
            ),
            child: ListTile(
              title: const Text('Visa'),
              leading:Image.asset('assets/images/Visa.png'),
              trailing: Radio<String>(
                value: 'Visa',
                groupValue: _selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    _selectedPaymentMethod = value!;
                  });
                },
              ),
            ),
          ),
          30.hSize,
          const Center(
            child: MainText.subPageTitle(
              'الاستمرار عن طريقCredit Card',
              color: Colors.black,
            ),
          ),
          30.hSize,
          Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.primary)
            ),
            child: ListTile(
              title: const Text('Credit Card'),
              leading:Image.asset('assets/images/Mastercard.png'),
              trailing: Radio<String>(
                value: 'Credit Card',
                groupValue: _selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    _selectedPaymentMethod = value!;
                  });
                },
              ),
            ),
          ),
          30.hSize,
          MainButton(
            onPressed: (){
              Navigator.pushNamed(context, PaymentMethodPage.routeName);
            },
            child: const MainText.subPageTitle('التالى',
              color: Colors.white,
              textAlign: TextAlign.center,
            ),

          )
        ],
      ),
    );
  }
}