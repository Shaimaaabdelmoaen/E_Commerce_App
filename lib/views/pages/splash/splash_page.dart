import 'package:flutter_app/core/extensions/assetss_widgets.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'package:flutter_app/core/utilities/app_routes.dart';
import 'package:flutter_app/providers/splash/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/pages/bottom_navigation_bar/bottom_navigation_bar_page.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SplashProvider>(
      create: (context) => SplashProvider(),
      builder: (context, child) => Consumer<SplashProvider>(
        builder: (context, provider, child) {
          if (provider.authUserResult == true) {
            Future.microtask(
                  () => AppRoutes.routeRemoveTo(context, const BottomNavigationBarPage()),
            );
          } else if (provider.authUserResult == false) {
            // Login Page
            Future.microtask(
                  () => AppRoutes.routeRemoveTo(context, const BottomNavigationBarPage()),
            );
          }
          return Scaffold(
            backgroundColor: AppColors.primary,
            body: Center(
              child: Image.asset('assets/images/splash_screen_logo.png',alignment: Alignment.center,)
            ),
          );
        },
      ),
    );
  }
}