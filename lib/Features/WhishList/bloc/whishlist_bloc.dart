import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:groceryapp/Data/cart_items.dart';
import 'package:groceryapp/Data/whishlist_items.dart';
import 'package:groceryapp/Features/Home/models/homeDataModel.dart';
import 'package:meta/meta.dart';

part 'whishlist_event.dart';
part 'whishlist_state.dart';

class WhishlistBloc extends Bloc<WhishlistEvent, WhishlistState> {
  WhishlistBloc() : super(WhishlistInitial()) {
    on<WhishlistInitialEvent>(whishlistInitialevent);
  }

  

  FutureOr<void> whishlistInitialevent(WhishlistInitialEvent event, Emitter<WhishlistState> emit) {
    emit(WhishListSucessState(whishListItems: whishListItems));
  }
}
