

import 'package:commerce_js_mobile_app/Models/Product_Models.dart';
import 'package:equatable/equatable.dart';

abstract class ApiState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ApiInitial extends ApiState{}

class ApiFetching extends ApiState{}

class ApiFetched extends ApiState{
  final List<ProductModels> products;

  ApiFetched(this.products);

  @override
  // TODO: implement props
  List<Object?> get props => [products];
}

class ApiErorr extends ApiState{
  final String message;

  ApiErorr(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => super.props;
}
