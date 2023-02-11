import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/features/favoutites/data/model/change_favourites_model.dart';
import 'package:flutter_challenges/features/home/presentaion/cubit/states.dart';
import '../../../../core/network/remote/dio_helper.dart';
import '../../../../core/network/remote/end_points.dart';
import '../../../../core/style/constants.dart';
import '../../../categories/presentaion/view/categories_screen.dart';
import '../../../favoutites/data/model/favourites_model.dart';
import '../../../favoutites/presentaion/view/favorite_screen.dart';
import '../../../products/presentaion/view/products_screen.dart';
import '../../../settings/presentaion/view/setting_screen.dart';
import '../../data/model/home_model.dart';


class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void incIndex() {
    currentIndex++;
    emit(ShopIncreaseBNBState());
  }

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  List<Widget> bottomScreens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavouritesScreen(),
    SettingsScreen(),
  ];
  Map<int, bool> favorites = {};

  HomeModel? homeModel;

  void getModelData() {
    emit(ShopLoadingHomeDataState());
    DioHelper.getData(url: HOME, token: token).then((value) {
      homeModel = HomeModel.fromJson(value.data);

      homeModel!.data.products.forEach((element) {
        favorites.addAll({
          element.id: element.inFavorites,
        });
      });

      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorHomeDataState(error.toString()));
    });
  }
  ChangeFavouritesModel? changeFavoritesModel;

  void changeFavorites(int productId) {
    favorites[productId] = !favorites[productId]!;
    emit(ShopChangeFavoritesState());

    DioHelper.postData(
      url: FAVOURITES,
      data: {
        'product_id': productId,
      },
      token: token,
    ).then((value) {
      changeFavoritesModel = ChangeFavouritesModel.fromJson(value.data);

      if (!changeFavoritesModel!.status) {
        favorites[productId] = !favorites[productId]!;
      } else {
        getFavoritesData();
      }

      emit(ShopSuccessChangeFavoritesState(changeFavoritesModel!));
    }).catchError((error) {
      favorites[productId] = !favorites[productId]!;
      emit(ShopErrorChangeFavoritesState());
    });
  }

  FavouritesModel? favoritesModel;

  void getFavoritesData() {
    emit(ShopLoadingGetFavoritesDataState());

    DioHelper.getData(url: FAVOURITES, token: token).then((value) {
      favoritesModel = FavouritesModel.fromJson(value.data);
      emit(ShopSuccessGetFavoritesDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorGetFavoritesDataState());
    });
  }

  }


