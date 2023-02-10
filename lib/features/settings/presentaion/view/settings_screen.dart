import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/core/utilis/app_strings/app_strings_screen.dart';
import '../../../../../core/style/constants.dart';

import '../../../auth/login/widgets/custom_button.dart';
import '../../../auth/login/widgets/tff.dart';
import '../cubit/update_user_cubit.dart';
import '../profile_cubit/profile_cubit.dart';
class SettingsScreen extends StatelessWidget {
  static const routeName = 'settings';

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = ProfileCubit.get(context).userModel;
        nameController.text = model!.data.name;
        emailController.text = model.data.email;
        phoneController.text = model.data.phone;
        if( ProfileCubit.get(context).userModel != null)
            return Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        if (state is UpdateUserLoadingState)
                          LinearProgressIndicator(),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultFormField(
                            label: AppStrings.name,
                            prefix: Icons.person,
                            type: TextInputType.name,
                            controller: nameController,
                            validate: (value) {
                              if (value.isEmpty) {
                                return AppStrings.required;
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultFormField(
                            label: AppStrings.emailAddress,
                            prefix: Icons.email_outlined,
                            type: TextInputType.emailAddress,
                            controller: emailController,
                            validate: (value) {
                              if (value.isEmpty) {
                                return AppStrings.required;
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultFormField(
                            label: AppStrings.phone,
                            prefix: Icons.phone,
                            type: TextInputType.number,
                            controller: phoneController,
                            validate: (value) {
                              if (value.isEmpty) {
                                return AppStrings.required;
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultButton(
                            function: () {
                              if(formKey.currentState!.validate())
                              {
                                UpdateUserCubit.get(context).updateUserData(
                                  name: nameController.text,
                                  phone: phoneController.text,
                                  email: emailController.text,
                                );
                              }
                            },
                            text: AppStrings.update),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultButton(
                            function: () {
                              signOut(context);
                            },
                            text: AppStrings.logout),

                      ],
                    ),
                  ),
                ),
              ),
            );
        else return Center(child: CircularProgressIndicator());
      },
        );
      }
}
