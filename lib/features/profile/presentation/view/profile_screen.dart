import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utilis/app_strings/app_strings_screen.dart';
import '../../../auth/login/widgets/tff.dart';
import '../../../home/presentaion/widgets/default_button.dart';
import '../../../settings/presentaion/cubit/update_user_cubit.dart';
import '../profile_cubit/profile_cubit.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = '/profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  @override
  void initState() {
    nameController.text = ProfileCubit.get(context).userModel!.data.name;
    phoneController.text = ProfileCubit.get(context).userModel!.data.phone;
    emailController.text = ProfileCubit.get(context).userModel!.data.email;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return BlocConsumer<UpdateUserCubit, UpdateUserState>(
      listener: (context, state) {},
      builder: (context, state) {
        UpdateUserCubit cubit = UpdateUserCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppStrings.profile,
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            physics: BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(height: 100,width: 115),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // image: DecorationImage(
                            //   image: AssetImage('assets/images/person.jpg'),
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                           child: cubit.image != null?Image.file(cubit.image!): Image.asset('assets/images/person.jpg'),
                        ),
                        Positioned(
                            bottom: 30,
                            top: 10,
                            right: 0,
                            child: InkWell(
                              onTap: (){
                           cubit.pickImage();
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.teal,
                                  shape: BoxShape.circle
                                ),
                                  child: Icon(Icons.camera_alt_outlined,color: Colors.white,),),
                            )),
                      ],
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${ProfileCubit.get(context).userModel!.data.name}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          '@${ProfileCubit.get(context).userModel!.data.email.replaceAll(' ', '').toLowerCase()}',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Column(
                      children: [
                        defaultFormField(
                          context: context,
                          validate: (value) {
                            return null;
                          },
                          controller: nameController,
                          label: AppStrings.name,
                          prefix: Container(
                            child: Icon(
                              Icons.person,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ),
                          type: TextInputType.name,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                          context: context,
                          validate: (value) {
                            return null;
                          },
                          controller: emailController,
                          label: AppStrings.emailAddress,
                          prefix: Container(
                            child: Icon(
                              Icons.email_outlined,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ),
                          type: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                          context: context,
                          validate: (value) {
                            return null;
                          },
                          controller: phoneController,
                          label: AppStrings.phone,
                          prefix: Container(
                            child: Icon(
                              Icons.phone_outlined,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ),
                          type: TextInputType.phone,
                        ),
                        SizedBox(height: 30),
                        MainButton(
                          text: AppStrings.update,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              UpdateUserCubit.get(context).updateUserData(
                                name: nameController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                                image: 'https://e7.pngegg.com/pngimages/799/987/png-clipart-computer-icons-avatar-icon-design-avatar-heroes-computer-wallpaper-thumbnail.png',
                              );
                            }
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        if (state is UpdateUserLoadingState)
                          LinearProgressIndicator(
                            color: Colors.teal,
                          ),
                      ],
                    ),
                  ]),
            ),
          ),
        );
      },
    );
  }
}
