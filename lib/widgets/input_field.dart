import 'package:my_boat/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/utils/asset_icons.dart';
import 'package:my_boat/utils/constants.dart';
import 'package:my_boat/utils/exports.dart';
import 'package:my_boat/utils/regexs.dart';
import 'package:my_boat/utils/scalling.dart';
import 'package:my_boat/widgets/clickable.dart';
import 'package:flutter/services.dart';

class AppInputField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final Color fillColor;
  final bool required;
  final bool enabled;
  final String name;
  final String hint;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final String? Function(String)? validator;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isLoginPassword;
  final Color? borderColor;
  final double radius;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final int maxLines;
  final TextAlign textAlign;
  const AppInputField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.fillColor = AppColors.white,
    this.required = true,
    required this.name,
    this.hint = '',
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.contentPadding,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.suffixIcon,
    this.enabled = true,
    this.prefixIcon,
    this.isLoginPassword = false,
    this.borderColor,
    this.radius = Constants.primaryBorderRadius,
    this.hintTextStyle,
    this.textStyle,
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
  });

  @override
  State<AppInputField> createState() => _AppInputFieldState();
}

class _AppInputFieldState extends State<AppInputField> {
  bool filled = true;
  bool isErrorState = false;
  bool isSecure = true;
  late BorderRadius radius;

  @override
  void initState() {
    radius = BorderRadius.all(Radius.circular(widget.radius));
    super.initState();
    widget.focusNode.addListener(() {
      if (widget.focusNode.hasFocus) {
        filled = false;
      } else if (isErrorState) {
        filled = false;
      } else {
        filled = true;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: widget.textInputType == TextInputType.phone
          ? [
              FilteringTextInputFormatter.allow(RegExp(r'[\d+]')),
              LengthLimitingTextInputFormatter(12),
              // CanadianPhoneNumberFormatter(),
            ]
          : widget.textInputType == TextInputType.number
              ? [FilteringTextInputFormatter.digitsOnly]
              : [],
      maxLines: widget.maxLines,
      autocorrect: false,
      enabled: widget.enabled,
      controller: widget.controller,
      focusNode: widget.focusNode,
      style: widget.textStyle ?? regularTextStyle(fontSize: 14),
      textAlign: widget.textAlign,
      cursorColor: AppColors.c0B2253,
      textInputAction: widget.textInputAction,
      keyboardType: widget.textInputType,
      obscureText:
          widget.textInputType == TextInputType.visiblePassword && isSecure,
      decoration: InputDecoration(
        errorMaxLines: 3,
        fillColor: widget.fillColor,
        filled: widget.fillColor == AppColors.cF8FBF7 ? filled : true,
        hintText: widget.hint,
        hintStyle: widget.hintTextStyle ??
            regularTextStyle(color: AppColors.c81909D, fontSize: 14),
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: radius,
          borderSide: BorderSide(
            color: widget.borderColor ?? AppColors.cEEE4DF,
            width: 1.5,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: radius,
          borderSide: BorderSide(
            color: widget.borderColor ?? AppColors.cEEE4DF,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: radius,
          borderSide: BorderSide(
            width: 1.5,
            color: widget.borderColor ?? AppColors.primary,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: radius,
          borderSide: BorderSide(
            width: 1.5,
            color: widget.borderColor ?? AppColors.error,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: radius,
          borderSide: BorderSide(
            width: 1.5,
            color: widget.borderColor ?? AppColors.error,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: radius,
          borderSide: BorderSide(
            width: 1.5,
            color: widget.borderColor ?? AppColors.cEEE4DF,
          ),
        ),
        isDense: true,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon ??
            (widget.textInputType == TextInputType.visiblePassword
                ? Clickable(
                    onTap: () {
                      isSecure = !isSecure;
                      setState(() {});
                    },
                    child: Image.asset(
                      isSecure ? AssetIcons.secure : AssetIcons.unsecure,
                      scale: isSecure ? 5 : 4,
                      color: AppColors.c6D7A98,
                    ),
                  )
                : widget.textInputAction == TextInputAction.search
                    ? Image.asset(
                        AssetIcons.search,
                        scale: 4,
                      )
                    : null),
      ),
      validator: (String? value) {
        isErrorState = true;
        if (widget.required && widget.controller.text.trim().isEmpty) {
          return AppLocalizations.of(context)!.required(widget.name);
        }

        if (widget.textInputType == TextInputType.emailAddress) {
          if (!RegExp(AppRegexs.emailValidationRegex).hasMatch(value!)) {
            return AppLocalizations.of(context)!.invalidEmailFormat;
          }
        }

        if (widget.textInputType == TextInputType.visiblePassword &&
            !widget.isLoginPassword) {
          if (!RegExp(AppRegexs.passwordValidationRegex).hasMatch(value!)) {
            return AppLocalizations.of(context)!.passwordMustIncludeAt;
          }
        }

        if (widget.textInputType == TextInputType.phone) {
          if (!RegExp(AppRegexs.canadianPhoneRegex).hasMatch(value!)) {
            return AppLocalizations.of(context)!.pleaseEnterAValidPhone;
          }
        }

        if (widget.validator != null) {
          if (widget.validator!(value!) == null) {
          } else {
            return widget.validator!(value);
          }
        }
        isErrorState = false;
        return null;
      },
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }
}
