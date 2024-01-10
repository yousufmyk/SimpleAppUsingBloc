part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent{}
class CartItemRemovedFromCartPage extends CartEvent{
  final ProductDataModel productDataModel;

  CartItemRemovedFromCartPage({required this.productDataModel});
}