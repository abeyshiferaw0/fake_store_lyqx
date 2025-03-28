import 'package:bloc/bloc.dart';
import 'package:fake_store_lyqx/data/models/product.dart';
import 'package:fake_store_lyqx/data/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

part 'products_event.dart';

part 'products_state.dart';

@injectable
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository _productRepository;

  ProductsBloc(this._productRepository) : super(ProductsInitial()) {
    on<FetchProductsEvent>((event, emit) async {
      emit(ProductsLoading());
      try {
        final List<ProductModel> products =
            await _productRepository.fetchProducts();
        emit(ProductsSuccess(products));
      } catch (e, s) {
        emit(ProductsFailure(s.toString()));
      }
    });

    on<FetchProductEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        final ProductModel product =
        await _productRepository.fetchProduct(event.id);
        emit(ProductSuccess(product));
      } catch (e, s) {
        emit(ProductFailure(s.toString()));
      }
    });
  }
}
