import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/pages/login/login_page.dart';
import 'package:flutter_app/views/widgets/main_button.dart';
import 'package:flutter_app/views/widgets/main_spaces.dart';
import 'package:flutter_app/views/widgets/main_text.dart';

class WelcomPage extends StatelessWidget{
  static const routeName='WelcomPage';
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Padding(
       padding: const EdgeInsets.all(20),
       child: Center(
         child: Column(
           children: [
             Image.asset('assets/images/welcom_photo.png'),
             MainSpaces.small(),
             MainText.subPageTitle('مرحبًا بكم في تطبيقنا المميز لتسوق المنتجات الغذائية!',
               textAlign: TextAlign.center,),
             Spacer(),
             MainText.title('مجموعة واسعة من المنتجات الطازجة والصحية التي تناسب جميع احتياجاتكم الغذائية',
               textAlign: TextAlign.center,
               color: Color(0xFF89898A),
             ),
             Spacer(),
             MainButton(
               child: MainText.subPageTitle('إبدأ الآن',color: Colors.white,textAlign:TextAlign.center ,),
               onPressed: (){
                 Navigator.pushNamed(context, LoginPage.routeName);
               },
             ),
           ],
         ),
       ),
     ),
   );
  }
  
}