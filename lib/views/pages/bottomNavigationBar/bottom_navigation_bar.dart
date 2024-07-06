import 'package:flutter/material.dart';
import 'package:flutter_app/views/pages/null/null.dart';
import 'package:flutter_app/views/pages/profile/profile_screen.dart';
import 'package:flutter_app/views/pages/shopping/shopping_screen.dart';

import '../../../core/utilities/app_color.dart';
import '../homePage/home_page.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({super.key});

  @override
  State<BottomNavigationBarPage> createState() => _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  int selectIndex=0;

  List<Widget>taps=[
    HomePage(),
    ShoppingPage(),
    Null(),
    ProfilePage()

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      bottomNavigationBar:Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.primary)),

        ),
        child: BottomNavigationBar(
          onTap: (index){
            setState(() {
              selectIndex=index;
            });
          },
          currentIndex: selectIndex,
          selectedItemColor: AppColors.secondary,
          unselectedItemColor: AppColors.primary,
          items: [
            BottomNavigationBarItem(
                label: 'الرئيسية',
                icon: Icon(Icons.home)
            ),
            BottomNavigationBarItem(
                label: 'المتجر',
                icon: Icon(Icons.shopping_cart)
            ),
            BottomNavigationBarItem(
                label: 'المشترايات',
                icon: Icon(Icons.backpack)
            ),
            BottomNavigationBarItem(
                label: 'ملفى',
                icon: Icon(Icons.person_outline)
            ),
          ],
        ),
      ),
      body: taps[selectIndex]
    );
  }
}
