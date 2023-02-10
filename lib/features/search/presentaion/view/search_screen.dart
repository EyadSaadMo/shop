import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/core/utilis/app_strings/app_strings_screen.dart';
import '../../../auth/login/widgets/divider.dart';
import '../../../auth/login/widgets/tff.dart';
import '../../../products/widgets/list_product.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = 'search';

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var searchController = TextEditingController();
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultFormField(
                      controller: searchController,
                      type: TextInputType.text,
                      validate: (value) {
                        if (formKey.currentState!.validate()) {
                          return AppStrings.searchText;
                        } else
                          return '';
                      },
                      // i will search from submit
                      onFieldSubmit: (String? text) {
                        //ده اللي ه search بيه
                        SearchCubit.get(context).search(text);
                      },
                      label: AppStrings.search,
                      prefix: Icons.search,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    if (state is SearchLoadingState) LinearProgressIndicator(),
                    SizedBox(
                      height: 10.0,
                    ),
                    if (state is SearchSuccessState)
                      Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) => buildListProduct(
                                  SearchCubit.get(context)
                                      .searchModel!
                                      .data
                                      .data[index],
                                  context,
                                  isOldPrice: false,
                                ),
                            separatorBuilder: (context, index) => myDivider(),
                            itemCount: SearchCubit.get(context)
                                .searchModel!
                                .data
                                .data
                                .length),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
