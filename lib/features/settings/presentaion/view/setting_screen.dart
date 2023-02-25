import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/core/utilis/app_strings/app_strings_screen.dart';
import 'package:flutter_challenges/features/orders/presentation/view/orders_screen.dart';
import 'package:flutter_challenges/features/profile/presentation/profile_cubit/profile_cubit.dart';
import 'package:flutter_challenges/features/settings/presentaion/view/widgets/setting_item.dart';
import '../../../../core/theme/theme_cubit.dart';
import '../../../../core/utilis/constants.dart';
import '../../../auth/changePassword/presntation/views/change_pass_screen.dart';
import '../../../profile/presentation/view/profile_screen.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName  = 'setting_screen';
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        title: Text(
          AppStrings.setting,
        ),
        actions: [
          IconButton(onPressed: (){
            ThemeCubit.get(context).changeAppMode();
          }, icon: Icon(Icons.light_mode_outlined,color: Theme.of(context).primaryIconTheme.color,)),
        ],
      ),

      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          nameController.text = ProfileCubit.get(context).userModel!.data.name;
          phoneController.text = ProfileCubit.get(context).userModel!.data.phone;
          emailController.text = ProfileCubit.get(context).userModel!.data.email;
          return Column(
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colors.deepPurpleAccent),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/person.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                          '${ProfileCubit.get(context).userModel!.data.name}',
                          style:Theme.of(context).textTheme.bodyText1,
                        ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                          '@${ProfileCubit.get(context).userModel!.data.email.replaceAll(' ', '').toLowerCase()}',
                          style:Theme.of(context).textTheme.subtitle1,
                        ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
                    SettingItem(text1: AppStrings.profile, text2: AppStrings.editAvatar,onPressed: (){Navigator.of(context).pushNamed(ProfileScreen.routeName);},),
                      SettingItem(text1: AppStrings.orders, text2: AppStrings.ordersDetails,onPressed: (){Navigator.of(context).pushNamed(OrdersScreen.routeName);},),
                      SettingItem(text1: AppStrings.changePassword, text2: AppStrings.updateAndChangePassword,onPressed: (){Navigator.of(context).pushNamed(ChangePasswordScreen.routeName);},),
              Center(child: ElevatedButton(style: TextButton.styleFrom(backgroundColor: Colors.red),onPressed: (){signOut(context);}, child: Text(AppStrings.logout)),),
            ],
          );
        },
      ),
    );
  }
}