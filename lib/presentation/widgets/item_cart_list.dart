import 'package:fake_store_lyqx/config/colors.dart';
import 'package:fake_store_lyqx/config/constants.dart';
import 'package:fake_store_lyqx/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemCartList extends StatelessWidget {
  const ItemCartList({super.key, required this.onTap, required this.index});

  final VoidCallback onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    //Accessing the TextTheme from defined theme
    TextTheme textTheme = Theme.of(context).textTheme;

    return Slidable(
      key: ValueKey(index.toString()),
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        extentRatio: 0.3,
        children: [
          CustomSlidableAction(
            backgroundColor: Color(0xffCC474E),
            onPressed: (BuildContext context) {},
            child: SvgPicture.asset(
              Assets.icons.icDelete,
              width: AppConstants.w_4*1.1,
            ),
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: onTap,
        padding: EdgeInsets.zero,
        minWidth: 0.0,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppConstants.h_1 / 2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: AppConstants.w_6,
              ),
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
              Column(
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
                    height: AppConstants.h_1 * 1.2,
                  ),
                  //build add remove button
                  buildAddRemoveButton(context, index),
                ],
              ),
              Expanded(child: SizedBox()),
              Text(
                "\$19.99",
                style: textTheme.bodyMedium!.copyWith(
                  fontSize: AppConstants.sp_17,
                  color: AppColors.bodyTextColor.withValues(alpha: 0.75),
                ),
              ),
              SizedBox(
                width: AppConstants.w_4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildAddRemoveButton(context, index) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black.withValues(alpha: 0.1),
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: AppConstants.w_4,
          ),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              Assets.icons.icMinusCircle,
              width: AppConstants.w_6 * 0.9,
              colorFilter: ColorFilter.mode(
                Colors.black.withValues(alpha: 0.75),
                BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(
            width: AppConstants.w_8,
            height: AppConstants.h_5,
            child: VerticalDivider(
              width: 1.0,
              color: Colors.black.withValues(alpha: 0.1),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.w_2),
            child: Text(
              '1',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: AppConstants.sp_17,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          SizedBox(
            width: AppConstants.w_8,
            height: AppConstants.h_5,
            child: VerticalDivider(
              width: 1.0,
              color: Colors.black.withValues(alpha: 0.1),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              Assets.icons.icPlusCircle,
              width: AppConstants.w_6 * 0.9,
              colorFilter: ColorFilter.mode(
                Colors.black.withValues(alpha: 0.75),
                BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(
            width: AppConstants.w_4,
          ),
        ],
      ),
    );
  }
}
