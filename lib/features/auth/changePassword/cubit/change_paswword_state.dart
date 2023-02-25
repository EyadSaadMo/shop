part of 'change_paswword_cubit.dart';

abstract class ChangePasswordState extends Equatable {
  const ChangePasswordState();
}

class ChangePasswordInitialState extends ChangePasswordState {
  @override
  List<Object> get props => [];
}
class ChangePasswordLoadingState extends ChangePasswordState {
  @override
  List<Object> get props => [];
}
class ChangePasswordSuccessState extends ChangePasswordState {
 late final ChangePassModel changePassModel;
 ChangePasswordSuccessState(this.changePassModel);
  @override
  List<Object> get props => [changePassModel];
}
class ChangePasswordErrorState extends ChangePasswordState {
 late final String error;
 ChangePasswordErrorState(this.error);
  @override
  List<Object> get props => [error];
}
