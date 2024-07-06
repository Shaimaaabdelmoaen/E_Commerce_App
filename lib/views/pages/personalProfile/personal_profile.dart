import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/views/pages/personalProfile/perconal_profile_container.dart';
import 'package:flutter_app/views/widgets/main_button.dart';
import 'package:flutter_app/views/widgets/main_spaces.dart';
import 'package:flutter_app/views/widgets/main_text.dart';

import '../../../../core/utilities/app_color.dart';

class PersonalProfile extends StatelessWidget{
  static const routeName='PersonalProfile';
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
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MainSpaces.medium(),
              PersonalProfileContainer(name: 'الاسم', iconData: Icons.person_outline,),
              MainSpaces.medium(),
              PersonalProfileContainer(name: 'رقم الهاتف', iconData:Icons.add_call),
              MainSpaces.medium(),
              PersonalProfileContainer(name: 'البريد الالكترونى', iconData: Icons.mail_outline),
              MainSpaces.medium(),
              MainButton(
                  child: MainText.subPageTitle('تحديث',color: Colors.white,textAlign:TextAlign.center ,),
                color: AppColors.primary,
                onPressed: (){},
              ),
              MainSpaces.medium(),
              Row(
                children: [
                  Expanded(
                      child: Divider(
                        color: Colors.grey,height: 2,)
                  ),
                  Expanded(
                      child: MainText.title('كلمة المرور',
                        textAlign: TextAlign.center,
                        color: AppColors.primary,
                      )
                  ),
                  Expanded(
                      child: Divider(
                        color: Colors.grey,
                        height: 2,)
                  ),
                ],
              ),
              MainSpaces.medium(),
              PersonalProfileContainer(name: 'كلمة المرور الحالية', iconData: Icons.lock),
              MainSpaces.medium(),
              PersonalProfileContainer(name: 'كلمة المرور الجديدة', iconData: Icons.lock),
              MainSpaces.medium(),
              PersonalProfileContainer(name: 'تاكيد كلمة المرور الجديدة', iconData: Icons.lock),
            ],
          ),
        ),
      ),

    );
  }

}