// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_challenges/features/domain/change_cart_model.dart';
// import 'package:flutter_challenges/features/domain/change_favourites_model.dart';
// import 'package:flutter_challenges/features/domain/favourites_model.dart';
//
// import '../../../../core/network/remote/dio_helper.dart';
// import '../../../../core/network/remote/end_points.dart';
// import '../../../../core/style/constants.dart';
// import '../../../domain/cart_model.dart';
// import '../../../domain/home_model.dart';
// part 'cart_state.dart';
//
// class CartCubit extends Cubit<CartState> {
//   CartCubit() : super(CartInitial());
//   static CartCubit get(context) => BlocProvider.of(context);
//   int counter = 1;
//   bool isCartEnabled = false;
//   void increment(){
//     counter++;
//     emit(CartIncrementCounter());
//   }
//   void decrement(){
//     counter--;
//     emit(CartDecrementCounter());
//   }
//
//   HomeModel? homeModel;
//   late Map<int,dynamic> cart={};
//
//   void getHomeData() {
//     emit(ShopLoadingHomeDataState());
//     DioHelper.getData(url: HOME,token: token).then((value) {
//       homeModel = HomeModel.fromJson(value.data);
//       homeModel!.data.products.forEach((element) {
//         cart.addAll({
//           element.id:element.inCart
//         });
//       });
//       print(cart.toString());
//     }).catchError((error) {
//       print(error.toString());
//       emit(ShopErrorHomeDataState(error));
//     }
//     );
//   }
//   FavouritesModel? favouritesModel;
//   void getCart(){
//     emit(ShopLoadingGetCartsState());
//     DioHelper.getData(url: CART,token: token).then((value) {
//       favouritesModel= FavouritesModel.fromJson(value.data);
//       emit(ShopSuccessGetCartsState());
//     }).catchError((error){
//       print(error.toString());
//       emit(ShopErrorGetCartsState());
//     });
//   }
//
//   ChangeFavouritesModel? changeFavouritesModel;
//   void addOrDeleteCartItem(int cartId){
//     cart[cartId] = !cart[cartId];
//     emit(ShopChangeCartState());
//     DioHelper.postData(url: CART,
//       data: {
//         "product_id":cartId,
//       },token: token
//     ).then((value){
//       changeFavouritesModel = ChangeFavouritesModel.fromJson(value.data);
//       print(value.data);
//       if(changeFavouritesModel!.status == false){
//         cart[cartId] = !cart[cartId];
//       }
//       else{
//         getCart();
//         emit(ShopSuccessChangeCartState(changeFavouritesModel!));
//       }
//     }).catchError((error){
//       cart[cartId] = !cart[cartId];
//       emit(ShopErrorChangeCartState());
//
//     });
//
//   }
// }
