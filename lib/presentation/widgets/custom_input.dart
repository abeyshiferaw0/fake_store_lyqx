import 'package:fake_store_lyqx/config/colors.dart';
import 'package:fake_store_lyqx/config/constants.dart';
import 'package:fake_store_lyqx/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomInput extends StatefulWidget {
  const CustomInput({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.errorMessage,
    required this.controller,
  });

  final String hintText;
  final bool isPassword;
  final String? errorMessage;
  final TextEditingController controller;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  //
  bool _seePass = false;

  @override
  Widget build(BuildContext context) {
    //Accessing the TextTheme from defined theme
    TextTheme textTheme = Theme.of(context).textTheme;

    ///
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Color(0xffE8ECF4), width: 1.5),
    );

    return TextFormField(
      obscureText: widget.isPassword && !_seePass,
      obscuringCharacter: '⬤',
      style: textTheme.bodyMedium!.copyWith(
        fontSize: AppConstants.sp_17,
        color: AppColors.bodyTextColor,
        decoration: TextDecoration.none,
      ),
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: Color(0xffF7F8F9),
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        errorText: widget.errorMessage,
        hintStyle: textTheme.bodyMedium!.copyWith(
          fontSize: AppConstants.sp_17,
          color: AppColors.hintTextColor,
          decoration: TextDecoration.none,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppConstants.w_5,
          vertical: AppConstants.h_3 * 0.7,
        ),
        suffixIcon: widget.isPassword
            ? MaterialButton(
                padding: EdgeInsets.only(
                  right: AppConstants.w_5,
                  left: AppConstants.w_5,
                ),
                minWidth: 0.0,
                onPressed: () {
                  setState(() {
                    _seePass = !_seePass;
                  });
                },
                child: SvgPicture.asset(
                  Assets.icons.icEyeSvg,
                  colorFilter:
                      ColorFilter.mode(Color(0xff6A707C), BlendMode.srcIn),
                ),
              )
            : null,
      ),
    );
  }
}
