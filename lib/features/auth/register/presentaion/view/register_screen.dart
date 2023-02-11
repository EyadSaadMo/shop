import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/core/utilis/app_strings/app_strings_screen.dart';
import 'package:flutter_challenges/features/home/presentaion/widgets/default_button.dart';
import '../../../../../core/network/local/cache_helper.dart';
import '../../../../../core/utilis/constants.dart';
import '../../../../home/presentaion/view/shop_layout.dart';
import '../../../login/presentaion/view/login_screen.dart';
import '../../../login/widgets/text_button.dart';
import '../../../login/widgets/tff.dart';
import '../../../login/widgets/toast_screen.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = 'register';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
        create: (context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit,RegisterStates>(
          listener: (context, state) {
            if (state is RegisterSuccessState) {
              if (state.registerModel.status) {
                print(state.registerModel.message);
                print(state.registerModel.registerDataModel!.token);
                CacheHelper.saveData(
                        key: 'token', value: state.registerModel.registerDataModel!..token)
                    .then((value) {
                  token = state.registerModel.registerDataModel!.token;
                  Navigator.of(context).pushReplacementNamed(
                      Layout.routeName);
                });
              }
              else {
                print(state.registerModel.status);
                showToast(
                  msg: state.registerModel.message.toString(),
                  state: ToastStates.ERROR,
                );
              }
            }
            else if(state is RegisterErrorState){
              showToast(msg: state.error, state: ToastStates.ERROR);
            }

          },
          builder: (context, state) => Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.black,
                  )),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(AppStrings.register,
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.black)),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          AppStrings.registerDesc,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              defaultFormField(
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return AppStrings.required;
                                  }
                                  else if(value.length<3){
                                    return AppStrings.nameError;
                                  }
                                    return null;
                                },
                                controller: nameController,
                                type: TextInputType.name,
                                label: AppStrings.enterName,
                                prefix: Icons.person,
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              defaultFormField(
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
                                prefix: Icons.email_outlined,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              defaultFormField(
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return AppStrings.required;
                                  } else if(value.length<5){
                                    return AppStrings.phoneError;
                                  }
                                    return null;
                                },
                                controller: phoneController,
                                type: TextInputType.number,
                                label: AppStrings.phone,
                                prefix: Icons.phone,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              defaultFormField(
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return AppStrings.required;
                                    } else if(value.length<5){
                                      return AppStrings.shortPassword;
                                    }
                                      return null;
                                  },
                                  controller: passwordController,
                                  type: TextInputType.visiblePassword,
                                  label: AppStrings.password,
                                  prefix: Icons.lock,
                                  isPassword:
                                      RegisterCubit.get(context).isPassword,
                                  suffix: RegisterCubit.get(context).suffix,
                                  suffixPressed: () {
                                    RegisterCubit.get(context)
                                        .changePasswordVisibility();
                                  }),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        if(state is !RegisterLoadingState)
                          MainButton(
                            label: AppStrings.register,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                RegisterCubit.get(context).userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,
                                );
                                Navigator.of(context).pushReplacementNamed(
                                    LoginScreen.routeName);
                              }
                            },
                          )
                        else Center(child: CircularProgressIndicator()),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(AppStrings.haveAccount),
                            MainTextButton(
                                function: () {
                                 Navigator.of(context).pushNamed(LoginScreen.routeName);
                                },
                                text: AppStrings.login),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
