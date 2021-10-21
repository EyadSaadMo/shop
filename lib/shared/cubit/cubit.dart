import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/shared/cubit/states.dart';
import 'package:flutter_challenges/shared/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
bool isDark = false;
// void changeAppMode({ bool? fromShared}){
//   if(fromShared != null)
//   {
//     isDark = fromShared;
//     emit(AppChangeModeState());
//   }
//   else {
//     isDark = !isDark;
//     CacheHelper.putBoolean(key: 'isDark', value: isDark);
//     emit(AppChangeModeState());
//   }
//   }
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(AppChangePasswordVisibilityState());
  }

}
