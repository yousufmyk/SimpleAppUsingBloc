import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryapp/Features/Cart/ui/cart.dart';
import 'package:groceryapp/Features/Home/bloc/home_bloc.dart';
import 'package:groceryapp/Features/Home/ui/productTileWidget.dart';
import 'package:groceryapp/Features/WhishList/ui/whishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();
@override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionSate,
      buildWhen: (previous, current) => current is! HomeActionSate,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const CartPage()));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const WhishListPage()));
        } else if (state is HomeProductItemWhishlistedActionState) {
           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Item WhishListed')));
        } else if (state is HomeProductItemCartedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Item Carted')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
          case HomeLoadedSucessState:
          final sucessState = state as HomeLoadedSucessState;
          return Scaffold(
          appBar: AppBar(
            title: const Text('Simple Bloc Demo App'),
            backgroundColor: Colors.teal,
            actions: [
              IconButton(
                  onPressed: () {
                    //homeBloc.add(HomeEventWhishlistButtonClickedEvent());
                    homeBloc.add(HomeEventWhishlistButtonNavigateEvent());
                  },
                  icon: const Icon(Icons.favorite_border)),
              IconButton(
                  onPressed: () {
                    //homeBloc.add((HomeProductCartButtonClickedEvent()));
                    homeBloc.add((HomeEventCartButtonNavigatevent()));
                  },
                  icon: const Icon(Icons.shopping_bag_outlined)),
            ],
          ),
          body: ListView.builder(
            itemCount: sucessState.products.length,
            itemBuilder: (context,index){
            return ProductTileWidget(productDataModel: sucessState.products[index], homeBloc: homeBloc,);
          }),
        );
          case HomeErrorState:
          return const Scaffold(
            body: Center(
              child: Text('Error'),
            ),
          );
          default: return const SizedBox();
        }
      },
    );
  }
}



