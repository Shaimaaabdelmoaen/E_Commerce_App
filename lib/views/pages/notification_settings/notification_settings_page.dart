import 'package:flutter/material.dart';
import 'package:flutter_app/core/extensions/assetss_widgets.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'package:flutter_app/views/pages/notification_settings/notification_settings_switch/notification_settings_switch_page.dart';
import 'package:flutter_app/views/widgets/main_button.dart';
import 'package:flutter_app/views/widgets/main_text.dart';

class NotificationSettingsPage extends StatefulWidget{
  static const routeName='NotificationSettingsPage';
  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() => _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool isGeneralNotificationOn = true;
  bool isSoundOn = false;
  bool isAppUpdateOn = true;
  bool isNewServiceOn = true;
  bool isNewTipsOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: const MainText.pageTitle('الاشعارات',color: Colors.white,),
        leading: Image.asset(
          'assets/images/appbar_logo.png',),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop(); // Navigates back to the previous screen
            },
          ),
        ],
      ),
      body:  ListView(
        children: [
          CustomSwitchListTile(
            key: const ValueKey('generalNotificationSwitch'),
            title: 'إشعارات عامة',
            initialValue: isGeneralNotificationOn,
            onChanged: (bool value) {
              setState(() {
                isGeneralNotificationOn = value;
              });
            },
          ),
          CustomSwitchListTile(
            key: const ValueKey('soundSwitch'),
            title: 'الصوت',
            initialValue: isSoundOn,
            onChanged: (bool value) {
              setState(() {
                isSoundOn = value;
              });
            },
          ),
          CustomSwitchListTile(
            key: const ValueKey('appUpdateSwitch'),
            title: 'تحديث التطبيق',
            initialValue: isAppUpdateOn,
            onChanged: (bool value) {
              setState(() {
                isAppUpdateOn = value;
              });
            },
          ),
          CustomSwitchListTile(
            key: const ValueKey('newServiceSwitch'),
            title: 'خدمة جديدة متاحة',
            initialValue: isNewServiceOn,
            onChanged: (bool value) {
              setState(() {
                isNewServiceOn = value;
              });
            },
          ),
          CustomSwitchListTile(
            key: const ValueKey('newTipsSwitch'),
            title: 'نصائح جديدة متاحة',
            initialValue: isNewTipsOn,
            onChanged: (bool value) {
              setState(() {
                isNewTipsOn = value;
              });
            },
          ),
          200.hSize,
          Padding(
            padding: 12.aEdge,
            child: MainButton(
              child: const MainText.subPageTitle('تحديث',
                color: Colors.white,
                textAlign:TextAlign.center ,),
              onPressed: (){},
            ),
          ),

        ],
      ),

    );
  }
}