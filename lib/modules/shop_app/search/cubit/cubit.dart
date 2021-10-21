
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/models/shop_app/search_model.dart';
import 'package:flutter_challenges/modules/shop_app/search/cubit/states.dart';
import 'package:flutter_challenges/shared/component/constants.dart';
import 'package:flutter_challenges/shared/network/remote/dio_helper.dart';
import 'package:flutter_challenges/shared/network/remote/end_points.dart';

class SearchCubit extends Cubit<SearchStates>{

  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? searchModel;

  void search(String text){
    emit(SearchLoadingState());
    DioHelper.postData(
        url: SEARCH,
        token: token ,
        data: {
          'text' : text
        }).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      emit(SearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(SearchErrorState());
    });
  }
}