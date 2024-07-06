import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'package:flutter_app/views/pages/homePage/products_section.dart';
import 'package:flutter_app/views/pages/homePage/header_title.dart';
import 'package:flutter_app/views/widgets/main_spaces.dart';
import 'Sections.dart';
import 'brands_section.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: Image.asset(
            'assets/images/appbar_logo.png'
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.notifications)
          ),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.favorite_border)
          ),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.shopping_cart)
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/homePhoto.png',),
              MainSpaces.large(),
              HeaderTitle(title: 'الماركات',),
              MainSpaces.large(),
              Brands(),
              MainSpaces.large(),
              HeaderTitle(title: 'المنتجات'),
              MainSpaces.large(),
              ProductsSection(),
              MainSpaces.large(),
              HeaderTitle(title: 'الاقسام',),
              MainSpaces.large(),
              Sections(),
            ],
          ),
        ),
      ),
    );
  }
  
}