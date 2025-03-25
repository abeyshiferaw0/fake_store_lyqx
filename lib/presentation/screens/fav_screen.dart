import 'package:fake_store_lyqx/config/constants.dart';
import 'package:fake_store_lyqx/presentation/widgets/item_wishlist_list.dart';
import 'package:fake_store_lyqx/presentation/widgets/logout_button.dart';
import 'package:flutter/material.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.w_6,
          ),
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
            ],
          ),
        ),
      ),
    );
  }

  buildAppBar(context) {
    return Row(
      children: [
        Text(
          "Wishlist",
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: AppConstants.sp_20,
              ),
        ),

        Expanded(child: SizedBox()),

        //logout button
        LogoutButton(),
      ],
    );
  }

  buildList() {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: AppConstants.h_2),
      itemBuilder: (context, index) {
        return ItemWishList(
          onTap: () {},
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: AppConstants.h_1,
        );
      },
      itemCount: 12,
    );
  }
}
