part of 'categories_cubit.dart';

abstract class CategoriesStates extends Equatable {const CategoriesStates();}

class CategoriesInitialState extends CategoriesStates {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class CategoriesSuccessState extends CategoriesStates {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class CategoriesErrorState extends CategoriesStates {
  late final String error;
  CategoriesErrorState(this.error);
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
