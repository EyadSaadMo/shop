import 'package:flutter_challenges/features/cart/data/model/change_cart_model.dart';
import 'package:flutter_challenges/features/favoutites/data/model/change_favourites_model.dart';

abstract class ShopStates {}

class ShopInitialState extends ShopStates {}
class ShopChangeBottomNavState extends ShopStates {}
class ShopLoadingHomeDataState extends ShopStates {}
class ShopSuccessHomeDataState extends ShopStates {}
class ShopErrorHomeDataState extends ShopStates {
  late final String error;
  ShopErrorHomeDataState(this.error);
}
class ShopSuccessChangeFavouritesState extends ShopStates{
 late final ChangeFavouritesModel model;

  ShopSuccessChangeFavouritesState(this.model);
}
class ShopErrorChangeFavouritesState extends ShopStates{}
class ShopChangeFavouritesState extends ShopStates{}
class ShopSuccessGetFavouritesState extends ShopStates{}
class ShopSuccessGetCartsState extends ShopStates{}
class ShopLoadingGetFavouritesState extends ShopStates{}
class ShopLoadingGetCartsState extends ShopStates{}
class ShopErrorGetFavouritesState extends ShopStates{}
class ShopErrorGetCartsState extends ShopStates{}




class CartInitial extends ShopStates {
  @override
  List<Object> get props => [];
}
class CartIncrementCounter extends ShopStates {
  @override
  List<Object> get props => [];
}
class CartDecrementCounter extends ShopStates {
  @override
  List<Object> get props => [];
}
class ShopChangeCartState extends ShopStates {
  @override
  List<Object> get props => [];
}
class ShopErrorChangeShopStates extends ShopStates {
  @override
  List<Object> get props => [];
}
class ShopSuccessChangeCartStates extends ShopStates {
  final ChangeCartModel changeCartModel;
  ShopSuccessChangeCartStates(this.changeCartModel);
  @override
  // TODO: implement props
  List<Object?> get props => [changeCartModel];}