import 'package:flutter/material.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'package:flutter_app/views/pages/payment_ways/widgets/payment_form_page.dart';
import 'package:flutter_app/views/widgets/main_text.dart';
import 'package:flutter_app/views/widgets/sup_main_appber.dart';

class PaymentWaysPage extends StatelessWidget {
  static const routeName='PaymentWaysPage';
  const PaymentWaysPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: SupMainAppBar(),
        body: Column(
          children: [
            MainText.pageTitle('الدفع',color: AppColors.secondary,),
            PaymentForm(),
          ],
        ),
      );

  }
}