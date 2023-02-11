abstract class CartStates  {}


   class CartInitialState extends CartStates {}
   class LoadingProductToCartState extends CartStates {}

   class SuccessAddProductToCartState extends CartStates {}

   class ErrorAddProductToCartState extends CartStates {}

   class LoadingGetCartState extends CartStates {}

   class SuccessGetCartState extends CartStates {}

   class ErrorGetCartState extends CartStates {
  final String error;
  ErrorGetCartState(this.error);
   }

   class LoadingDeleteProductFromCartState extends CartStates {}
   class SuccessDeleteProductFromCartState extends CartStates {}
   class ErrorDeleteProductFromCartState extends CartStates {}

   class LoadingUpdateQuantityState extends CartStates {}

   class SuccessUpdateQuantityState extends CartStates {}

   class ErrorUpdateQuantityState extends CartStates {}

