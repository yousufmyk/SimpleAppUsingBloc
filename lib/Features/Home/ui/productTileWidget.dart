import 'package:flutter/material.dart';
import 'package:groceryapp/Features/Home/bloc/home_bloc.dart';
import 'package:groceryapp/Features/Home/models/homeDataModel.dart';

class ProductTileWidget extends StatelessWidget {
   const ProductTileWidget({super.key, required this.productDataModel, required this.homeBloc});
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;

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
                image: NetworkImage(productDataModel.imageUrl.toString()))
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
                  IconButton(
                  onPressed: () {
                    homeBloc.add(HomeEventWhishlistButtonClickedEvent(clickedProduct: productDataModel));
                  },
                  icon: const Icon(Icons.favorite_border)),
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeProductCartButtonClickedEvent(clickedProduct: productDataModel));
                  },
                  icon: const Icon(Icons.shopping_bag_outlined)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}