import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/core/style/colors.dart';
import 'package:flutter_challenges/core/utilis/app_strings/app_strings_screen.dart';
import 'package:flutter_challenges/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flutter_challenges/features/cart/widgets/added_to_cart_item.dart';
import 'package:flutter_challenges/features/details/presentaion/cubit/details_cubit.dart';
import '../../../cart/presentation/view/shopping_cart.dart';
import '../../../home/presentaion/cubit/cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../cubit/details_state.dart';

class ProductDetails extends StatelessWidget {

  static const String routeName = '/product_details';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsCubit, DetailsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var product =
            DetailsCubit.get(context).productDetailsModel!.productModel;
        var pageController = PageController();
        int pageIndex = 0;
        String productPrice = product.price.toString();
        return Scaffold(
          body: state is! LoadingGetProductDetailsState && product == null
              ?Center(
            child: CircularProgressIndicator(),
          ):
          SafeArea(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 400,
                            color: Theme.of(context).appBarTheme.backgroundColor,
                            child: PageView.builder(
                              controller: pageController,
                              itemBuilder: (context, index) {
                                pageIndex = index;
                                return ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30.0),
                                    bottomRight: Radius.circular(30.0),
                                  ),
                                  child: Image.network(
                                    '${product.images[index]}',
                                  ),
                                );
                              },
                              physics: BouncingScrollPhysics(),
                              itemCount: product.images.length,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color:Theme.of(context).appBarTheme.backgroundColor,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      SmoothPageIndicator(
                        controller: pageController,
                        count: product.images.length,
                        effect: SlideEffect(
                          activeDotColor: defaultColor,
                          dotColor: Colors.grey,
                          dotHeight: 10,
                          dotWidth: 10,
                          spacing: 5.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.name,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                productPrice.length == 5
                                                    ? '${productPrice.substring(0, 2)},${productPrice.substring(2, productPrice.length)} ${AppStrings.lE}'
                                                    : '$productPrice ${AppStrings.lE}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2!
                                                    .copyWith(fontSize: 25),
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              if (product.discount != 0)
                                                Text(
                                                  '${product.oldPrice}${AppStrings.lE}',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    fontSize: 20.0,
                                                  ),
                                                ),
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 5.0, top: 5.0),
                                            width: 40.0,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: Center(
                                              child: IconButton(
                                                icon: Icon(
                                                  ShopCubit.get(context)
                                                              .favorites[
                                                          product.id]!
                                                      ? Icons.favorite
                                                      : Icons.favorite_border,
                                                ),
                                                color: ShopCubit.get(context)
                                                        .favorites[product.id]!
                                                    ? defaultColor
                                                    : Colors.grey,
                                                onPressed: () {
                                                  ShopCubit.get(context)
                                                      .changeFavorites(
                                                          product.id);
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Text(
                                        AppStrings.description,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Container(
                                        height: 120.0,
                                        width: double.infinity,
                                        padding: EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                          color:Theme.of(context).appBarTheme.backgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: SingleChildScrollView(
                                          child: Text(
                                            product.description,
                                           style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: AddedToCart(
                                label: AppStrings.addToCart,
                                onPressed: () {
                                  CartCubit.get(context)
                                      .addProductToCart(product.id);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: const Text(
                                          AppStrings.addToCartSuccess),
                                      action: SnackBarAction(
                                        textColor: Colors.white,
                                        label: AppStrings.goToCart,
                                        onPressed: () {
                                          CartCubit.get(context)
                                              .getInCartProducts();
                                          Navigator.of(context).pushNamed(
                                            ShoppingCart.routeName,
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                  print(AppStrings.addToCart);
                                }),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                    ],
                  ),
                ),

        );
      },
    );
  }
}
