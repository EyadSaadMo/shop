import 'package:flutter/material.dart';
import 'package:flutter_challenges/core/network/local/cache_helper.dart';
import 'package:flutter_challenges/core/utilis/app_strings/app_strings_screen.dart';
import 'package:flutter_challenges/features/auth/forgetPassword/presentation/cubit/forgot_and_vrify_email_cubit.dart';
import 'package:flutter_challenges/features/auth/login/presentaion/view/login_screen.dart';
import 'package:flutter_challenges/features/auth/login/widgets/tff.dart';
import 'package:flutter_challenges/features/home/presentaion/widgets/default_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/enums/enums.dart';
import '../../../../../core/network/remote/end_points.dart';
import '../../../../checkout/presentation/widgets/alert_snackbar.dart';

class ForgotPassword extends StatefulWidget {
  static const routeName = 'forgot_password';
   ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  VerifyStatus status = VerifyStatus.forgotPassword;
  final TextEditingController inputController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => ForgotAndVerifyEmailCubit(),
  child: BlocConsumer<ForgotAndVerifyEmailCubit, ForgotAndVerifyEmailState>(
  listener: (context, state) {
    if (state is ForgotAndVerifyEmailSuccessState) {
      showSnackbar(
          state.changePassModel.message, context, Colors.green);
    } else if (state is ForgotAndVerifyEmailErrorState)
      showSnackbar(
        state.error, context, Colors.red);
  },
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        title: Text(status==VerifyStatus.forgotPassword?AppStrings.forgotPassword:AppStrings.verifyEmail),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 25),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 50,),
              Text( status == VerifyStatus.forgotPassword
                  ? AppStrings.enterEmailAddress
                  : AppStrings.enterLink),
                SizedBox(height: 25,),
                status == VerifyStatus.forgotPassword?
                defaultFormField(label: AppStrings.email, prefix: SizedBox(), type: TextInputType.emailAddress, controller: inputController, validate: (value){
                  if (value!.isEmpty) {
                    return AppStrings.required;
                  } else {
                    if (!value.contains('@')) {
                      return AppStrings.invalidEmail;
                    }
                  }
                  return null;
                }, context: context):
                defaultFormField(label: AppStrings.code, prefix: SizedBox(), type: TextInputType.name, controller: inputController, validate: (value){ if (value!.isEmpty) {
                  return AppStrings.required;
                } else {
                  if (value.length < 9) {
                    return AppStrings.invalidCode;
                  }
                }
                return null;}, context: context),
                SizedBox(height: 25,),
                state is ForgotAndVerifyEmailLoadingState?Center(child: CircularProgressIndicator(),):
                status == VerifyStatus.forgotPassword?
                MainButton(text: AppStrings.send, onPressed: (){
                  if(formKey.currentState!.validate()){
                    ForgotAndVerifyEmailCubit.get(context).sendEmail(email: inputController.text);
                    formKey.currentState!.reset();
                  }
                }):
                MainButton(text: AppStrings.send, onPressed: (){
                  if(formKey.currentState!.validate()){
                    CacheHelper.saveData(key: 'code', value: inputController.text);
                    code = CacheHelper.getData(key: 'code');
                    Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                  }
                })
            ],),
          ),
        ),
      ),
    );
  },
),
);
  }
}
