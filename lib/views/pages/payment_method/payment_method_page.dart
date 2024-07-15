// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_app/core/extensions/assetss_widgets.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'package:flutter_app/views/pages/payment_confirmation/payment_confirmation_page.dart';
import 'package:flutter_app/views/widgets/main_button.dart';
import 'package:flutter_app/views/widgets/main_text.dart';
import 'package:flutter_app/views/widgets/main_textfield.dart';
import 'package:flutter_app/views/widgets/select_widget.dart';
import 'package:flutter_app/views/widgets/sup_main_appber.dart';

class PaymentMethodPage extends StatefulWidget {
  static const routeName='PaymentMethodPage';

  const PaymentMethodPage({super.key});
  @override
  _PaymentMethodPageState createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  String? selectedGender;
  String _selectedPaymentMethod = 'paypal';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SupMainAppBar(),
       body:Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Center(child: MainText.pageTitle('الدفع',color: AppColors.secondary,)),
                20.hSize,
                const MainText.subPageTitle(
                  'اختر طريقة الدفع',
                  color: Colors.black,
                ),
                25.hSize,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/Visa.png'),
                        10.wSize,
                        Image.asset('assets/images/مدى.png'),
                        10.wSize,
                        Image.asset('assets/images/PayPal.png'),
                      ],
                    ),
                    Radio<String>(
                      value: 'paypal',
                      groupValue: _selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentMethod = value!;
                        });
                      },
                    ),
                  ],
                ),
                15.hSize,
                const Center(
                    child: MainText.subPageTitle('card number',
                      color: Colors.black,
                    )
                ),
                15.hSize,
                MainTextField(
                  hint: 'card number',
                  hintColor: Colors.grey,
                  borderColor: Colors.grey,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                  keyboardType: TextInputType.number,
                  hintTextAlign: TextAlign.left,

                ),
                20.hSize,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomSelectorWidget<String>(
                          contentPadding: 7.vEdge,
                          borderColor: Colors.grey,
                          label: 'CVV',
                          items: const ['Male', 'Female', 'Other'],
                          currentValue: selectedGender,
                          hint: 'cvv',
                          iconColor: Colors.grey,
                          iconPadding: const EdgeInsets.only(right: 8.0),
                          hintColor: Colors.grey,
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
                      ),
                      10.wSize,
                      Expanded(
                        child: CustomSelectorWidget<String>(
                          contentPadding: 7.vEdge,
                          borderColor: Colors.grey,
                          label: 'Expiry year',
                          items: const ['Male', 'Female', 'Other'],
                          currentValue: selectedGender,
                          hint: '2024',
                          hintColor: Colors.grey,
                          iconColor: Colors.grey,
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
                      ),
                      10.wSize,
                      Expanded(
                        child: CustomSelectorWidget<String>(
                          contentPadding: 7.vEdge,
                          borderColor: Colors.grey,
                          label: 'Expiry month',
                          items: const ['Male', 'Female', 'Other'],
                          currentValue: selectedGender,
                          hint: '02',
                          hintColor: Colors.grey,
                          iconColor: Colors.grey,
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
                      ),
                    ]
                ),
                40.hSize,
                Row(
                  children: [
                    const Expanded(child: Row()),
                    Expanded(
                      flex: 1,
                      child: MainButton(
                        onPressed: (){
                        },
                        color: Colors.white,
                        borderColor: Colors.grey,
                        child: const MainText.subPageTitle('Cancel',
                          color: AppColors.primary,
                          textAlign: TextAlign.center,),
                      ),
                    ),
                    20.wSize,
                    Expanded(
                      flex: 2,
                      child: MainButton(
                        onPressed: (){
                        },
                        child: const MainText.subPageTitle('Make Payment',
                          color: Colors.white,
                          textAlign: TextAlign.center,)
                        ,),
                    ),
                  ],
                ),
                40.hSize,
                MainButton(
                  onPressed: (){
                    Navigator.pushNamed(context, PaymentConfirmationPage.routeName);
                  },
                  child: const MainText.subPageTitle('التالى',
                    color: Colors.white,
                    textAlign: TextAlign.center,)
                  ,)
              ]
          )
      ),
    );
  }
}