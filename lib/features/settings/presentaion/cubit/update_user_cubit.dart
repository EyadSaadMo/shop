import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/remote/dio_helper.dart';
import '../../../../core/network/remote/end_points.dart';
import '../../../../core/utilis/constants.dart';
import '../../../auth/login/data/model/login_model.dart';
part 'update_user_state.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  UpdateUserCubit() : super(UpdateUserInitial());
  static UpdateUserCubit get(context)=>BlocProvider.of(context);

  LoginModel? userModel;

  void updateUserData({
    required String name,
    required String email,
    required String phone,
  }) {
    emit(UpdateUserLoadingState());
    DioHelper.putData(
        url: UPDATE_PROFILE,
        token: token,
        data: {
          'name': name,
          'email': email,
          'phone': phone,
        }
    )
        .then((value)
    {
      userModel = LoginModel.fromJson(value.data);
      // printFullText(userModel.data.email.toString());
      emit(UpdateUserSuccessState(userModel!));
    }
    ).catchError((error) {
      print(error.toString());
      emit(UpdateUserErrorState());
    });
  }
}
