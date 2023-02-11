import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/core/utilis/app_strings/app_strings_screen.dart';
import 'package:flutter_challenges/features/auth/login/widgets/text_button.dart';
import 'package:flutter_challenges/features/profile/presentation/profile_cubit/profile_cubit.dart';
import 'package:flutter_challenges/features/settings/presentaion/cubit/update_user_cubit.dart';
import 'package:flutter_challenges/features/settings/presentaion/view/widgets/setting_item.dart';

import '../../../../core/style/constants.dart';
import '../../../about_us/presentation/view/about_us_screen.dart';
import '../../../orders/presentation/orders_screen.dart';
import '../../../profile/presentation/view/profile_screen.dart';
import '../../../terms_and_condition/presentation/view/terms_condition_screen.dart';


class SettingsScreen extends StatelessWidget {
  static const routeName  = 'setting_screen';
  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var emailController = TextEditingController();

    List settings = [
      {
        'name': 'Orders',
        'icon': Icons.shopping_bag,
        'function': OrdersScreen.routeName,
      },
      {
        'name': 'About us',
        'icon': Icons.info_outlined,
        'function': AboutUsScreen.routeName,
      },
      {
        'name': 'Terms and conditions',
        'icon': Icons.list,
        'function': TermsAndConditions.routeName,
      },
    ];
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        nameController.text = ProfileCubit.get(context).userModel!.data.name;
        phoneController.text = ProfileCubit.get(context).userModel!.data.phone;
        emailController.text = ProfileCubit.get(context).userModel!.data.email;
        return Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  ProfileScreen.routeName,
                );
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurpleAccent),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              image: AssetImage('assets/images/icon.jpg'),
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
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_right,
                        color: Colors.deepPurple,
                        size: 40.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              flex: 4,
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => SettingItem(
                   name: settings[index]['name'],icon: settings[index]['icon'], onPressed:() {
                  Navigator.of(context).pushNamed(
                    settings[index]['function'],
                  );
                }),
                separatorBuilder: (context, index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  height: 1,
                  color: Colors.grey,
                ),
                itemCount: settings.length,
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: defaultTextButton(
                  text: AppStrings.logout,
                  function: () {
                    signOut(context);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
          ],
        );
      },
    );
  }
}

