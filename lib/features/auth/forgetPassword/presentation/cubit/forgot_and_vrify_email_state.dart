part of 'forgot_and_vrify_email_cubit.dart';

abstract class ForgotAndVerifyEmailState extends Equatable {
  const ForgotAndVerifyEmailState();
}

class ForgotAndVerifyEmailInitialState extends ForgotAndVerifyEmailState {
  @override
  List<Object> get props => [];
}
class ForgotAndVerifyEmailLoadingState extends ForgotAndVerifyEmailState {
  @override
  List<Object> get props => [];
}
class ForgotAndVerifyEmailSuccessState extends ForgotAndVerifyEmailState {
   final ChangePassModel changePassModel;
  ForgotAndVerifyEmailSuccessState(this.changePassModel);
  @override
  List<Object> get props => [changePassModel];
}
class ForgotAndVerifyEmailErrorState extends ForgotAndVerifyEmailState {
  final String error;

  ForgotAndVerifyEmailErrorState(this.error);
  @override
  List<Object> get props => [];
}
