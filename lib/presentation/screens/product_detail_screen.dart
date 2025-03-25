import 'package:fake_store_lyqx/config/colors.dart';
import 'package:fake_store_lyqx/config/constants.dart';
import 'package:fake_store_lyqx/core/di/injector.dart';
import 'package:fake_store_lyqx/data/models/product.dart';
import 'package:fake_store_lyqx/gen/assets.gen.dart';
import 'package:fake_store_lyqx/presentation/blocs/products/products_bloc.dart';
import 'package:fake_store_lyqx/presentation/widgets/custom_large_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.id});

  //
  final int id;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ProductsBloc productsBloc = getIt<ProductsBloc>();

  @override
  void initState() {
    super.initState();

    //
    productsBloc.add(
      FetchProductEvent(widget.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Accessing the TextTheme from defined theme
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: BlocBuilder<ProductsBloc, ProductsState>(
        bloc: productsBloc,
        builder: (context, state) {
          if (state is ProductSuccess) {
            return Column(
              children: [
                //
                Expanded(
                  child: Stack(
                    children: [
                      //Build product details
                      buildProductDetail(context, textTheme, state.product),

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
                  priceTxt: "\$${state.product.price}",
                ),
              ],
            );
          }
          return SizedBox();
        },
      ),
    );
  }

  Column buildProductDetail(
    BuildContext context,
    TextTheme textTheme,
    ProductModel product,
  ) {
    return Column(
      children: [
        //Build product image
        Expanded(
          child: Image.network(
            width: double.infinity,
            product.image,
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
                product.title,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: AppConstants.sp_20,
                    ),
              ),
              SizedBox(
                height: AppConstants.h_1 * 1.4,
              ),
              Text(
                product.category,
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
                    product.rating.rate.toString(),
                    style: textTheme.bodyMedium!.copyWith(
                      fontSize: AppConstants.sp_15,
                      color: AppColors.bodyTextColor,
                    ),
                  ),
                  SizedBox(
                    width: AppConstants.w_2,
                  ),
                  Text(
                    "${product.rating.count} Reviews",
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
          onPressed: () {
            context.pop();
          },
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
