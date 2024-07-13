import 'package:flutter/material.dart';
import 'package:flutter_app/core/extensions/assetss_widgets.dart';
import 'package:flutter_app/views/pages/login/login_page.dart';
import 'package:flutter_app/views/widgets/main_button.dart';
import 'package:flutter_app/views/widgets/main_text.dart';

class WelcomePage extends StatelessWidget{
  static const routeName='WelcomePage';

  const WelcomePage({super.key});
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Padding(
       padding: 20.aEdge,
       child: Center(
         child: Column(
           children: [
             Image.asset('assets/images/welcome_photo.png'),
             15.hSize,
             const MainText.subPageTitle('مرحبًا بكم في تطبيقنا المميز لتسوق المنتجات الغذائية!',
               textAlign: TextAlign.center,),
             const Spacer(),
             const MainText.title('مجموعة واسعة من المنتجات الطازجة والصحية التي تناسب جميع احتياجاتكم الغذائية',
               textAlign: TextAlign.center,
               color: Color(0xFF89898A),
             ),
             const Spacer(),
             MainButton(
               child: const MainText.subPageTitle('إبدأ الآن',color: Colors.white,textAlign:TextAlign.center ,),
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