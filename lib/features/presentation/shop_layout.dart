import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/features/presentation/search/search_screen.dart';

import '../../core/cubit/cubit.dart';
import '../../core/cubit/states.dart';
import '../../core/style/icon_broken.dart';

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
              IconButton(icon:Icon(IconBroken.Search),onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SearchScreen()));},)
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
