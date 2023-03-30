import 'package:flutter/material.dart';
import 'package:stopwatch/theme/color.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.controller,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.sentences,
    this.hintText,
    this.errorText,
    this.onFieldSubmitted,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.hintStyle,
    this.textStyle,
    this.minLines,
    this.maxLines = 1,
    this.enabled = true,
    this.onTap,
    this.textAlign = TextAlign.start,
    this.contentPadding,
    this.outlineInputBorder,
    this.fillColor,
    this.initialValue,
  }) : super(key: key);

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final String? hintText;
  final String? errorText;
  final Function? onFieldSubmitted;
  final Function(String)? onChanged;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final int? minLines;
  final int maxLines;
  final bool enabled;
  final Function()? onTap;
  final TextAlign textAlign;
  final EdgeInsets? contentPadding;
  final OutlineInputBorder? outlineInputBorder;
  final Color? fillColor;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder border = outlineInputBorder ??
        OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorProject.primary,
          ),
          borderRadius: BorderRadius.circular(12),
        );
    return TextFormField(
      key: key,
      controller: controller,
      initialValue: initialValue,
      enabled: enabled,
      textAlign: textAlign,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      onFieldSubmitted: (value) => onFieldSubmitted,
      onTap: onTap,
      onChanged: onChanged,
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
        isDense: contentPadding != null,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        filled: true,
        fillColor: fillColor ?? ColorProject.white,
        enabledBorder: border,
        border: border,
        focusedBorder: border,
        disabledBorder: border,
        errorText: errorText,
        errorStyle: const TextStyle(
            fontSize: 11, height: 1, color: ColorProject.primary),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorProject.primary),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorProject.primary),
        ),
      ),
      style: textStyle ??
          TextStyle(
            fontSize: 13,
            color: enabled ? ColorProject.primary : ColorProject.primary,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
    );
  }
}
