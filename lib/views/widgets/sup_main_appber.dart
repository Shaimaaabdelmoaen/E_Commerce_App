import 'package:flutter/material.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
class SupMainAppBar extends StatelessWidget implements PreferredSizeWidget {

   const SupMainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      centerTitle: true,
      leading: Image.asset(
        'assets/images/appbar_logo.png',
        height: 40,
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop(); // Navigates back to the previous screen
          },
        ),
      ],
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}