import 'package:flutter/material.dart';
import 'package:groceryapp/Features/Cart/bloc/cart_bloc.dart';

import 'package:groceryapp/Features/Home/models/homeDataModel.dart';
import 'package:groceryapp/Features/WhishList/bloc/whishlist_bloc.dart';

class WhishListTileWidget extends StatelessWidget {
   const WhishListTileWidget({super.key, required this.productDataModel, required this.whishlistBloc});
  final ProductDataModel productDataModel;
  final WhishlistBloc whishlistBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(

            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(productDataModel.imageUrl))
            ),
          ),
          const SizedBox(height: 20,),
          Text(productDataModel.name,style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),),
          Text(productDataModel.description.toString()),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$${productDataModel.price}",style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),),
              Row(
                children: [
                  // IconButton(
                  // onPressed: () {
                  //   // homeBloc.add(HomeEventWhishlistButtonClickedEvent(clickedProduct: productDataModel));
                  // },
                  // icon: const Icon(Icons.favorite_border)),
              IconButton(
                  onPressed: () {
                    //cartBloc.add(CartItemRemovedFromCartPage(productDataModel: productDataModel));
                  },
                  icon: const Icon(Icons.delete_outline_rounded)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}