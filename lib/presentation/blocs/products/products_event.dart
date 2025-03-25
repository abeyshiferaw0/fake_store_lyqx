part of 'products_bloc.dart';

abstract class ProductsEvent {}

class FetchProductsEvent extends ProductsEvent {}

class FetchProductEvent extends ProductsEvent {
  final int id;

  FetchProductEvent(this.id);
}
