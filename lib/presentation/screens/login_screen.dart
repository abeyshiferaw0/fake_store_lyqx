import 'package:fake_store_lyqx/config/constants.dart';
import 'package:fake_store_lyqx/config/router.dart';
import 'package:fake_store_lyqx/core/di/injector.dart';
import 'package:fake_store_lyqx/core/util/validator_util.dart';
import 'package:fake_store_lyqx/presentation/blocs/auth/auth_bloc.dart';
import 'package:fake_store_lyqx/presentation/blocs/auth/login_validation_cubit.dart';
import 'package:fake_store_lyqx/presentation/widgets/custom_back_button.dart';
import 'package:fake_store_lyqx/presentation/widgets/custom_button.dart';
import 'package:fake_store_lyqx/presentation/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _userNameController.text="johnd";
    _passwordController.text="m38rmF\$";
  }

  @override
  Widget build(BuildContext context) {
    //Accessing the TextTheme from defined theme
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            //Auth request status
            if (state is AuthLoading) {
              ScaffoldMessenger.of(context).clearSnackBars();

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Auth loading'),
                ),
              );
            }
            if (state is AuthFailure) {
              ScaffoldMessenger.of(context).clearSnackBars();

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Auth Failed'),
                ),
              );
            }
            if (state is AuthSuccess) {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Auth success'),
                ),
              );

              //
              FocusScope.of(context).requestFocus(FocusNode());

              //Navigate to home page
              context.go(AppRoutes.home);
            }


          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppConstants.w_6,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppConstants.h_4,
                ),

                //
                CustomBackButton(),

                SizedBox(
                  height: AppConstants.h_6,
                ),

                //
                Text(
                  "Welcome back! Glad\nto see you, Again!",
                  style: textTheme.displayLarge!.copyWith(
                    fontSize: AppConstants.sp_24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(
                  height: AppConstants.h_4,
                ),

                BlocBuilder<LoginValidationCubit, ValidationState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        CustomInput(
                          hintText: 'Enter your username',
                          controller: _userNameController,
                          errorMessage: state.userNameInputError,
                        ),
                        SizedBox(
                          height: AppConstants.h_2,
                        ),
                        CustomInput(
                          hintText: 'Enter your password',
                          isPassword: true,
                          controller: _passwordController,
                          errorMessage: state.passwordInputError,
                        ),
                      ],
                    );
                  },
                ),

                SizedBox(
                  height: AppConstants.h_4,
                ),

                CustomButton(
                  text: "Login",
                  onPressed: () {
                    //Validate form
                    context.read<LoginValidationCubit>().validateForm(
                          _userNameController.text,
                          _passwordController.text,
                        );

                    bool isValid = getIt<ValidatorUtil>().validateLoginForm(
                      _userNameController.text,
                      _passwordController.text,
                    );

                    //Start login request
                    if (isValid) {
                      context.read<AuthBloc>().add(
                            LoginEvent(
                              _userNameController.text,
                              _passwordController.text,
                            ),
                          );
                    }
                  },
                  type: ButtonType.dark,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
