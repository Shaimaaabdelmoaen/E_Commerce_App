import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'main_text.dart';

class MainDivider extends StatelessWidget{
  String? title;
  MainDivider ({this.title});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Divider(
              color: Colors.grey,height: 2,)
        ),
        Expanded(
            child: MainText.title(title!,
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
    );
  }
  
}