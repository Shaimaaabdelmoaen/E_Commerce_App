import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utilities/app_color.dart';
import '../../widgets/main_text.dart';

class ProfileContainer extends StatelessWidget{
  String name;
  IconData? iconData;
  ProfileContainer({required this.name,required this.iconData});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.primary)
      ),
      child: Row(
        children: [
          Expanded(
              child: Row(
                children: [
                  Icon(iconData),
                  SizedBox(width: 5,),
                  MainText.subPageTitle(name)
                ],
              )),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }

}