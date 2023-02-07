import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/features/presentation/settings/cubit/update_user_cubit.dart';
import 'package:flutter_challenges/features/presentation/settings/profile_cubit/profile_cubit.dart';
import '../../../core/cubit/cubit.dart';
import '../../../core/cubit/states.dart';
import '../../../core/style/constants.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/tff.dart';
class SettingsScreen extends StatelessWidget {
  static const routeName = 'settings';

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = ProfileCubit.get(context).userModel;
        nameController.text = model!.data.name;
        emailController.text = model.data.email;
        phoneController.text = model.data.phone;
        return ConditionalBuilder(
          condition: ProfileCubit.get(context).userModel != null,
          builder: (context) {
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
                            label: ' Name',
                            prefix: Icons.person,
                            type: TextInputType.name,
                            controller: nameController,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'required';
                              }
                              return null;
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
                              if(formKey.currentState!.validate())
                              {
                                UpdateUserCubit.get(context).updateUserData(
                                  name: nameController.text,
                                  phone: phoneController.text,
                                  email: emailController.text,
                                );
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
