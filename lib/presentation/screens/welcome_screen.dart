import 'package:fake_store_lyqx/config/constants.dart';
import 'package:fake_store_lyqx/config/router.dart';
import 'package:fake_store_lyqx/gen/assets.gen.dart';
import 'package:fake_store_lyqx/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    //Accessing the TextTheme from defined theme
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Stack(
        children: [
          //screen bg image
          Image.asset(
            Assets.images.bgWelcome.path,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          //
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: AppConstants.h_16*2,
                ),
                Image.asset(
                  Assets.images.icBrand.path,
                  width: AppConstants.w_17,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: AppConstants.h_1,
                ),
                Text(
                  "Fake Store",
                  style: textTheme.bodyMedium!.copyWith(
                    fontSize: AppConstants.sp_22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: AppConstants.h_4,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.w_6,
                  ),
                  child: CustomButton(
                    text: "Login",
                    onPressed: () {
                      //Navigate to
                      context.push(AppRoutes.login);
                    },
                    type: ButtonType.dark,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
