import 'package:fake_store_lyqx/config/colors.dart';
import 'package:fake_store_lyqx/config/constants.dart';
import 'package:fake_store_lyqx/config/router.dart';
import 'package:fake_store_lyqx/core/di/injector.dart';
import 'package:fake_store_lyqx/core/util/auth_util.dart';
import 'package:fake_store_lyqx/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      minWidth: 0.0,
      onPressed: () {
        //Clear data and log out
        getIt<AuthUtil>().logout();
        context.go(AppRoutes.login);
      },
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.accentColor.withValues(
              alpha: 0.5,
            ),
            radius: AppConstants.w_5,
            child: SvgPicture.asset(
              Assets.icons.icLogout,
              width: AppConstants.h_2,
              height: AppConstants.h_2,
            ),
          ),
          Text(
            "Log out",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: AppConstants.sp_16,
                ),
          ),
        ],
      ),
    );
  }
}
