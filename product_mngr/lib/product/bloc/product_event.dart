part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {
  const ProductEvent();
  List<Object?> get props => [];
}

class GetProductEvent extends ProductEvent {}
