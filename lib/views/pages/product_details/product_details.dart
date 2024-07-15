import 'package:flutter/material.dart';
import 'package:flutter_app/core/extensions/assetss_widgets.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'package:flutter_app/views/pages/shopping_card/shopping_card_page.dart';
import 'package:flutter_app/views/widgets/main_button.dart';
import 'package:flutter_app/views/widgets/main_text.dart';

class ProductDetailsPage extends StatefulWidget{
  static const routeName='ProductDetails';

  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 1;
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset('assets/images/milk_product.png')),
              18.hSize,
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(child: MainText.pageTitle('منتجات البان')),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.black)
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.add,color: Colors.black,),
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                        ),
                      ),
                      10.wSize,
                      MainText.pageTitle(
                        '$quantity',
                      ),
                      18.wSize,
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.grey)
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.remove,color: Colors.grey,),
                          onPressed: () {
                            setState(() {
                              if (quantity > 1) quantity--;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              10.hSize,
              DataTable(
                border: TableBorder.all(color: Colors.black),
                columnSpacing: 35,
                //dataRowHeight: 35,
                columns: const [
                  DataColumn(label: MainText.title('كودالشركة',color:AppColors.primary ,)),
                  DataColumn(label: MainText.title('سعرالكاش',color:AppColors.primary)),
                  DataColumn(label: MainText.title('أجل90يوم',color:AppColors.primary)),
                  DataColumn(label: MainText.title('السلة',color:AppColors.primary)),
                ],
                rows: const [
                  DataRow(cells: [
                    DataCell(MainText.title('402',color:AppColors.primary ,)),
                    DataCell(MainText.title('10',color:AppColors.primary ,)),
                    DataCell(MainText.title('1',color:AppColors.primary ,)),
                    DataCell(Icon(Icons.shopping_cart,color: AppColors.secondary,)),
                  ]),
                  DataRow(cells: [
                    DataCell(MainText.title('408',color:AppColors.primary ,)),
                    DataCell(MainText.title('12',color:AppColors.primary ,)),
                    DataCell(MainText.title('2',color:AppColors.primary ,)),
                    DataCell(Icon(Icons.shopping_cart,color: AppColors.secondary,)),
                  ]),
                ],
              ),
               10.hSize,
               MainButton(
                onPressed: (){
                  Navigator.pushNamed(context, ShoppingCardPage.routeName);
                },
                  child: const Row(
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
              10.hSize,
              const MainButton(
                color: Colors.white,
                  child: MainText.subPageTitle('حفظ لوقت لاحق',
                    textAlign: TextAlign.center,))
            ],
          ),
        ),
      ),
    );
  }
}