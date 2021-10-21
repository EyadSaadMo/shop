import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/layout/shop_app/cubit/cubit.dart';
import 'package:flutter_challenges/layout/shop_app/cubit/states.dart';
import 'package:flutter_challenges/shared/component/components.dart';
import 'package:flutter_challenges/shared/component/constants.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: ShopCubit.get(context).userModel != null,
          builder: (context) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        if (state is ShopSuccessUpdateUserState)
                          LinearProgressIndicator(),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultFormField(
                            label: ' Name',
                            prefix: Icons.person,
                            type: TextInputType.name,
                            controller: nameController,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'required';
                              }
                            }),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultFormField(
                            label: ' Email Address',
                            prefix: Icons.email_outlined,
                            type: TextInputType.emailAddress,
                            controller: emailController,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'required';
                              }
                            }),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultFormField(
                            label: 'phone',
                            prefix: Icons.phone,
                            type: TextInputType.number,
                            controller: phoneController,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'required';
                              }
                            }),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                ShopCubit.get(context).updateUserData(
                                    name: nameController.text,
                                    email: emailController.text,
                                    phone: phoneController.text);
                              }
                            },
                            text: 'update'),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultButton(
                            function: () {
                              signOut(context);
                            },
                            text: 'logout'),

                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
