import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'package:flutter_app/views/pages/home/home_page.dart';
import 'package:flutter_app/views/pages/profile/profile_page.dart';
import 'package:flutter_app/views/pages/requests/requests_page.dart';
import 'package:flutter_app/views/pages/shopping/shopping_page.dart';

class BottomNavigationBarPage extends StatefulWidget {
  static const routeName = 'BottomNavigationBarPage';
  const BottomNavigationBarPage({super.key});

  @override
  State<BottomNavigationBarPage> createState() => _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  int selectIndex = 0;

  List<Widget> taps = [
    const HomePage(),
    const ShoppingPage(),
    const RequestsPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.primary)),
        ),
        child: SalomonBottomBar(
          currentIndex: selectIndex,
          onTap: (index) {
            setState(() {
              selectIndex = index;
            });
          },
          selectedItemColor: AppColors.secondary,
          unselectedItemColor: AppColors.primary,
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("الرئيسية"),
              selectedColor: AppColors.secondary,

            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.shopping_cart),
              title: const Text("المتجر"),
              selectedColor: AppColors.secondary,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.backpack),
              title: const Text("طلباتى"),
              selectedColor: AppColors.secondary,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.person_outline),
              title: const Text("ملفى"),
              selectedColor: AppColors.secondary,
            ),
          ],
        ),
      ),
      body: taps[selectIndex],
    );
  }
}