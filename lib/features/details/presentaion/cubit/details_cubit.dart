import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/remote/dio_helper.dart';
import '../../../../core/network/remote/end_points.dart';
import '../../../home/data/model/home_model.dart';
part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());
  static DetailsCubit get(context)=>BlocProvider.of(context);

  ProductsModel? productModel;
  void getDetails(){
    emit(ProductDetailsLoadingState());
    DioHelper.getData(url: PRODUCT_DETAILS).then((value) {
      productModel  = ProductsModel.fromJson(value.data);
      emit(ProductDetailsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ProductDetailsErrorState(error.toString()));

    });

  }
}
