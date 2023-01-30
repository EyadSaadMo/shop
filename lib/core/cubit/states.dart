import 'package:flutter_challenges/features/domain/change_favourites_model.dart';
import 'package:flutter_challenges/features/presentation/auth/login/domain/login_model.dart';

abstract class ShopStates {}

class ShopInitialState extends ShopStates {}
class ShopChangeBottomNavState extends ShopStates {}
class ShopLoadingHomeDataState extends ShopStates {}
class ShopSuccessHomeDataState extends ShopStates {}
class ShopErrorHomeDataState extends ShopStates {
  late final String error;
  ShopErrorHomeDataState(this.error);
}
class ShopSuccessCategoriesState extends ShopStates {}
class ShopErrorCategoriesState extends ShopStates {
  late final String error;
  ShopErrorCategoriesState(this.error);
}
class ShopSuccessChangeFavouritesState extends ShopStates{
 late final ChangeFavouritesModel model;

  ShopSuccessChangeFavouritesState(this.model);
}
class ShopErrorChangeFavouritesState extends ShopStates{}
class ShopChangeFavouritesState extends ShopStates{}
class ShopSuccessGetFavouritesState extends ShopStates{}
class ShopLoadingGetFavouritesState extends ShopStates{}
class ShopErrorGetFavouritesState extends ShopStates{}
class ShopSuccessUserDataState extends ShopStates{
  final LoginModel loginModel;

  ShopSuccessUserDataState(this.loginModel);
}
class ShopLoadingUserDataState extends ShopStates{}
class ShopErrorUserDataState extends ShopStates{}

class ShopSuccessUpdateUserState extends ShopStates{
  final LoginModel loginModel;

  ShopSuccessUpdateUserState(this.loginModel);
}
class ShopLoadingUpdateUserState extends ShopStates{}
class ShopErrorUpdateUserState extends ShopStates{}

class ShopLoadingProductDetailsState extends ShopStates {}
class ShopSuccessProductDetailsState extends ShopStates {}
class ShopErrorProductDetailsState extends ShopStates {
  late final String error;
  ShopErrorProductDetailsState(this.error);
}