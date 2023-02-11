import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/core/utilis/app_strings/app_strings_screen.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import '../../../home/presentaion/cubit/cubit.dart';
import '../../../home/presentaion/cubit/states.dart';
import '../widgets/favorite_item.dart';

class FavouritesScreen extends StatelessWidget {
  static const routeName = 'favorites';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Conditional.single(
            context: context,
            conditionBuilder: (context) =>
            state is! ShopLoadingGetFavoritesDataState,
            fallbackBuilder: (context) => Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurple,
              ),
            ),
            widgetBuilder: (context) {
              return (ShopCubit.get(context).favoritesModel!.data.data.length != 0)
                  ? Container(
                color: Colors.grey[100],
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => FavoriteItem(
                    model:
                      ShopCubit.get(context)
                          .favoritesModel!
                          .data
                          .data[index],
                      ),
                  separatorBuilder: (context, index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    height: 1,
                    color: Colors.grey[300],
                  ),
                  itemCount: ShopCubit.get(context)
                      .favoritesModel!
                      .data
                      .data
                      .length,
                ),
              )
                  : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      child: Image.asset(
                        'assets/images/empty_favorites.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      AppStrings.noFavorite,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Text(
                            AppStrings.clickHere,
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            ShopCubit.get(context).changeBottomNavBar(0);
                          },
                        ),
                        Text(
                          AppStrings.seeProduct,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            });
      },
    );
  }
}

