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
class ShopIncreaseBNBState extends ShopStates {}

class ShopSuccessChangeFavoritesState extends ShopStates {
  final ChangeFavouritesModel model;

  ShopSuccessChangeFavoritesState(this.model);
}

class ShopErrorChangeFavoritesState extends ShopStates {}

class ShopChangeFavoritesState extends ShopStates {}

class ShopLoadingGetFavoritesDataState extends ShopStates {}

class ShopSuccessGetFavoritesDataState extends ShopStates {}

class ShopErrorGetFavoritesDataState extends ShopStates {}
