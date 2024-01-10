import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:groceryapp/Data/groceryData.dart';
import 'package:groceryapp/Data/cart_items.dart';
import 'package:groceryapp/Data/whishlist_items.dart';
import 'package:groceryapp/Features/Home/models/homeDataModel.dart';


part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeEventWhishlistButtonClickedEvent>(
        homeEventWhishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeEventWhishlistButtonNavigateEvent>(
        homeEventWhishlistButtonNavigateEvent);
    on<HomeEventCartButtonNavigatevent>(homeEventCartButtonNavigatevent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSucessState(
        products: GroceryData.groceryProducts
            .map((e) => ProductDataModel(
                  id: e['id'],
                  name: e['name'],
                  description: e['description'],
                  price: e['price'],
                  imageUrl: e['imageUrl'],
                ))
            .toList()));
  }

  FutureOr<void> homeEventWhishlistButtonClickedEvent(
      HomeEventWhishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    if (kDebugMode) {
      print('WhishList Product Clicked');
    }
    whishListItems.add(event.clickedProduct);
    emit(HomeProductItemWhishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    if (kDebugMode) {
      print('Cart Product Clicked');
    }
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeEventWhishlistButtonNavigateEvent(
      HomeEventWhishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    if (kDebugMode) {
      print('Cart Navigate Button Clicked');
    }
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeEventCartButtonNavigatevent(
      HomeEventCartButtonNavigatevent event, Emitter<HomeState> emit) {
    if (kDebugMode) {
      print('Cart Navigate Button Clicked');
    }
    emit(HomeNavigateToCartPageActionState());
  }
}
