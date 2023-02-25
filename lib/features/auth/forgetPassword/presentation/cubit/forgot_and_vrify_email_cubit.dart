import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/core/network/remote/dio_helper.dart';
import 'package:flutter_challenges/core/network/remote/end_points.dart';
import 'package:flutter_challenges/features/auth/changePassword/domain/model/change_pass_model.dart';
part 'forgot_and_vrify_email_state.dart';

class ForgotAndVerifyEmailCubit extends Cubit<ForgotAndVerifyEmailState> {
  ForgotAndVerifyEmailCubit() : super(ForgotAndVerifyEmailInitialState());
  static ForgotAndVerifyEmailCubit get(context) => BlocProvider.of(context);
  
  ChangePassModel? changePassModel;
  void sendEmail({required String email}){
    emit(ForgotAndVerifyEmailLoadingState());
    DioHelper.postData(url: VERIFY_EMAIL, data: {'email':email}).then((value) {
      changePassModel = ChangePassModel.fromJson(value.data);
      emit(ForgotAndVerifyEmailSuccessState(changePassModel!));
      print(value.data);
    }).catchError((error){
      emit(ForgotAndVerifyEmailErrorState(error.toString()));

      print(error.toString());
    });
  }

}
