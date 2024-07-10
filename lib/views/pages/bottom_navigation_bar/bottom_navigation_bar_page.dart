import 'package:flutter/material.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'package:flutter_app/views/pages/home/home_page.dart';
import 'package:flutter_app/views/pages/profile/profile_page.dart';
import 'package:flutter_app/views/pages/requests/requests_page.dart';
import 'package:flutter_app/views/pages/shopping/shopping_screen.dart';
class BottomNavigationBarPage extends StatefulWidget {
  static const routeName='BottomNavigationBarPage';
  const BottomNavigationBarPage({super.key});

  @override
  State<BottomNavigationBarPage> createState() => _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  int selectIndex=0;

  List<Widget>taps=[
    HomePage(),
    ShoppingPage(),
    RequestsPage(),
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
                label: 'طلباتى',
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
