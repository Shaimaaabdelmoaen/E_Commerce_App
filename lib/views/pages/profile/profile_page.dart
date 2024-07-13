// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/data/remote/api_service.dart';
import 'package:flutter_app/core/extensions/assetss_widgets.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'package:flutter_app/views/pages/edit_password/edit_password_page.dart';
import 'package:flutter_app/views/pages/login/login_page.dart';
import 'package:flutter_app/views/pages/notification_settings/notification_settings_page.dart';
import 'package:flutter_app/views/pages/personal_profile/personal_profile.dart';
import 'package:flutter_app/views/pages/profile/widgets/profile_container_page.dart';
import 'package:flutter_app/views/widgets/main_text.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget{
  const ProfilePage({super.key});


  Future<void> logout(BuildContext context) async {
    try {
      ApiService apiService = GetIt.instance<ApiService>();
      await apiService.logoutUser();

       SharedPreferences prefs = await SharedPreferences.getInstance();
       await prefs.clear();

      Navigator.pushNamedAndRemoveUntil(context, LoginPage.routeName, (route) => false);
    } catch (e) {
      if (kDebugMode) {
        print('Logout failed: $e');
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Image.asset(
          'assets/images/appbar_logo.png',
          height: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: 10.aEdge,
          child: Column(
            children: [
              InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, PersonalProfilePage.routeName);
                  },
                  child: ProfileContainerPage(
                    name: 'تعديل الملف الشخصى',
                    iconData:Icons.person_outline,
                  ),
              ),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, EditPasswordPage.routeName);
                },
                child: ProfileContainerPage(
                  name: 'تعديل كلمة المرور',
                  iconData:Icons.password,
                ),
              ),
              InkWell(
                onTap: (){},
                  child: ProfileContainerPage(
                    name: 'الاسئلة الشائعة',
                    iconData: Icons.quiz_outlined,)
              ),
              InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, NotificationSettingsPage.routeName);
                  },
                  child: ProfileContainerPage(
                    name: 'الاشعارات',
                    iconData: Icons.notifications_none,)
              ),
              InkWell(
                  onTap: (){},
                  child: ProfileContainerPage(
                    name: 'الاعدادات',
                    iconData: Icons.settings_outlined,)
              ),
              InkWell(
                  onTap: (){},
                  child: ProfileContainerPage(
                    name: 'من نحن',
                    iconData: Icons.bookmark_border,)
              ),
              InkWell(
                  onTap: (){},
                  child: ProfileContainerPage(
                    name: 'تواصل معنا',
                    iconData: Icons.chat_outlined,)
              ),
              18.hSize,
              InkWell(
                onTap: () => logout(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const MainText.title('سجل الخروج',color: Colors.black45,),
                    Transform.rotate(
                      angle: 180 * 3.141592653589793 / 180,
                      child: const Icon(Icons.exit_to_app_outlined,size: 20,color: Colors.black54,),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}