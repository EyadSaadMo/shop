import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/features/cart/data/model/cart_model.dart';
import 'package:flutter_challenges/features/cart/data/model/change_cart_model.dart';
import 'package:flutter_challenges/features/favoutites/data/model/change_favourites_model.dart';
import 'package:flutter_challenges/features/home/presentaion/cubit/states.dart';
import '../../../../core/network/remote/dio_helper.dart';
import '../../../../core/network/remote/end_points.dart';
import '../../../../core/style/constants.dart';
import '../../../cart/presentation/view/cart_screen.dart';
import '../../../categories/presentaion/view/categories_screen.dart';

import '../../../favoutites/data/model/favourites_model.dart';
import '../../../favoutites/presentaion/view/favourites_screen.dart';
import '../../../products/presentaion/view/products_screen.dart';
import '../../../settings/presentaion/view/settings_screen.dart';
import '../../data/model/home_model.dart';


class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> bottomScreens = [
    ProductsScreen(),
    CategoriesScreen(),
    CartScreen(),
    FavouritesScreen(),
    SettingsScreen(),
  ];

  void changeBottomNav(int? index) {
    currentIndex = index!;
    emit(ShopChangeBottomNavState());
  }

   HomeModel? homeModel;
 late Map<int,dynamic> favourites={};
  late Map<int,dynamic> cart={};

  void getHomeData() {
    emit(ShopLoadingHomeDataState());
    DioHelper.getData(url: HOME,token: token).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      homeModel!.data.products.forEach((element) {
        cart.addAll({
          element.id:element.inCart
        });
        favourites.addAll({
          element.id:element.inFavorites,
        });
      });
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorHomeDataState(error));
    }
    );
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
  int counter = 1;
  bool isCartEnabled = false;
  void increment(){
    counter++;
    emit(CartIncrementCounter());
  }
  void decrement(){
    counter--;
    emit(CartDecrementCounter());
  }

  CartModel? cartModel;
  void getCart(){
    emit(ShopLoadingGetCartsState());
    DioHelper.getData(url: CART,token: token).then((value) {
      cartModel= CartModel.fromJson(value.data);
      // printFullText(value.data.toString());
      emit(ShopSuccessGetCartsState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorGetCartsState());
    });
  }

  ChangeCartModel? changeCartModel;
  void addOrDeleteCartItem(int cartId){
    cart[cartId] = !cart[cartId];
    emit(ShopChangeCartState());
    DioHelper.postData(url: CART,
        data: {
          "product_id":cartId,
        },token: token
    ).then((value){
      changeCartModel = ChangeCartModel.fromJson(value.data);
      print(value.data);
      if(changeCartModel!.status == false ){
        cart[cartId] = !cart[cartId];
      }
      else{
        getCart();
      }
      emit(ShopSuccessChangeCartStates(changeCartModel!));

    }).catchError((error){
      cart[cartId] = !cart[cartId];
      emit(ShopErrorChangeShopStates());

    });

  }
}

