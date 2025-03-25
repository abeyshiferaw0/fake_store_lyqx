import 'package:fake_store_lyqx/config/colors.dart';
import 'package:fake_store_lyqx/config/constants.dart';
import 'package:fake_store_lyqx/data/models/product.dart';
import 'package:fake_store_lyqx/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemProductList extends StatelessWidget {
  const ItemProductList(
      {super.key, required this.onTap, required this.product});

  final ProductModel product;
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
            horizontal: AppConstants.w_4*1.2,
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
                      product.image,
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
                          product.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.bodyMedium!.copyWith(
                            fontSize: AppConstants.sp_17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          product.description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.bodyMedium!.copyWith(
                            fontSize: AppConstants.sp_15,
                            color: AppColors.bodyTextColor.withValues(alpha: 0.5),
                          ),
                        ),
                        SizedBox(
                          height: AppConstants.h_1,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              Assets.icons.icStar,
                              width: AppConstants.w_3,
                            ),
                            SizedBox(
                              width: AppConstants.w_2,
                            ),
                            Text(
                              product.rating.count.toString(),
                              style: textTheme.bodyMedium!.copyWith(
                                fontSize: AppConstants.sp_14,
                                color: AppColors.bodyTextColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppConstants.h_1,
                        ),
                        Text(
                          "\$${product.price}",
                          style: textTheme.bodyMedium!.copyWith(
                            fontSize: AppConstants.sp_15,
                            color:
                                AppColors.bodyTextColor.withValues(alpha: 0.75),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: AppConstants.w_12,
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
