import 'package:flutter/material.dart';
import 'package:flutter_app/core/extensions/assetss_widgets.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'package:flutter_app/views/widgets/main_button.dart';
import 'package:flutter_app/views/widgets/main_text.dart';

class ProductDetailsPage extends StatelessWidget{
  static const routeName='ProductDetails';

  const ProductDetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const MainText.subPageTitle('تفاصيل المنتج',color: Colors.white,),
        leading: Container(),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop(); // Navigates back to the previous screen
            },
          ),
        ],
      ),
      body: Padding(
        padding: 20.aEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset('assets/images/milk_product.png')),
            18.hSize,
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(child: MainText.pageTitle('منتجات البان')),
                const ImageIcon(AssetImage('assets/images/+.png')),
                10.wSize,
                const MainText.subPageTitle('1'),
                10.wSize,
                const ImageIcon(AssetImage('assets/images/-.png')),
              ],
            ),
            20.hSize,
            const MainButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.backpack,color: Colors.white,),
                    MainText.subPageTitle(
                      'إصافة إلي السلة',
                      color: Colors.white,
                      textAlign: TextAlign.center,
                    ),
                  ],
              
            )),
            20.hSize,
            const MainButton(
              color: Colors.white,
                child: MainText.subPageTitle('حفظ لوقت لاحق',
                  textAlign: TextAlign.center,))
          ],
        ),
      ),
    );
  }

}