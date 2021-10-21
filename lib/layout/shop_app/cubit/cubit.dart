import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/layout/shop_app/cubit/states.dart';
import 'package:flutter_challenges/models/shop_app/categories_model.dart';
import 'package:flutter_challenges/models/shop_app/change_favourites_model.dart';
import 'package:flutter_challenges/models/shop_app/favourites_model.dart';
import 'package:flutter_challenges/models/shop_app/home_model.dart';
import 'package:flutter_challenges/models/shop_app/login_model.dart';
import 'package:flutter_challenges/modules/shop_app/categories/categories_screen.dart';
import 'package:flutter_challenges/modules/shop_app/favoutites/favourites_screen.dart';
import 'package:flutter_challenges/modules/shop_app/products/products_screen.dart';
import 'package:flutter_challenges/modules/shop_app/settings/settings_screen.dart';
import 'package:flutter_challenges/shared/component/constants.dart';
import 'package:flutter_challenges/shared/network/remote/dio_helper.dart';
import 'package:flutter_challenges/shared/network/remote/end_points.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> bottomScreens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavouritesScreen(),
    SettingsScreen(),
  ];

  void changeBottomNav(int? index) {
    currentIndex = index!;
    emit(ShopChangeBottomNavState());
  }

   HomeModel? homeModel;
 late Map<int,dynamic> favourites={};

  void getHomeData() {
    emit(ShopLoadingHomeDataState());
    DioHelper.getData(url: HOME,token: token).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      homeModel!.data.products.forEach((element) {
        favourites.addAll({
          element.id:element.inFavorites
        });
      });
      print(favourites.toString());
      //  printFullText(homeModel!.data.banners[0].id.toString());
      // print(homeModel!.status);
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorHomeDataState(error));
    }
    );
  }

  CategoriesModel? categoriesModel;

  void getCategories()
  {
    DioHelper.getData(
      url: GET_CATEGORIES,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      print(categoriesModel!.status);
      emit(ShopSuccessCategoriesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorCategoriesState(error));
    });
  }

  ChangeFavouritesModel? changeFavouritesModel;
  void changeFavourites(int productId){
    favourites[productId] = !favourites[productId];
    emit(ShopChangeFavouritesState());
    DioHelper.postData(
      url: FAVOURITES,
      data: {
        "product_id":productId,
      },
      token: token,
    ).then((value) {
      changeFavouritesModel=ChangeFavouritesModel.fromJson(value.data);
      print(value.data);
      if (changeFavouritesModel!.status == false) {
        favourites[productId] = !favourites[productId];
      }
      else
      {
        getFavourites();
      }
      emit(ShopSuccessChangeFavouritesState(changeFavouritesModel!));
    }).catchError((error){
      favourites[productId] = !favourites[productId];
      emit(ShopErrorChangeFavouritesState());
    });
  }

  FavouritesModel? favouritesModel;
  void getFavourites() {
    emit(ShopLoadingGetFavouritesState());
    DioHelper.getData(url: FAVOURITES,token: token).then((value) {
      favouritesModel = FavouritesModel.fromJson(value.data);
      // printFullText(value.data.toString());
      emit(ShopSuccessGetFavouritesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorGetFavouritesState());
    });
  }

  ShopLoginModel? userModel;
  void getUserData() {
    emit(ShopLoadingUserDataState());
    DioHelper.getData(
      url: PROFILE,
      token: token,)
        .then((value)
    {
      userModel = ShopLoginModel.fromJson(value.data);
      // printFullText(userModel.data.email.toString());
      emit(ShopSuccessUserDataState(userModel!));
    }
    ).catchError((error) {
      print(error.toString());
      emit(ShopErrorUserDataState());
    });
  }


  void updateUserData({
    required String name,
    required String email,
    required String phone,
  }) {
    emit(ShopLoadingUpdateUserState());
    DioHelper.putData(
        url: UPDATE_PROFILE,
        token: token,
        data: {
          'name': name,
          'email': email,
          'phone': phone,
        }
    )
        .then((value)
    {
      userModel = ShopLoginModel.fromJson(value.data);
      // printFullText(userModel.data.email.toString());
      emit(ShopSuccessUpdateUserState(userModel!));
    }
    ).catchError((error) {
      print(error.toString());
      emit(ShopErrorUpdateUserState());
    });
  }

}
