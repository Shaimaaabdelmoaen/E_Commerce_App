// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'main_text.dart';

class MainDivider extends StatelessWidget{
  String? title;
  MainDivider ({super.key, this.title});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            child: Divider(
              color: Colors.grey,height: 2,)
        ),
        Expanded(
            child: MainText.title(title!,
              textAlign: TextAlign.center,
              color: AppColors.primary,
            )
        ),
        const Expanded(
            child: Divider(
              color: Colors.grey,
              height: 2,)
        ),
      ],
    );
  }
  
}