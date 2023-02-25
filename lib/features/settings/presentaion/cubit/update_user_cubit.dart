import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/network/remote/dio_helper.dart';
import '../../../../core/network/remote/end_points.dart';
import '../../../../core/utilis/constants.dart';
import '../../../auth/login/data/model/login_model.dart';
part 'update_user_state.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  UpdateUserCubit() : super(UpdateUserInitial());
  static UpdateUserCubit get(context)=>BlocProvider.of(context);

  File? image;
  Future pickImage() async {
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      emit(UploadImagesLoadingState());
      if(image==null) return;
      final imageTemporary = File(image.path);
        this.image = imageTemporary;
        emit(ImageAssignedState());
    }on PlatformException catch(error){
      print('Failed to pick image $error');
    }
  }
  LoginModel? userModel;

  void updateUserData({
    required String name,
    required String email,
    required String phone,
    required String image,
  }) {
    emit(UpdateUserLoadingState());
    DioHelper.putData(
        url: UPDATE_PROFILE,
        data: {
          'name': name,
          'email': email,
          'phone': phone,
          'image': image,
        },
        token: token,
    )
        .then((value)
    {
      userModel = LoginModel.fromJson(value.data);
      emit(UpdateUserSuccessState(userModel!));
    }
    ).catchError((error) {
      print(error.toString());
      emit(UpdateUserErrorState());
    });
  }
}
