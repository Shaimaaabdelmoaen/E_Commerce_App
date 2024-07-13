import 'package:flutter/material.dart';
import 'package:flutter_app/core/extensions/assetss_widgets.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'package:flutter_app/views/widgets/main_text.dart';

class ProductsSectionPage extends StatefulWidget {
  const ProductsSectionPage({super.key});

  @override
  State<ProductsSectionPage> createState() => _ProductsSectionPageState();
}

class _ProductsSectionPageState extends State<ProductsSectionPage> {
  final List<Map<String, String>> _staticProducts = [
    {
      'name': 'زبادي',
      'image': 'assets/images/yogurt.png',
    },
    {
      'name': 'لبن المراعي',
      'image': 'assets/images/milk.png',
    },
    {
      'name': 'لبن رايب',
      'image': 'assets/images/milk2.png',
    },
    {
      'name': 'مكرونة الملكة',
      'image': 'assets/images/queen.png',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 4,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _staticProducts.length,
        itemBuilder: (context, index) {
          final product = _staticProducts[index];
          return Padding(
            padding: 8.vhEdge,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.primary),
                    ),
                    height: 110,
                    width: 110,
                    child: Image.asset(product['image']!, fit: BoxFit.cover)
                  ),
                  MainText.subPageTitle(product['name']!),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
