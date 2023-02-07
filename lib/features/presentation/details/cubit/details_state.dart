part of 'details_cubit.dart';

abstract class DetailsState extends Equatable {
  const DetailsState();
}

class DetailsInitial extends DetailsState {
  @override
  List<Object> get props => [];
}
class ProductDetailsLoadingState extends DetailsState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class ProductDetailsSuccessState extends DetailsState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class ProductDetailsErrorState extends DetailsState {
  late final String error;
  ProductDetailsErrorState(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}