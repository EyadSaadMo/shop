import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/modules/shop_app/search/search_screen.dart';
import 'package:flutter_challenges/shared/component/components.dart';
import 'package:flutter_challenges/shared/style/icon_broken.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';
class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit= ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('E_Commerce'),
            actions: [
              IconButton(icon:Icon(IconBroken.Search),onPressed: (){navigateTo(context, SearchScreen());},)
            ],
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items:[
              BottomNavigationBarItem( icon: Icon(IconBroken.Home),label: 'home'),
              BottomNavigationBarItem( icon: Icon(IconBroken.Category),label: 'categories'),
              BottomNavigationBarItem( icon: Icon(IconBroken.Heart),label: 'favourites'),
              BottomNavigationBarItem( icon: Icon(IconBroken.Setting),label: 'settings'),
            ],
            onTap: (int? index){
              cubit.changeBottomNav(index);
            },
            currentIndex: cubit.currentIndex,
          ),
        );
      },
    );



  }
}
