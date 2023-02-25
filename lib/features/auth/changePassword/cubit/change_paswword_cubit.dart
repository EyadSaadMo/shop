import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/core/network/remote/dio_helper.dart';
import 'package:flutter_challenges/core/network/remote/end_points.dart';
import 'package:flutter_challenges/core/utilis/constants.dart';
import 'package:flutter_challenges/features/auth/changePassword/domain/model/change_pass_model.dart';
part 'change_paswword_state.dart';
class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitialState());
  static ChangePasswordCubit get(context) => BlocProvider.of(context);


  ChangePassModel? changePassModel;
  void changePassword({
    required String currentPassword,
    required String newPassword,
  }){
    emit(ChangePasswordLoadingState());
    DioHelper.postData(url: CHANGE_PASSWORD,
        data: {
      'current_password': currentPassword,
      'new_password': newPassword,
          token:token,
    }).then((value) {
      print(value.data);
      changePassModel = ChangePassModel.fromJson(value.data);
      emit(ChangePasswordSuccessState(changePassModel!));
    }).catchError((error){
      emit(ChangePasswordErrorState(error.toString()));
      print(error.toString());
    });
  }
}
