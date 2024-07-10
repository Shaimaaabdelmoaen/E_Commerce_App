import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/views/pages/home/widgets/products_section_page.dart';
import 'package:flutter_app/views/widgets/main_appbar.dart';
import 'package:flutter_app/views/widgets/main_spaces.dart';
import 'widgets/Sections_page.dart';
import 'widgets/brands_section_page.dart';
import 'widgets/header_title_page.dart';

class HomePage extends StatelessWidget{
  static const routeName='HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/homePhoto.png',),
              MainSpaces.large(),
              HeaderTitlePage(title: 'الماركات',),
              MainSpaces.large(),
              BrandsPage(),
              MainSpaces.large(),
              HeaderTitlePage(title: 'المنتجات'),
              MainSpaces.large(),
              ProductsSectionPage(),
              MainSpaces.large(),
              HeaderTitlePage(title: 'الاقسام',),
              MainSpaces.large(),
              SectionsPage(),
            ],
          ),
        ),
      ),
    );
  }
  
}