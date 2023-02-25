import 'package:flutter/material.dart';
import 'package:flutter_challenges/core/utilis/app_strings/app_strings_screen.dart';
import 'package:flutter_challenges/features/auth/changePassword/cubit/change_paswword_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/presentaion/widgets/default_button.dart';
import '../../../forgetPassword/presentation/views/forgot_pass_screen.dart';
import '../../../login/widgets/tff.dart';
import '../../../login/widgets/toast_screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const routeName = 'change_pass';

  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final   TextEditingController oldPasswordController = TextEditingController();
  final  TextEditingController newPasswordController = TextEditingController();
  final  TextEditingController confirmNewPasswordController = TextEditingController();
  final  formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => ChangePasswordCubit(),
      child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
          if (state is ChangePasswordSuccessState) {
            if (state.changePassModel.status) {
              print(state.changePassModel.message);
              showToast(
                  msg: state.changePassModel.message.toString(), state: ToastStates.SUCCESS);
            } else {
              print(state.changePassModel.message);
              showToast(
                  msg: state.changePassModel.message.toString(), state: ToastStates.ERROR);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(AppStrings.changePassword),
              centerTitle: true,
            ),
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 25),
                  child: Column(
                    children: [
                      SizedBox(height: 50,),
                      defaultFormField(
                        context: context,
                        validate: (value) {
                          if(value.isEmpty){
                            return AppStrings.required;
                          }
                          else if(value.length<6){
                            return AppStrings.shortPassword;
                          }
                          else return null ;
                        },
                        controller: oldPasswordController,
                        label: AppStrings.oldPassword,
                        type: TextInputType.name,
                        prefix: SizedBox(),
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          SizedBox(),
                          Spacer(),
                          InkWell(child: Text(AppStrings.forgetPassword),onTap: (){
                            Navigator.of(context).pushNamed(ForgotPassword.routeName);
                          },),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      defaultFormField(
                        context: context,
                        validate: (value) {
                          if(value.isEmpty){
                            return AppStrings.required;
                          }
                          else if(value.length<6){
                            return AppStrings.shortPassword;
                          }
                          else return null ;
                        },
                        controller: newPasswordController,
                        label: AppStrings.newPassword,
                        prefix: SizedBox(),
                        type: TextInputType.name,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      defaultFormField(
                        context: context,
                        validate: (value) {
                          if(value.isEmpty){
                            return AppStrings.required;
                          }
                         else if(newPasswordController.text != confirmNewPasswordController.text ){
                            return AppStrings.PasswordNotMatched;
                          }
                          else return null ;
                        },
                        controller: confirmNewPasswordController,
                        label: AppStrings.confirmNewPassword,
                        prefix: SizedBox(),
                        type: TextInputType.name,
                      ),
                      SizedBox(height: 30),
                      state is! ChangePasswordLoadingState?
                      MainButton(
                          text: AppStrings.updatePassword,
                          onPressed: () {
                             if (formKey.currentState!.validate()) {
                               ChangePasswordCubit.get(context).changePassword(
                                 currentPassword: oldPasswordController.text,
                                   newPassword: newPasswordController.text,
                               );
                          }
                        },
                      ):Center(child: CircularProgressIndicator(),),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
