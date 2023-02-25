// import 'package:flutter_challenges/features/checkout/presentation/bloc/address__cubit.dart';
// import 'package:flutter_challenges/features/checkout/presentation/bloc/location_bloc.dart';
// import 'package:get_it/get_it.dart';
//
// import 'core/network/networkInfo.dart';
// import 'features/checkout/data/dataSource/placeApi.dart';
//
// GetIt sl = GetIt.instance;
//
// Future<void> setupLocator() async {
//   sl.registerFactory(() => AddressCubit(sl(), sl()));
//   sl.registerFactory(() => LocationBloc(sl(),));
//   sl
//       .registerLazySingleton<PlacesDataSource>(() => PlacesDatasourceImpl());
//   sl
//       .registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
// }