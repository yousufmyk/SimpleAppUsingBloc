import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'whishlist_event.dart';
part 'whishlist_state.dart';

class WhishlistBloc extends Bloc<WhishlistEvent, WhishlistState> {
  WhishlistBloc() : super(WhishlistInitial()) {
    on<WhishlistEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
