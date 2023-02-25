part of 'update_user_cubit.dart';

abstract class UpdateUserState extends Equatable {
}

class UpdateUserInitial extends UpdateUserState {
  @override
  List<Object> get props => [];
}
class UpdateUserLoadingState extends UpdateUserState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class UpdateUserSuccessState extends UpdateUserState{
  late final LoginModel loginModel;

  UpdateUserSuccessState(this.loginModel);

  @override
  // TODO: implement props
  List<Object?> get props => [loginModel];
}
class UpdateUserErrorState extends UpdateUserState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class ImageAssignedState extends UpdateUserState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class UploadImagesLoadingState extends UpdateUserState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}