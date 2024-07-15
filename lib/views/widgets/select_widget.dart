import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/utilities/app_color.dart';
import 'package:flutter_app/views/widgets/main_text.dart';

class CustomSelectorWidget<T> extends StatelessWidget {
  const CustomSelectorWidget({
    super.key,
    required this.items,
    this.currentValue,
    this.label,
    this.hint,
    this.validatorText,
    this.onChanged,
    this.valueToStringFunc,
    this.icon,
    this.validator,
    this.fillColor,
    this.hintColor,
    this.fontSize,
    this.hintAlignment,
    this.iconPadding,
    this.borderColor,
    this.contentPadding,
    this.hintImage,
    this.iconColor

  });
  final T? currentValue;
  final String? label;
  final String? hint;
  final String? validatorText;
  final void Function(T? value)? onChanged;
  final String? Function(T? value)? valueToStringFunc;
  final List<T> items;
  final Widget? icon;
  final String? Function(T?)? validator;
  final Color? fillColor;
  final Color? hintColor;
  final double? fontSize;
  final AlignmentGeometry? hintAlignment;
  final EdgeInsetsGeometry? iconPadding;
  final Color? borderColor;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? hintImage;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    Color? color = currentValue == null ? hintColor : hintColor;
    String? Function(T?)? valueToString =
        valueToStringFunc ?? (v) => v?.toString();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if ((label ?? '').isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 9,
              //right: 15,
            ),
            child: MainText.title(label ?? '', fontSize: 15),
          ),
        DropdownButtonFormField2<T>(
          isExpanded: true,
          decoration: InputDecoration(
            fillColor: fillColor,
            filled: fillColor != null,
            contentPadding: contentPadding,
            border: OutlineInputBorder(
              borderSide: BorderSide(color:borderColor ?? AppColors.primary.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:  BorderSide(color:borderColor ?? AppColors.primary),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor ?? Colors.black.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color:borderColor ?? Colors.black.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          hint: Align(
            alignment: hintAlignment ?? Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (hintImage != null) ...[
                  hintImage!,
                  const SizedBox(width: 8),
                ],
                MainText(
                  (currentValue?.toString() ?? '').isNotEmpty
                      ? currentValue!.toString()
                      : (hint ?? label ?? ''),
                  color: color,
                  maxLines: 1,
                  fontSize: fontSize,
                ),
              ],
            ),
          ),
          items: items.map((T value) {
            return DropdownMenuItem<T>(
              value: value,
              child: SizedBox(
                child: MainText(
                  valueToString.call(value) ?? '',
                  color:
                      value == currentValue ? Colors.black87 : Colors.black38,
                ),
              ),
            );
          }).toList(),
          validator: validator,
          onChanged: onChanged,
          iconStyleData: IconStyleData(
            icon: Padding(
              padding: iconPadding ?? const EdgeInsets.only(left: 6.0),
              child: Icon(
                Icons.keyboard_arrow_down_rounded,
                color:
                    iconColor ?? AppColors.primary,
                size: 30,
              ),
            ),
            iconSize: 24,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            offset: const Offset(0, -2),
            elevation: 1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
      ],
    );
  }
}
