import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/features/presentation/auth/login/domain/login_model.dart';
import 'package:flutter_challenges/features/presentation/auth/register/cubit/states.dart';

import '../../../../../core/network/remote/dio_helper.dart';
import '../../../../../core/network/remote/end_points.dart';


class RegisterCubit extends Cubit<ShopRegisterStates> {
  RegisterCubit() : super(ShopRegisterInitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;
  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(ShopRegisterLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
    ).then((value) {
      print(value.data);

      loginModel = LoginModel.fromJson(value.data);
      emit(ShopRegisterSuccessState(loginModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopRegisterErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopRegisterChangePasswordVisibilityState());
  }
}
