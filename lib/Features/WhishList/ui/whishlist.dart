import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryapp/Features/WhishList/bloc/whishlist_bloc.dart';
import 'package:groceryapp/Features/WhishList/ui/whishListTileWidget.dart';

class WhishListPage extends StatefulWidget {
  const WhishListPage({super.key});

  @override
  State<WhishListPage> createState() => _WhishListPageState();
}

class _WhishListPageState extends State<WhishListPage> {
  final WhishlistBloc whishlistBloc = WhishlistBloc();
  @override
  void initState() {
    
    whishlistBloc.add(WhishlistInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Whish List Page'),
      ),
      body: BlocConsumer<WhishlistBloc, WhishlistState>(
        bloc: whishlistBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is WhishListActionState,
        buildWhen: (previous, current) => current is !WhishListActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case WhishListSucessState:
            final sucessState = state as WhishListSucessState;
            return ListView.builder(
              itemCount: sucessState.whishListItems.length,
              itemBuilder: (context,index){
              return  WhishListTileWidget(productDataModel: sucessState.whishListItems[index], whishlistBloc: whishlistBloc,)
;              });
            default:
          }
          return Container();
        },
      ),
    );
  }
}
