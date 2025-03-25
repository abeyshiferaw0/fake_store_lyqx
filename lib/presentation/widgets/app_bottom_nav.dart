import 'package:fake_store_lyqx/config/constants.dart';
import 'package:fake_store_lyqx/config/router.dart';
import 'package:fake_store_lyqx/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Divider(
            color: Colors.black,
            height: 6,
            thickness: 6,
          ),
        ),
        BottomNavigationBar(
          currentIndex: _getCurrentIndex(context),
          onTap: (int index) {
            switch (index) {
              case 0:
                context.go(AppRoutes.home);
                break;
              case 1:
                context.go(AppRoutes.fav);
                break;
              case 2:
                context.go(AppRoutes.cart);
                break;
            }
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.icons.icHome,
                width: AppConstants.h_3,
                height: AppConstants.h_3,
              ),
              activeIcon: SvgPicture.asset(
                Assets.icons.icHome,
                width: AppConstants.h_3 * 1.1,
                height: AppConstants.h_3 * 1.1,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.icons.icFav,
                width: AppConstants.h_3,
                height: AppConstants.h_3,
              ),
              activeIcon: SvgPicture.asset(
                Assets.icons.icFav,
                width: AppConstants.h_3 * 1.1,
                height: AppConstants.h_3 * 1.1,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.icons.icCart,
                width: AppConstants.h_3,
                height: AppConstants.h_3,
              ),
              activeIcon: SvgPicture.asset(
                Assets.icons.icCart,
                width: AppConstants.h_3 * 1.1,
                height: AppConstants.h_3 * 1.1,
              ),
              label: '',
            ),
          ],
        ),
      ],
    );
  }

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path.toString();
    if (location.contains('/home/favorites')) {
      return 0;
    } else if (location.contains('/home/car')) {
      return 1;
    }
    return 0;
  }
}
