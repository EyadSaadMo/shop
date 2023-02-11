


import '../../data/model/login_model.dart';

abstract class LoginStates{

}
class ShopLoginInitialState extends LoginStates{}
class ShopLoginLoadingState extends LoginStates{}
class ShopLoginSuccessState extends LoginStates{
  late final LoginModel loginModel;
  ShopLoginSuccessState(this.loginModel);
}
class ShopLoginErrorState extends LoginStates{
  late final String error;
  ShopLoginErrorState(this.error);
}
class ShopChangePasswordVisibilityState extends LoginStates{}
class ChangeRememberMeCheckBoxState extends LoginStates{}