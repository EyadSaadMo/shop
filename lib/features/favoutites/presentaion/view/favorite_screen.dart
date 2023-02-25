import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/core/style/colors.dart';
import 'package:flutter_challenges/core/utilis/app_strings/app_strings_screen.dart';
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
        return Scaffold(
          appBar: AppBar(title: Text(AppStrings.favorites,style: Theme.of(context).appBarTheme.titleTextStyle,),centerTitle: true,),
          body:
              state is! ShopLoadingGetFavoritesDataState?
               ((ShopCubit.get(context).favoritesModel!.data.data.length != 0)?
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                  color: Theme.of(context).appBarTheme.backgroundColor,

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
                        style:Theme.of(context).textTheme.bodyText1,
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
               )):
        Center(
        child: CircularProgressIndicator(
        color: defaultColor,
        ),
        ),
        );
          },
    );
  }
}

