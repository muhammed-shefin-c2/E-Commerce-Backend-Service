

import 'package:bloc/bloc.dart';
import 'package:commerce_js_mobile_app/Models/Product_Models.dart';
import 'package:commerce_js_mobile_app/domain/bloc/API/Api_Event.dart';
import 'package:commerce_js_mobile_app/domain/bloc/API/Api_State.dart';
import 'package:commerce_js_mobile_app/repository/Product_Repository.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState>{
  final ProductRepository productRepository;

  ApiBloc(this.productRepository) : super(ApiInitial()) {
    on<ApiFetchingEvent>(_onApiFetch);
  }

  Future<void> _onApiFetch(ApiFetchingEvent event, Emitter<ApiState> emit) async {
    emit(ApiFetching());
    try {
      final List<ProductModels> products = await productRepository.getProducts();
      emit(ApiFetched(products));
    }catch (e) {
      emit(ApiErorr("Failed to fetch products: ${e.toString()}"));
    }
  }
}