part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class UserDataLoadingState extends ProfileState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class UserDataErrorState extends ProfileState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class LoadingUpdateProfileDataState extends ProfileState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class UserDataSuccessState extends ProfileState{
 late final LoginModel loginModel;

 UserDataSuccessState(this.loginModel);

  @override
  // TODO: implement props
  List<Object?> get props =>[loginModel];
}

