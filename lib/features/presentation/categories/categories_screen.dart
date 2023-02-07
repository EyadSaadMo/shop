
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/features/domain/categories_model.dart';
import 'package:flutter_challenges/features/presentation/categories/cubit/categories_cubit.dart';
import 'package:flutter_challenges/features/widgets/category_item.dart';
import '../../../core/utilis/screen size/screen_size.dart';
import '../../widgets/categories_item.dart';
import '../../widgets/divider.dart';
import 'package:cached_network_image/cached_network_image.dart';
class CategoriesScreen extends StatelessWidget {
  static const routeName = 'categories';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return BlocConsumer<CategoriesCubit, CategoriesStates>(
      listener: (context, index) {},
      builder: (context, index) {
        return ListView.separated(
          physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
            CategoriesItems(model: CategoriesCubit.get(context).categoriesModel!.data.data[index]),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: CategoriesCubit.get(context).categoriesModel!.data.data.length);
      },
    );
  }

}
