part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeEventWhishlistButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeEventWhishlistButtonClickedEvent({required this.clickedProduct});
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeProductCartButtonClickedEvent({required this.clickedProduct});
}

class HomeEventWhishlistButtonNavigateEvent extends HomeEvent {}

class HomeEventCartButtonNavigatevent extends HomeEvent {}
