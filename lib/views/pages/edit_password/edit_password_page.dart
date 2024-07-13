import 'package:flutter/material.dart';
import 'package:flutter_app/core/extensions/assetss_widgets.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'package:flutter_app/views/widgets/main_button.dart';
import 'package:flutter_app/views/widgets/main_text.dart';
import 'package:flutter_app/views/widgets/main_textfield.dart';


class EditPasswordPage extends StatelessWidget{
  static const routeName='EditPasswordPage';

  const EditPasswordPage({super.key});
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
            icon: const Icon(Icons.arrow_forward, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop(); // Navigates back to the previous screen
            },
          ),
        ],
      ),
      body: Padding(
        padding: 8.vhEdge,
        child: SingleChildScrollView(
          child: Column(
            children: [
              15.hSize,
              MainTextField(
                hint: 'كلمة المرور الحالية',
                prefixIcon: const Icon(Icons.lock,size: 25),
                contentPadding: 4.vEdge,
              ),
              15.hSize,
              MainTextField(
                hint: 'كلمة المرور الجديدة',
                prefixIcon: const Icon(Icons.lock,size: 25),
                contentPadding: 4.vEdge,
              ),
              15.hSize,
              MainTextField(
                hint: 'تاكيد كلمة المرور الجديدة',
                prefixIcon: const Icon(Icons.lock,size: 25),
                contentPadding: 4.vEdge,
              ),
              15.hSize,
              MainButton(
                child: const MainText.subPageTitle('تحديث',
                  color: Colors.white,
                  textAlign:TextAlign.center ,),
                onPressed: (){},
              ),
            ],
          ),
        ),
      ),

    );
  }

}