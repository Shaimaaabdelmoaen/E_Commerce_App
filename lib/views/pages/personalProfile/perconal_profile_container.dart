import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utilities/app_color.dart';
import '../../widgets/main_textfield.dart';

class PersonalProfileContainer extends StatelessWidget{
  String name;
  IconData? iconData;
  PersonalProfileContainer({required this.name,required this.iconData });
  @override
  Widget build(BuildContext context) {
   return MainTextField(
     border: OutlineInputBorder(
       borderRadius:BorderRadius.circular(10) ,
     ),
     borderColor: AppColors.primary,
     prefixIcon: Icon(iconData,size: 25,color: AppColors.primary.withOpacity(.6),),
     hint: name,
     hintColor: AppColors.primary.withOpacity(.6),
     hintFontSize: 18,

   );
  }

}