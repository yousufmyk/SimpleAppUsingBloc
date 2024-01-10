part of 'whishlist_bloc.dart';

@immutable
abstract class WhishlistState {}
abstract class  WhishListActionState extends WhishlistState {}

 class WhishlistInitial extends WhishlistState {}
 class WhishListSucessState extends WhishlistState{
  final List<ProductDataModel> whishListItems;

  WhishListSucessState({required this.whishListItems});
 }
