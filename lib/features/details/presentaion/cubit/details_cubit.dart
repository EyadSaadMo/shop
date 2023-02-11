import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/remote/dio_helper.dart';
import '../../../../core/style/constants.dart';
import '../../data/model/products_details_model.dart';
import 'details_state.dart';

class DetailsCubit extends Cubit<DetailsStates> {
  DetailsCubit() : super(DetailsInitial());

  static DetailsCubit get(context) => BlocProvider.of(context);

  ProductDetailsModel? productDetailsModel;

  void getProductDetails(int productID) {
    emit(LoadingGetProductDetailsState());
    DioHelper.getData(url: 'products/$productID', token: token).then((value) {
      productDetailsModel = ProductDetailsModel.fromJson(value.data);
      emit(SuccessGetProductDetailsState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetProductDetailsState());
    });
  }
}
