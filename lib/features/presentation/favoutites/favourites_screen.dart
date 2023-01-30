import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../core/cubit/cubit.dart';
import '../../../core/cubit/states.dart';
import '../../../core/widgets/divider.dart';
import '../../../core/widgets/list_product.dart';

class FavouritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, index) {},
      builder: (context, index) {
        return ConditionalBuilder(
          condition: State is !ShopLoadingGetFavouritesState,
          builder: (context) => ListView.separated(
              itemBuilder: (context, index) => buildListProduct(
                  ShopCubit.get(context)
                      .favouritesModel!.data.data[index].product,
                  context),
              separatorBuilder: (context, index) => myDivider(),
              itemCount:
                  ShopCubit.get(context).favouritesModel!.data.data.length),
          fallback: (context) =>Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

}
