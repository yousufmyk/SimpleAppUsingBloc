part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionSate extends HomeState{}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState{}

class HomeLoadedSucessState extends HomeState{
  final List<ProductDataModel> products;

  HomeLoadedSucessState({required this.products});
}

class HomeErrorState extends HomeState{}

class HomeNavigateToWishlistPageActionState extends HomeActionSate{}

class HomeNavigateToCartPageActionState extends HomeActionSate{}

