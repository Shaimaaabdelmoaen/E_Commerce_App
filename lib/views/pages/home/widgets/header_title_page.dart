import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'package:flutter_app/views/widgets/main_text.dart';
class HeaderTitlePage extends StatelessWidget{
  String? title;
  HeaderTitlePage({required this.title});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MainText.pageTitle('${title}'),
        Row(
          children: [
            MainText.pageTitle('الكل',color: AppColors.secondary,),
            Icon(Icons.arrow_forward_ios,color: AppColors.secondary,)
          ],
        )
      ],
    );
  }

}