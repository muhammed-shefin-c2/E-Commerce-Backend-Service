import 'package:commerce_js_mobile_app/Models/Product_Models.dart';
import 'package:equatable/equatable.dart';

abstract class ApiEvent extends Equatable{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ApiFetchingEvent extends ApiEvent{}