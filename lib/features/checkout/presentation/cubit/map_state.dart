part of 'map_cubit.dart';

abstract class MapState extends Equatable {
  const MapState();
}

class MapInitial extends MapState {
  @override
  List<Object> get props => [];
}
class MapGetLatLongSuccessState extends MapState {
  @override
  List<Object> get props => [];
}
class SelectMethodState extends MapState {
  @override
  List<Object> get props => [];
}
class SelectMethod extends MapState {

 late final int index;
 SelectMethod( this.index);

  @override
  // TODO: implement props
  List<Object?> get props => [index];
}