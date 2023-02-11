import 'package:flutter_challenges/features/auth/register/data/register_model.dart';
abstract class RegisterStates{}
class RegisterInitialState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{}
class RegisterSuccessState extends RegisterStates{
  late final RegisterModel registerModel;

  RegisterSuccessState(this.registerModel);
}
class RegisterErrorState extends RegisterStates{
  final String error;

  RegisterErrorState(this.error);
}
class RegisterChangePasswordVisibilityState extends RegisterStates{}
class ChangeRememberMeCheckBoxState extends RegisterStates{}