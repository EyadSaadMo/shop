import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/remote/dio_helper.dart';
import '../../../../core/network/remote/end_points.dart';
import '../../../../core/utilis/constants.dart';
import '../../../auth/login/data/model/login_model.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context)=>BlocProvider.of(context);

  LoginModel? userModel;
  void getUserData() {
    emit(UserDataLoadingState());
    DioHelper.getData(
      url: PROFILE,
      token: token,)
        .then((value)
    {
      userModel = LoginModel.fromJson(value.data);
      // printFullText(userModel.data.email.toString());
      emit(UserDataSuccessState(userModel!));
    }
    ).catchError((error) {
      print(error.toString());
      emit(UserDataErrorState());
    });
  }

}
