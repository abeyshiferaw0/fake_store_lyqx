import 'package:fake_store_lyqx/config/colors.dart';
import 'package:fake_store_lyqx/config/constants.dart';
import 'package:fake_store_lyqx/gen/assets.gen.dart';
import 'package:fake_store_lyqx/presentation/widgets/custom_large_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Accessing the TextTheme from defined theme
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Column(
        children: [
          //
          Expanded(
            child: Stack(
              children: [
                //Build product details
                buildProductDetail(context, textTheme),

                //Build app bar
                SafeArea(
                  child: buildAppBar(),
                ),
              ],
            ),
          ),

          //Build product footer cart button
          CustomLargeButton(
            buttonTxt: "Add to cart",
            labelTxt: "Price",
            priceTxt: "\$79.99",
          ),
        ],
      ),
    );
  }

  Column buildProductDetail(BuildContext context, TextTheme textTheme) {
    return Column(
      children: [
        //Build product image
        Expanded(
          child: Image.network(
            width: double.infinity,
            "https://images.unsplash.com/photo-1509198397868-475647b2a1e5?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dmlkZW8lMjBnYW1lJTIwY29udHJvbGxlcnxlbnwwfHwwfHx8MA%3D%3D",
            fit: BoxFit.cover,
          ),
        ),

        //Build product detail
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.w_6,
            vertical: AppConstants.h_4,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Xbox One Elite Series 2 Controller",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: AppConstants.sp_20,
                    ),
              ),
              SizedBox(
                height: AppConstants.h_1 * 1.4,
              ),
              Text(
                "Gaming Category",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withValues(alpha: 0.5),
                      fontSize: AppConstants.sp_16,
                    ),
              ),
              SizedBox(
                height: AppConstants.h_1 * 1.4,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.icons.icStar,
                    width: AppConstants.w_4,
                  ),
                  SizedBox(
                    width: AppConstants.w_2,
                  ),
                  Text(
                    "4.25",
                    style: textTheme.bodyMedium!.copyWith(
                      fontSize: AppConstants.sp_15,
                      color: AppColors.bodyTextColor,
                    ),
                  ),
                  SizedBox(
                    width: AppConstants.w_2,
                  ),
                  Text(
                    "12 Reviews",
                    style: textTheme.bodyMedium!.copyWith(
                      fontSize: AppConstants.sp_15,
                      color: AppColors.hintTextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MaterialButton(
          onPressed: () {},
          child: SvgPicture.asset(
            Assets.icons.icArrowLeft,
            colorFilter: ColorFilter.mode(Color(0xff3A3A3A), BlendMode.srcIn),
            width: AppConstants.w_5,
          ),
        ),
        MaterialButton(
          onPressed: () {},
          child: SvgPicture.asset(
            Assets.icons.icFavOutlined,
            colorFilter: ColorFilter.mode(Color(0xff3A3A3A), BlendMode.srcIn),
            width: AppConstants.w_5,
          ),
        ),
      ],
    );
  }
}
