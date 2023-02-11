import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/features/search/presentaion/cubit/cubit.dart';
import 'package:flutter_challenges/features/search/presentaion/cubit/states.dart';
import 'package:flutter_challenges/features/search/presentaion/view/widgets/search_item.dart';

import '../../../auth/login/widgets/tff.dart';


class SearchScreen extends StatelessWidget {
  static const String routeName = '/search';

  @override
  Widget build(BuildContext context) {
    GlobalKey formKey = GlobalKey<FormState>();
    var searchController = TextEditingController();

    return BlocConsumer<SearchCubit, SearchStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Search'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  defaultFormField(
                      controller: searchController,
                      label: 'Search',
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'write a word to search..';
                        }
                        return null;
                      },
                      prefix: Icons.search,
                      type: TextInputType.text,
                      onFieldSubmit: (value) {
                        SearchCubit.get(context).search(value);
                      }),
                  if (state is SearchSuccessState)
                    Expanded(
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        itemBuilder: (context, index) => SearchItem(model: SearchCubit.get(context).searchModel!.data.data[index]),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10.0,
                        ),
                        itemCount:SearchCubit.get(context) .searchModel!
                        .data
                        .data
                            .length,
                      ),
                    ),
                  if (state is SearchLoadingState)
                    CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}