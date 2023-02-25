
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilis/app_strings/app_strings_screen.dart';
import '../../../../core/utilis/screen size/screen_size.dart';
import '../../../auth/login/widgets/divider.dart';
import '../../widgets/categories_item.dart';
import '../cubit/categories_cubit.dart';
import '../cubit/categories_state.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = 'categories';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        title: Text(
          AppStrings.categories,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),

      body: BlocConsumer<CategoriesCubit, CategoriesStates>(
        listener: (context, index) {},
        builder: (context, index) {
          return ListView.separated(
            physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
              CategoriesItems(model: CategoriesCubit.get(context).categoriesModel!.data.data[index]),
              separatorBuilder: (context, index) => MyDivider(),
              itemCount: CategoriesCubit.get(context).categoriesModel!.data.data.length);
        },
      ),
    );
  }

}
