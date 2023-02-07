import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/local/cache_helper.dart';
import '../../../../core/style/constants.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/text_button.dart';
import '../../../widgets/tff.dart';
import '../../../widgets/toast_screen.dart';
import '../../home/shop_layout.dart';
import '../login/data/cubit/cubit.dart';
import '../login/presentation/screens/shop_login_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

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
        child: BlocConsumer<RegisterCubit, ShopRegisterStates>(
          listener: (context, state) {
            if (state is ShopRegisterSuccessState) {
              if (state.loginModel.status) {
                // print(state.loginModel.message);
                // print(state.loginModel.data.token);
                CacheHelper.saveData(
                        key: 'token', value: state.loginModel.data.token)
                    .then((value) {
                  token = state.loginModel.data.token;
                  Navigator.of(context).pushReplacementNamed(
                      ShopLayout.routeName);
                });
              } else {
                print(state.loginModel.status);
                showToast(
                   msg: state.loginModel.message.toString(),
                  state: ToastStates.ERROR,
                );
              }
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
                        Text('REGISTER',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.black)),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'register now to browse our hot offers',
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
                                    return 'required';
                                  } else
                                    return null;
                                },
                                controller: nameController,
                                type: TextInputType.name,
                                label: 'Enter your name',
                                prefix: Icons.person,
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              defaultFormField(
                                validate: (value) {
                                  if (value!.isEmpty ||
                                      value.trim().length == 0) {
                                    return 'required';
                                  }
                                  if (!RegExp(
                                          r"^([a-zA-Z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+\/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?)$")
                                      .hasMatch(value)) {
                                    return 'Enter valid email';
                                  }
                                  return null;
                                },
                                controller: emailController,
                                type: TextInputType.emailAddress,
                                label: 'Enter your email',
                                prefix: Icons.email,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              defaultFormField(
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return 'required';
                                  } else
                                    return null;
                                },
                                controller: phoneController,
                                type: TextInputType.number,
                                label: 'phone',
                                prefix: Icons.phone,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              defaultFormField(
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return 'required';
                                    } else
                                      return null;
                                  },
                                  controller: passwordController,
                                  type: TextInputType.visiblePassword,
                                  label: 'password',
                                  prefix: Icons.lock,
                                  isPassword:
                                      LoginCubit.get(context).isPassword,
                                  suffix: LoginCubit.get(context).suffix,
                                  suffixPressed: () {
                                    LoginCubit.get(context)
                                        .changePasswordVisibility();
                                  }),
                              // SizedBox(
                              //   height: 20.0,
                              // ),
                              // defaultFormField(
                              //   validate: ( value) {
                              //     if (value != confirmPasswordController.text) {
                              //       return 'Matching field';
                              //     } else
                              //       return null;
                              //   },
                              //   controller: confirmPasswordController,
                              //   type: TextInputType.visiblePassword,
                              //   label: 'confirm password',
                              //   prefix: Icons.lock,
                              //     isPassword: ShopLoginCubit.get(context).isPassword,
                              //     suffix:  ShopLoginCubit.get(context).suffix,
                              //     suffixPressed: (){
                              //       ShopLoginCubit.get(context).changePasswordVisibility();
                              //     }
                              //
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        ConditionalBuilder(
                          condition: state is !ShopRegisterLoadingState,
                          builder: (context) => defaultButton(
                            text: 'Register',
                            function: () {
                              if (formKey.currentState!.validate()) {
                                RegisterCubit.get(context).userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,
                                );
                              } else {
                                formKey.currentState!.save();
                              }
                            },
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account?'),
                            defaultTextButton(
                                function: () {
                                 Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>LoginScreen()));
                                },
                                text: 'Login '),
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
