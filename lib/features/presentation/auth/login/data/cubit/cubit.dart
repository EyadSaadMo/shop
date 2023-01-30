
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/features/presentation/auth/login/domain/login_model.dart';

import '../../../../../../core/network/remote/dio_helper.dart';
import '../../../../../../core/network/remote/end_points.dart';
import '../../states.dart';

class LoginCubit extends Cubit<ShopLoginStates> {
  LoginCubit() : super(ShopLoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);

   LoginModel? loginModel;
  void userLogin({required String email, required String password}) {
    emit(ShopLoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value) {
      print(value.data);
      loginModel = LoginModel.fromJson(value.data);
      emit(ShopLoginSuccessState(loginModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopLoginErrorState(error.toString()));
    });
  }

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopChangePasswordVisibilityState());
  }
}
