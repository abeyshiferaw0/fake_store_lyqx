import 'package:fake_store_lyqx/config/constants.dart';
import 'package:fake_store_lyqx/config/router.dart';
import 'package:fake_store_lyqx/gen/assets.gen.dart';
import 'package:fake_store_lyqx/presentation/widgets/app_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.navigationShell});

  //
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: buildBottomNav(context),
    );
  }

  buildBottomNav(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          color: Color(0xffF8F7FA),
          height: 1.0,
          thickness: 1.0,
        ),
        BottomNavigationBar(
          currentIndex: navigationShell.currentIndex,
          onTap: (i) {
            goToBranch(i);
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.icons.icHome,
                width: AppConstants.h_3,
                height: AppConstants.h_3,
                colorFilter:
                    ColorFilter.mode(Color(0xffCBCBD4), BlendMode.srcIn),
              ),
              activeIcon: SvgPicture.asset(
                Assets.icons.icHome,
                width: AppConstants.h_3 * 1.1,
                height: AppConstants.h_3 * 1.1,
                colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.icons.icFav,
                width: AppConstants.h_3,
                height: AppConstants.h_3,
                colorFilter:
                    ColorFilter.mode(Color(0xffCBCBD4), BlendMode.srcIn),
              ),
              activeIcon: SvgPicture.asset(
                Assets.icons.icFav,
                width: AppConstants.h_3 * 1.1,
                height: AppConstants.h_3 * 1.1,
                colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.icons.icCart,
                width: AppConstants.h_3,
                height: AppConstants.h_3,
                colorFilter:
                    ColorFilter.mode(Color(0xffCBCBD4), BlendMode.srcIn),
              ),
              activeIcon: SvgPicture.asset(
                Assets.icons.icCart,
                width: AppConstants.h_3 * 1.1,
                height: AppConstants.h_3 * 1.1,
                colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
              ),
              label: '',
            ),
          ],
        ),
      ],
    );
  }

  void goToBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
