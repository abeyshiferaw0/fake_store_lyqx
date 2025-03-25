import 'package:fake_store_lyqx/config/colors.dart';
import 'package:fake_store_lyqx/config/constants.dart';
import 'package:fake_store_lyqx/gen/assets.gen.dart';
import 'package:fake_store_lyqx/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemWishList extends StatelessWidget {
  const ItemWishList({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    //Accessing the TextTheme from defined theme
    TextTheme textTheme = Theme.of(context).textTheme;

    return MaterialButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      minWidth: 0.0,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardBackgroundColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.w_4,
            vertical: AppConstants.h_2 * 0.8,
          ),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child: Image.network(
                      "https://picsum.photos/200/300",
                      width: AppConstants.h_10,
                      height: AppConstants.h_10,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: AppConstants.w_6,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "“Awaken, My Love!”",
                          style: textTheme.bodyMedium!.copyWith(
                            fontSize: AppConstants.sp_17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: AppConstants.h_1 / 2,
                        ),
                        Text(
                          "\$19.99",
                          style: textTheme.bodyMedium!.copyWith(
                            fontSize: AppConstants.sp_15,
                            color: AppColors.bodyTextColor.withValues(
                              alpha: 0.75,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppConstants.h_1 / 2,
                        ),
                        CustomButton(
                          text: "Add to cart",
                          onPressed: () {},
                          infiniteWidth: true,
                          bgColor: Colors.white,
                          size: ButtonSize.small,
                          type: ButtonType.secondary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              //fav button
              Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(
                  Assets.icons.icFavFilled,
                  width: AppConstants.h_2,
                  height: AppConstants.h_2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
