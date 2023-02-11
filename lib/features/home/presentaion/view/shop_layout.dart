import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/core/utilis/app_strings/app_strings_screen.dart';

import '../../../cart/presentation/view/shopping_cart.dart';
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
          appBar:  AppBar(
            title: Row(
              children: [
                Image.asset(
                  'assets/images/icon.jpg',
                  height: 30.0,
                  width: 30.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  AppStrings.appBarName,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.deepPurple,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    SearchScreen.routeName,
                  );
                },
              ),
            ],
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items:[
              BottomNavigationBarItem( icon: Icon(Icons.home_outlined),label: AppStrings.home),
              BottomNavigationBarItem( icon: Icon(Icons.shopping_bag_outlined),label: AppStrings.categories),
              BottomNavigationBarItem( icon: Icon(Icons.favorite_border),label: AppStrings.favorites),
              BottomNavigationBarItem( icon: Icon(Icons.settings),label: AppStrings.setting),
            ],
            onTap: (int? index){
              cubit.changeBottomNavBar(index!);
            },
            currentIndex: cubit.currentIndex,
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey[200]!, width: 5),
              ),
              child: FloatingActionButton(
                onPressed: () {
                  //ShopCubit.get(context).getInCartProducts();
                  Navigator.of(context).pushNamed(
                    ShoppingCart.routeName,
                  );
                },
                child: Icon(Icons.shopping_cart),
              ),
            ),
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
        );
      },
    );



  }
}
