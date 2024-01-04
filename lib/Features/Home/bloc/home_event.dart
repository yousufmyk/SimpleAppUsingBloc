part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}
class HomeEventWhishlistButtonClickedEvent extends HomeEvent{}
class HomeProductCartButtonClickedEvent extends HomeEvent{}
class HomeEventWhishlistButtonNavigateEvent extends HomeEvent{}
class HomeEventCartButtonNavigatevent extends HomeEvent{}
