part of 'products_bloc.dart';

abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsSuccess extends ProductsState {
  final List<ProductModel> products;

  ProductsSuccess(this.products);
}

class ProductsFailure extends ProductsState {
  final String errorMessage;

  ProductsFailure(this.errorMessage);
}


class ProductLoading extends ProductsState {}

class ProductSuccess extends ProductsState {
  final ProductModel product;

  ProductSuccess(this.product);
}

class ProductFailure extends ProductsState {
  final String errorMessage;

  ProductFailure(this.errorMessage);
}
