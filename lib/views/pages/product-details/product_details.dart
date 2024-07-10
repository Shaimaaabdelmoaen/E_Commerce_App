import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'package:flutter_app/views/widgets/main_spaces.dart';
import 'package:flutter_app/views/widgets/main_text.dart';

class ProductDetailsPage extends StatelessWidget{
  static const routeName='ProductDetails';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: MainText.subPageTitle('تفاصيل المنتج',color: Colors.white,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset('assets/images/milk_product.png')),
            MainSpaces.medium(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: MainText.pageTitle('منتجات البان')),
                ImageIcon(AssetImage('assets/images/+.png')),
                SizedBox(width: 10,),
                MainText.subPageTitle('1'),
                SizedBox(width: 10,),
                ImageIcon(AssetImage('assets/images/-.png')),
              ],
            )
          ],
        ),
      ),
    );
  }

}