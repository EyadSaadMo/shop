import 'package:flutter/material.dart';

import '../../../../profile/presentation/profile_cubit/profile_cubit.dart';
import '../../../../profile/presentation/view/profile_screen.dart';

class PersonalInfoScreen extends StatelessWidget {
  static const routeName = 'personal_info';

  const PersonalInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  '@${ProfileCubit.get(context).userModel!.data.email.replaceAll(' ', '').toLowerCase()}',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
