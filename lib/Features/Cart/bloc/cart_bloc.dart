// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:groceryapp/Data/cart_items.dart';
import 'package:groceryapp/Features/Home/models/homeDataModel.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartItemRemovedFromCartPage>(cartItemRemovedFromCartPage);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSucessState(cartItems: cartItems));
  }

  FutureOr<void> cartItemRemovedFromCartPage(CartItemRemovedFromCartPage event, Emitter<CartState> emit) {
    cartItems.remove(event.productDataModel);
    emit(CartSucessState(cartItems: cartItems));
  }
}
