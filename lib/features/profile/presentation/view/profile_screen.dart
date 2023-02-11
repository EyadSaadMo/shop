import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/features/auth/login/widgets/text_button.dart';

import '../../../../core/utilis/app_strings/app_strings_screen.dart';
import '../../../auth/login/widgets/tff.dart';
import '../../../settings/presentaion/cubit/update_user_cubit.dart';
import '../profile_cubit/profile_cubit.dart';


class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var emailController = TextEditingController();
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        nameController.text = ProfileCubit.get(context).userModel!.data.name;
        phoneController.text = ProfileCubit.get(context).userModel!.data.phone;
        emailController.text = ProfileCubit.get(context).userModel!.data.email;
        return Scaffold(
          appBar: AppBar(
            title: Text(AppStrings.profile),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            physics: BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.deepPurpleAccent),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/eyad.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${ProfileCubit.get(context).userModel!.data.name}',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                          Text(
                            '@${ProfileCubit.get(context).userModel!.data.name.replaceAll(' ', '').toLowerCase()}',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Column(
                    children: [
                      defaultFormField(
                        validate: (value){return null;},
                        controller: nameController,
                        label: AppStrings.name,
                        prefix: Icons.person,
                        type: TextInputType.name,
                      ),
                      SizedBox(height: 15,),
                      defaultFormField(
                        validate: (value){return null;},
                        controller: emailController,
                        label: AppStrings.emailAddress,
                        prefix: Icons.email,
                        type: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 15,),
                      defaultFormField(
                        validate: (value){return null;},
                        controller: phoneController,
                        label: AppStrings.phone,
                        prefix: Icons.phone,
                        type: TextInputType.phone,
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  MainTextButton(
                    text: AppStrings.update,
                    function: () {
                      if (formKey.currentState!.validate()) {
                        UpdateUserCubit.get(context).updateUserData(
                          name: nameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  if (state is LoadingUpdateProfileDataState)
                    LinearProgressIndicator(
                      color: Colors.deepPurpleAccent,
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}