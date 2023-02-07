import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/features/presentation/search/search_screen.dart';

import '../../../core/cubit/cubit.dart';
import '../../../core/cubit/states.dart';

class ShopLayout extends StatelessWidget {
  static const routeName = 'home';

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
              IconButton(icon:Icon(Icons.search_outlined),onPressed: (){Navigator.of(context).pushNamed(SearchScreen.routeName);},)
            ],
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items:[
              BottomNavigationBarItem( icon: Icon(Icons.home_outlined),label: 'home'),
              BottomNavigationBarItem( icon: Icon(Icons.shopping_bag_outlined),label: 'categories'),
              BottomNavigationBarItem( icon: Icon(Icons.shopping_cart_outlined),label: 'Bag'),
              BottomNavigationBarItem( icon: Icon(Icons.favorite_border),label: 'favourites'),
              BottomNavigationBarItem( icon: Icon(Icons.person_outline),label: 'Profile'),
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
