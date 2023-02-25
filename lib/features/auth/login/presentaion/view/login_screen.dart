import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/core/utilis/app_strings/app_strings_screen.dart';
import 'package:flutter_challenges/features/home/presentaion/widgets/default_button.dart';
import '../../../../../core/network/local/cache_helper.dart';
import '../../../../../core/style/colors.dart';
import '../../../../home/presentaion/view/shop_layout.dart';
import '../../../forgetPassword/presentation/views/forgot_pass_screen.dart';
import '../../../register/presentaion/view/register_screen.dart';
import '../../widgets/tff.dart';
import '../../widgets/toast_screen.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
   final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is ShopLoginSuccessState) {
            if (state.loginModel.status) {
              // print(state.loginModel.message);
              // print(state.loginModel.data.token);
              CacheHelper.saveData(
                      key: 'token', value: state.loginModel.data.token)
                  .then((value) {
                Navigator.of(context).pushReplacementNamed(
                    Layout.routeName);
              });
            } else {
              print(state.loginModel.message);
              showToast(
                  msg: state.loginModel.message.toString(), state: ToastStates.ERROR);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Form(
              key: formKey,
              child: Center(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppStrings.login,
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.black)),
                        Text(
                          AppStrings.loginDesc,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: double.infinity,
                          child: defaultFormField(
                            context: context,
                            validate: (value) {
                              if (value!.isEmpty || value.trim().length == 0) {
                                return AppStrings.required;
                              }
                              if(!value.contains('@'))
                              {
                                return AppStrings.invalidEmail;
                              }
                              return null;
                            },
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            label: AppStrings.email,
                            prefix: Container(child:  Icon(Icons.email_outlined,color: Theme.of(context).textTheme.bodyText1!.color,),),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultFormField(
                          context: context,
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          suffix: LoginCubit.get(context).suffix,
                          onFieldSubmit: (value) {
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          isPassword: LoginCubit.get(context).isPassword,
                          suffixPressed: () {
                            LoginCubit.get(context)
                                .changePasswordVisibility();
                          },
                          validate: (value) {
                            if (value.isEmpty) {
                              return AppStrings.passwordError;
                            }
                            else
                            {
                              if (value.length<6) {
                                return AppStrings.shortPassword;
                              }
                            }
                            return null;
                          },
                          label: AppStrings.password,
                          prefix: Container(child:  Icon(Icons.lock_outline,color: Theme.of(context).textTheme.bodyText1!.color,),),
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
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: LoginCubit.get(context).rememberMe,
                              onChanged: (value) {
                                LoginCubit.get(context)..changeRememberMeCheckBox();
                              },
                            ),
                            InkWell(
                              child: Text(
                                'Remember me',
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                              onTap: () {
                                LoginCubit.get(context).changeRememberMeCheckBox();
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        if(state is! ShopLoginLoadingState)
                         MainButton(text: AppStrings.login,
                             onPressed: (){
                               if (formKey.currentState!.validate()) {
                                 LoginCubit.get(context).userLogin(
                                     email: emailController.text,
                                     password: passwordController.text);
                               }
                             })
                        else Center(child: CircularProgressIndicator(color: defaultColor,)),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(AppStrings.dontHaveAccount,style: Theme.of(context).textTheme.bodyText1,),
                            TextButton(
                                onPressed: () {
                                 Navigator.of(context).pushNamed(RegisterScreen.routeName);
                                },
                                child: Text(AppStrings.RegisterNow),),
                          ],
                        ),
                      ],
                    ),
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