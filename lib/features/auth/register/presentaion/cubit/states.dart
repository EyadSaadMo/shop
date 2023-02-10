import '../../../login/data/model/login_model.dart';
abstract class RegisterStates{}
class RegisterInitialState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{}
class RegisterSuccessState extends RegisterStates{
  late final LoginModel loginModel;

  RegisterSuccessState(this.loginModel);
}
class RegisterErrorState extends RegisterStates{
  final String error;

  RegisterErrorState(this.error);
}
class RegisterChangePasswordVisibilityState extends RegisterStates{}