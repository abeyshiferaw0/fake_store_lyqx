import 'package:fake_store_lyqx/config/constants.dart';
import 'package:fake_store_lyqx/config/router.dart';
import 'package:fake_store_lyqx/core/di/injector.dart';
import 'package:fake_store_lyqx/core/util/auth_util.dart';
import 'package:fake_store_lyqx/presentation/blocs/products/products_bloc.dart';
import 'package:fake_store_lyqx/presentation/widgets/item_product_list.dart';
import 'package:fake_store_lyqx/presentation/widgets/logout_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final productsBloc = getIt<ProductsBloc>();

  @override
  void initState() {
    super.initState();

    //Start loading products
    productsBloc.add(FetchProductsEvent());
  }

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
              buildAppBar(),

              SizedBox(
                height: AppConstants.h_4,
              ),

              //build product list
              Expanded(
                child: buildList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildAppBar() {
    return Row(
      children: [
        Text(
          "Welcome,\n${getIt<AuthUtil>().getUser().userName}",
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

  buildListHeader() {
    return Text;
  }

  buildList() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: AppConstants.h_2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //build list header
          Text(
            "Fake Store",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: AppConstants.sp_22,
                ),
          ),

          SizedBox(
            height: AppConstants.h_3,
          ),

          BlocBuilder<ProductsBloc, ProductsState>(
            bloc: productsBloc,
            builder: (context, state) {
              if (state is ProductsSuccess) {
                //build product list
                return ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ItemProductList(
                      product: state.products.elementAt(index),
                      onTap: () {
                        context.push(
                          AppRoutes.details,
                          extra: state.products.elementAt(index).id,
                        );
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: AppConstants.h_1,
                    );
                  },
                  itemCount: state.products.length,
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
