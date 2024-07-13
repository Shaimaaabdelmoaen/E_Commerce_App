// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_app/core/extensions/assetss_widgets.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'package:flutter_app/views/widgets/main_text.dart';


class ProfileContainerPage extends StatelessWidget{
  String name;
  IconData? iconData;
  ProfileContainerPage({super.key, required this.name,required this.iconData});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 10.aEdge,
      child: Container(
        height: 44,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.primary)
        ),
        child: Padding(
          padding: 8.aEdge,
          child: Row(
            children: [
              Expanded(
                  child: Row(
                    children: [
                      Icon(iconData),
                      const SizedBox(width: 5,),
                      MainText.subPageTitle(name,color: AppColors.primary.withOpacity(.8),)
                    ],
                  )),
              const Icon(Icons.arrow_forward_ios,size: 20,)
            ],
          ),
        ),
      ),
    );
  }

}