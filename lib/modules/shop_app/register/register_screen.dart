import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/layout/shop_app/shop_layout.dart';
import 'package:flutter_challenges/modules/shop_app/login/cubit/cubit.dart';
import 'package:flutter_challenges/modules/shop_app/login/shop_login_screen.dart';
import 'package:flutter_challenges/modules/shop_app/login/states.dart';
import 'package:flutter_challenges/shared/component/components.dart';
import 'package:flutter_challenges/shared/component/constants.dart';
import 'package:flutter_challenges/shared/network/local/cache_helper.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class ShopRegisterScreen extends StatelessWidget {
  const ShopRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    var phoneController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
        create: (context)=>ShopLoginCubit(),
      child: BlocConsumer<ShopRegisterCubit,ShopRegisterStates>(
          listener: (context, state) {
            if (state is ShopRegisterSuccessState) {
              if (state.loginModel!.status) {
                print(state.loginModel!.message);
                print(state.loginModel!.data.token);
                CacheHelper.saveData(
                    key: 'token', value: state.loginModel!.data.token)
                    .then((value) {
                  token = state.loginModel!.data.token;
                  navigateAndFinish(context, ShopLayout());
                });
              } else {
                print(state.loginModel!.status);
                showToast(
                  msg: state.loginModel!.message,
                  state: ToastStates.ERROR,
                );
              }
            }
          },
        builder: (context,state)=> Scaffold(
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
                      Text(
                        'Let\'s Get Started!',
                        style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Create an account of Q Affurs to get all features',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            defaultFormField(
                              validate: (value){
                                if(value!.isEmpty || value.trim().length == 0) {
                                  return 'required';
                                }
                                if(! RegExp(r"^([a-zA-Z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+\/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?)$").hasMatch(value)){
                                  return 'please enter valid email';
                                }
                                return null;
                              },
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              label: 'email',
                              prefix: Icons.email,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            defaultFormField(

                              validate: ( value) {
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
                                validate: ( value) {
                                  if (value.isEmpty) {
                                    return 'required';
                                  } else
                                    return null;
                                },
                                controller: passwordController,
                                type: TextInputType.visiblePassword,
                                label: 'password',
                                prefix: Icons.lock,
                                isPassword: ShopLoginCubit.get(context).isPassword,
                                suffix:  ShopLoginCubit.get(context).suffix,
                                suffixPressed: (){
                                  ShopLoginCubit.get(context).changePasswordVisibility();
                                }
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            defaultFormField(
                              validate: ( value) {
                                if (value != confirmPasswordController.text) {
                                  return 'Matching field';
                                } else
                                  return null;
                              },
                              controller: confirmPasswordController,
                              type: TextInputType.visiblePassword,
                              label: 'confirm password',
                              prefix: Icons.lock,
                                isPassword: ShopLoginCubit.get(context).isPassword,
                                suffix:  ShopLoginCubit.get(context).suffix,
                                suffixPressed: (){
                                  ShopLoginCubit.get(context).changePasswordVisibility();
                                }

                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      defaultButton(
                        text: 'create',
                        function: () {
                          if (formKey.currentState!.validate()) {
                            return;
                          } else {
                            formKey.currentState!.save();
                          }
                        },
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
                                navigateTo(context, ShopLoginScreen());
                              },
                              text: 'Login Here'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      )

    );
  }
}
