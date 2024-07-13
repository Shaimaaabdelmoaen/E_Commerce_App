// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_app/core/extensions/assetss_widgets.dart';
import 'package:flutter_app/views/widgets/main_text.dart';
import 'package:flutter_app/core/utilities/app_color.dart';

class CustomSwitchListTile extends StatefulWidget {
  final String title;
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const CustomSwitchListTile({
    super.key,
    required this.title,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  _CustomSwitchListTileState createState() => _CustomSwitchListTileState();
}

class _CustomSwitchListTileState extends State<CustomSwitchListTile> {
  late bool value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: MainText.subPageTitle(widget.title),
      value: value,
      contentPadding: 5.hEdge,
      onChanged: (bool newValue) {
        setState(() {
          value = newValue;
        });
        widget.onChanged(newValue);
      },
      activeColor: Colors.white,
      inactiveThumbColor:Colors.white ,
      activeTrackColor: AppColors.primary,
      inactiveTrackColor: Colors.grey.withOpacity(.5),
    );
  }
}
