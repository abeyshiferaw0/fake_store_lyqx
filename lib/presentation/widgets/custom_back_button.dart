import 'package:fake_store_lyqx/config/colors.dart';
import 'package:fake_store_lyqx/config/constants.dart';
import 'package:fake_store_lyqx/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      padding: EdgeInsets.zero,
      minWidth: 0.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: Color(0xffE8ECF4),
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(AppConstants.w_3),
          child: SvgPicture.asset(
            Assets.icons.icArrow,
            width: AppConstants.w_6,
          ),
        ),
      ),
    );
  }
}
