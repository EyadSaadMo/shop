import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/core/utilis/app_strings/app_strings_screen.dart';

import '../../../search/presentaion/view/search_screen.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class Layout extends StatelessWidget {
  static const routeName = 'home';

  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit= ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(AppStrings.appBarName),
            actions: [
              IconButton(icon:Icon(Icons.search_outlined),onPressed: (){Navigator.of(context).pushNamed(SearchScreen.routeName);},)
            ],
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items:[
              BottomNavigationBarItem( icon: Icon(Icons.home_outlined),label: AppStrings.home),
              BottomNavigationBarItem( icon: Icon(Icons.shopping_bag_outlined),label: AppStrings.categories),
              BottomNavigationBarItem( icon: Icon(Icons.shopping_cart_outlined),label: AppStrings.bag),
              BottomNavigationBarItem( icon: Icon(Icons.favorite_border),label: AppStrings.favorites),
              BottomNavigationBarItem( icon: Icon(Icons.person_outline),label: AppStrings.profile),
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
