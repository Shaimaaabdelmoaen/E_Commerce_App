import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/utilities/app_color.dart';import 'package:flutter_app/views/pages/profile/profile_container.dart';
import 'package:flutter_app/views/widgets/main_spaces.dart';
import '../personalProfile/personal_profile.dart';

class ProfilePage extends StatelessWidget{
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            MainSpaces.large(),
            InkWell(
                onTap: (){
                  Navigator.pushNamed(context, PersonalProfile.routeName);
                },
                child: ProfileContainer(
                  name: 'الملف الشخصى',
                  iconData: Icons.person_outline,)
            ),
            MainSpaces.large(),
            InkWell(
              onTap: (){},
                child: ProfileContainer(
                  name: 'الاسئلة الشائعة',
                  iconData: Icons.quiz_outlined,)
            ),
            MainSpaces.large(),
            InkWell(
                onTap: (){},
                child: ProfileContainer(
                  name: 'من نحن',
                  iconData: Icons.bookmark_border,)
            ),
            MainSpaces.large(),
            InkWell(
                onTap: (){},
                child: ProfileContainer(
                  name: 'تواصل معنا',
                  iconData: Icons.chat_outlined,)
            ),
          ],
        ),
      ),
    );
  }

}