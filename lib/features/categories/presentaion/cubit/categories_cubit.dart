import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/remote/dio_helper.dart';
import '../../../../core/network/remote/end_points.dart';
import '../../data/model/categories_model.dart';
part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit() : super(CategoriesInitialState());
  static CategoriesCubit get(context)=>BlocProvider.of(context);

  CategoriesModel? categoriesModel;

  void getCategories()
  {
    DioHelper.getData(
      url: GET_CATEGORIES,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      // print(categoriesModel!.status);
      emit(CategoriesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CategoriesErrorState(error));
    });
  }

}
