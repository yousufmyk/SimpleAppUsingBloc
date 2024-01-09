import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryapp/Features/Cart/bloc/cart_bloc.dart';
import 'package:groceryapp/Features/Cart/ui/cartTileWidget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Items'),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listener: (context, state) {
          // TODO: implement listener
        },
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is !CartActionState,
        builder: (context, state) {
         
          switch (state.runtimeType) {
            case CartSucessState:
             final sucessState = state as CartSucessState;
              return ListView.builder(
            itemCount: sucessState.cartItems.length,
            itemBuilder: (context,index){
            return CartTileWidget(productDataModel: sucessState.cartItems[index], cartBloc: cartBloc,);
          });
            default:
          }
          return Container();
        },
      ),
    );
  }
}
