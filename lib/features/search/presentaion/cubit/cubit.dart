
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/features/search/presentaion/cubit/states.dart';


import '../../../../core/network/remote/dio_helper.dart';
import '../../../../core/network/remote/end_points.dart';
import '../../../../core/utilis/constants.dart';
import '../../data/model/search_model.dart';

class SearchCubit extends Cubit<SearchStates>{

  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? searchModel;

  void search(String? text){
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