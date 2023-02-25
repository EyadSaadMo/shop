import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/core/utilis/app_strings/app_strings_screen.dart';
import 'package:flutter_challenges/features/cart/presentation/cubit/cart_state.dart';
import '../../../../core/network/remote/dio_helper.dart';
import '../../../../core/network/remote/end_points.dart';
import '../../../../core/utilis/constants.dart';
import '../../data/model/get_cart.dart';
import '../../data/model/in_cart_product.dart';


class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitialState());
  static CartCubit get(context) => BlocProvider.of(context);
  AddToCartModel? addToCart;

  void addProductToCart(int productID) {
    emit(LoadingProductToCartState());

    DioHelper.postData(url: CART, token: token, data: {
      'product_id': '$productID',
    }).then((value) {
      addToCart = AddToCartModel.fromJson(value.data);
      print('${addToCart!.status}, ${AppStrings.addToCartSuccess}');
      emit(SuccessAddProductToCartState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorAddProductToCartState());
    });
  }

  GetCartModel? getCart;

  void getInCartProducts() {
    emit(LoadingGetCartState());
    DioHelper.getData(url: CART, token: token).then((value) {
      getCart = GetCartModel.fromJson(value.data);
      emit(SuccessGetCartState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetCartState(error.toString()));
    });
  }
  void deleteProductFromCart(int inCartProductID) {
    emit(LoadingDeleteProductFromCartState());
    DioHelper.deleteData(
      url: '$CART/$inCartProductID',
      token: token,
    ).then((value) {
      if (value.data['status']) {
        getInCartProducts();
      }
      print(value.data['message']);
      emit(SuccessDeleteProductFromCartState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorDeleteProductFromCartState());
    });
  }

  void updateQuantityOfInCartProduct(int inCartProductID, int quantity) {
    emit(LoadingUpdateQuantityState());
    DioHelper.putData(
      url: '$CART/$inCartProductID',
      data: {
        'quantity': quantity,
      },
      token: token,
    ).then((value) {
      if (value.data['status']) {
        getInCartProducts();
      }
      emit(SuccessUpdateQuantityState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorUpdateQuantityState());
    });
  }
}
