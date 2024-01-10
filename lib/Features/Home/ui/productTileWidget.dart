import 'package:flutter/material.dart';
import 'package:groceryapp/Features/Home/bloc/home_bloc.dart';
import 'package:groceryapp/Features/Home/models/homeDataModel.dart';

class ProductTileWidget extends StatelessWidget {
  const ProductTileWidget(
      {super.key, required this.productDataModel, required this.homeBloc});
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                //border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xfffbfbfb),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 13), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 190,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    productDataModel.name,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    productDataModel.description.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${productDataModel.price}",
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xffc8e755),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.7),
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 8), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Center(
                              child: IconButton(
                                  onPressed: () {
                                    homeBloc.add(
                                        HomeEventWhishlistButtonClickedEvent(
                                            clickedProduct: productDataModel));
                                  },
                                  icon: const Icon(Icons.favorite_border)),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 50,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xffc8e755),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.7),
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 8), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Center(
                              child: IconButton(
                                  onPressed: () {
                                    homeBloc.add(
                                        HomeProductCartButtonClickedEvent(
                                            clickedProduct: productDataModel));
                                  },
                                  icon:
                                      const Icon(Icons.shopping_bag_outlined)),
                            ),
                          ),
                          // IconButton(
                          //     onPressed: () {
                          //       homeBloc.add(HomeProductCartButtonClickedEvent(clickedProduct: productDataModel));
                          //     },
                          //     icon: const Icon(Icons.shopping_bag_outlined)),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 250,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    //image: NetworkImage(productDataModel.imageUrl.toString())
                    image: AssetImage(productDataModel.imageUrl)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
