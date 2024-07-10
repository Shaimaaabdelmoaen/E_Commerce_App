import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'package:flutter_app/views/widgets/main_button.dart';
import 'package:flutter_app/views/widgets/main_divider.dart';
import 'package:flutter_app/views/widgets/main_spaces.dart';
import 'package:flutter_app/views/widgets/main_text.dart';
import 'package:flutter_app/views/widgets/main_textfield.dart';


class PersonalProfilePage extends StatelessWidget{
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
        leading: Container(),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop(); // Navigates back to the previous screen
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MainSpaces.medium(),
              MainTextField(
                hint: 'الاسم',
                prefixIcon: Icon(Icons.person_outline,size: 25),
              ),
              MainSpaces.medium(),
              MainTextField(
                  hint: 'رقم الهاتف',
                prefixIcon: Icon(Icons.add_call,size: 25),),
              MainSpaces.medium(),
              MainTextField(
                  hint: 'البريد الالكترونى',
                prefixIcon: Icon(Icons.mail_outline,size: 25),),
              MainSpaces.medium(),
              MainButton(
                  child: MainText.subPageTitle('تحديث',
                    color: Colors.white,
                    textAlign:TextAlign.center ,),
                onPressed: (){},
              ),
              MainSpaces.medium(),
              MainDivider(title: 'كلمة المرور'),
              MainSpaces.medium(),
              MainTextField(
                  hint: 'كلمة المرور الحالية',
                prefixIcon: Icon(Icons.lock,size: 25),),
              MainSpaces.medium(),
              MainTextField(
                  hint: 'كلمة المرور الجديدة',
                prefixIcon: Icon(Icons.lock,size: 25),),
              MainSpaces.medium(),
              MainTextField(
                  hint: 'تاكيد كلمة المرور الجديدة',
                prefixIcon: Icon(Icons.lock,size: 25),),
            ],
          ),
        ),
      ),

    );
  }

}