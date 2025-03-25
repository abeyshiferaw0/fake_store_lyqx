import 'package:fake_store_lyqx/config/constants.dart';
import 'package:fake_store_lyqx/presentation/widgets/custom_large_button.dart';
import 'package:fake_store_lyqx/presentation/widgets/item_cart_list.dart';
import 'package:fake_store_lyqx/presentation/widgets/logout_button.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppConstants.h_3,
            ),

            //build app bar
            buildAppBar(context),

            SizedBox(
              height: AppConstants.h_4,
            ),

            //Build wish list
            Expanded(
              child: buildList(),
            ),

            //Total cart price and checkout button
            Divider(
              color: Colors.black.withValues(alpha: 0.1),
              height: 1.0,
              thickness: 1.0,
            ),
            CustomLargeButton(
              buttonTxt: 'Checkout',
              labelTxt: 'Cart total',
              priceTxt: '\$165.97',
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  buildAppBar(context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.w_6,
      ),
      child: Row(
        children: [
          Text(
            "Cart",
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: AppConstants.sp_20,
                ),
          ),

          Expanded(child: SizedBox()),

          //logout button
          LogoutButton(),
        ],
      ),
    );
  }

  buildList() {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: AppConstants.h_2),
      itemBuilder: (context, index) {
        return ItemCartList(
          onTap: () {},
          index: index,
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: AppConstants.h_2,
        );
      },
      itemCount: 3,
    );
  }
}
