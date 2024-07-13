import 'package:flutter/material.dart';
import 'package:flutter_app/core/extensions/assetss_widgets.dart';
import 'package:flutter_app/views/pages/home/widgets/products_section_page.dart';
import 'package:flutter_app/views/widgets/main_appbar.dart';
import 'widgets/sections_page.dart';
import 'widgets/brands_section_page.dart';
import 'widgets/header_title_page.dart';

class HomePage extends StatelessWidget{
  static const routeName='HomePage';

  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Padding(
        padding: 8.vhEdge,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/homePhoto.png',),
              20.hSize,
              HeaderTitlePage(title: 'الماركات',),
              20.hSize,
              const BrandsPage(),
              20.hSize,
              HeaderTitlePage(title: 'المنتجات'),
              20.hSize,
              const ProductsSectionPage(),
              20.hSize,
              HeaderTitlePage(title: 'الاقسام',),
              20.hSize,
              const SectionsPage(),
            ],
          ),
        ),
      ),
    );
  }
  
}