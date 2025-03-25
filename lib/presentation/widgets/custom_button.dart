import 'package:fake_store_lyqx/config/colors.dart';
import 'package:fake_store_lyqx/config/constants.dart';
import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, dark, outlined }

enum ButtonSize { large, small }

enum ButtonState { enabled, disabled }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonType type;
  final ButtonSize size;
  final bool isDisabled;
  final ButtonState state;
  final Color? bgColor;
  final bool? infiniteWidth;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isDisabled = false,
    this.type = ButtonType.primary,
    this.size = ButtonSize.large,
    this.state = ButtonState.enabled,
    this.bgColor,
    this.infiniteWidth,
  });

  @override
  Widget build(BuildContext context) {
    //Accessing the TextTheme from defined theme
    TextTheme textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: size == ButtonSize.large || infiniteWidth == true
          ? double.infinity
          : null,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: getShape(),
          backgroundColor: bgColor ?? getBgColor(),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: size == ButtonSize.large
                ? AppConstants.h_2 * 0.8
                : AppConstants.h_1*1.2,
            horizontal: size == ButtonSize.small ? AppConstants.w_3 : 0.0,
          ),
          child: Text(
            text,
            style: textTheme.bodyMedium!.copyWith(
              fontSize: size == ButtonSize.large
                  ? AppConstants.sp_17
                  : AppConstants.sp_17,
              color: getTextColor(),
            ),
          ),
        ),
      ),
    );
  }

  getBgColor() {
    if (isDisabled) return AppColors.disabledButtonColor;

    if (type == ButtonType.primary) {
      return AppColors.mainButtonColor;
    }
    if (type == ButtonType.secondary) {
      return AppColors.secondaryButtonColor;
    }
    if (type == ButtonType.outlined) {
      return Colors.transparent;
    }
    if (type == ButtonType.dark) {
      return AppColors.darkButtonColor;
    }

    //default
    return AppColors.mainButtonColor;
  }

  getTextColor() {
    if (isDisabled) return AppColors.disabledButtonTextColor;

    if (type == ButtonType.primary) {
      return AppColors.mainButtonTextColor;
    }
    if (type == ButtonType.secondary) {
      return AppColors.secondaryTextColor;
    }
    if (type == ButtonType.outlined) {
      return isDisabled ? Color(0xff57595A) : AppColors.outlinedButtonTextColor;
    }
    if (type == ButtonType.dark) {
      return AppColors.darkButtonTextColor;
    }

    //default
    return AppColors.mainButtonTextColor;
  }

  getShape() {
    if (type == ButtonType.outlined) {
      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
        side: BorderSide(
          color: isDisabled ? Color(0xffD2D3D3) : AppColors.darkButtonColor,
          width: 1,
        ),
      );
    }

    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.0),
    );
  }
}
