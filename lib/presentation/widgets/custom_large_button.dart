import 'package:fake_store_lyqx/config/colors.dart';
import 'package:fake_store_lyqx/config/constants.dart';
import 'package:fake_store_lyqx/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CustomLargeButton extends StatelessWidget {
  const CustomLargeButton({
    super.key,
    required this.buttonTxt,
    required this.labelTxt,
    required this.priceTxt,
    this.backgroundColor = AppColors.largeButtonColor,
  });

  final String buttonTxt;
  final String labelTxt;
  final String priceTxt;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    //Accessing the TextTheme from defined theme
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.w_4,
        vertical: AppConstants.h_3,
      ),
      color: backgroundColor,
      child: Row(
        children: [
          SizedBox(
            width: AppConstants.w_3,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                labelTxt,
                style: textTheme.bodyMedium!.copyWith(
                  fontSize: AppConstants.sp_15,
                  color: AppColors.outlinedButtonColor,
                ),
              ),
              SizedBox(
                height: AppConstants.h_1 / 2,
              ),
              Text(
                priceTxt,
                style: textTheme.bodyMedium!.copyWith(
                  fontSize: AppConstants.sp_19,
                  fontWeight: FontWeight.bold,
                  color: AppColors.bodyTextColor,
                ),
              ),
            ],
          ),
          SizedBox(
            width: AppConstants.w_6,
          ),
          Expanded(
            child: CustomButton(
              text: buttonTxt,
              onPressed: () {},
              type: ButtonType.dark,
              size: ButtonSize.large,
            ),
          ),
          SizedBox(
            width: AppConstants.w_3,
          ),
        ],
      ),
    );
  }
}
