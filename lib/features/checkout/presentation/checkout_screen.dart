import 'package:flutter/material.dart';
import 'package:flutter_challenges/core/utilis/app_strings/app_strings_screen.dart';
import 'package:flutter_challenges/core/utilis/media_query.dart';
import 'package:flutter_challenges/features/checkout/presentation/view/map_view_screen.dart';
import 'package:flutter_challenges/features/checkout/presentation/widgets/delivery_method.dart';
import 'package:flutter_challenges/features/details/presentaion/cubit/details_cubit.dart';
import 'package:flutter_challenges/features/details/presentaion/cubit/details_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utilis/constants.dart';
import '../../auth/login/widgets/tff.dart';
import '../../cart/presentation/cubit/cart_cubit.dart';
import '../../profile/presentation/profile_cubit/profile_cubit.dart';
import 'cubit/map_cubit.dart';

class CheckoutScreen extends StatefulWidget {
  static const String routeName = '/checkout';

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var countryPicker = const FlCountryCodePicker();
  CountryCode countryFlag =
      const CountryCode(name: 'Egypt', code: 'EG', dialCode: '+20');

  @override
  void initState() {
    super.initState();
    MapCubit.get(context).checkPermission();
    MapCubit.get(context).getLatLong();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapCubit, MapState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        phoneController.text = ProfileCubit.get(context).userModel!.data.phone;
        nameController.text = ProfileCubit.get(context).userModel!.data.name;
        emailController.text = ProfileCubit.get(context).userModel!.data.email;
        return Scaffold(
          appBar: AppBar(
            title: Text(AppStrings.checkout),
          ),
          body: MapCubit.get(context).googlePlex == null
              ? Center(child: CircularProgressIndicator())
              : BlocBuilder<DetailsCubit, DetailsStates>(
                  builder: (context, state) {
                    var product = DetailsCubit.get(context)
                        .productDetailsModel!
                        .productModel;
                    int productPrice = product.price.toInt();
                    int delivery = MapCubit.get(context).delivery;
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(child: Text(AppStrings.currentLocation)),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushNamed(MapView.routeName);
                                      },
                                          child: Text(AppStrings.addNewLocation,
                                              style:
                                                  TextStyle(fontSize: 16),),),
                                    ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: kHeight(context) / 4,
                                child: GoogleMap(
                                  markers: MapCubit.get(context).myMarker,
                                  mapType: MapType.normal,
                                  initialCameraPosition:
                                      MapCubit.get(context).googlePlex!,
                                  onTap: (latlong) {
                                    MapCubit.get(context).myMarker.remove(
                                        Marker(markerId: MarkerId('1')));
                                    MapCubit.get(context).myMarker.add(Marker(
                                        markerId: MarkerId('1'),
                                        position: latlong));
                                    setState(() {});
                                  },
                                  onMapCreated:
                                      (GoogleMapController controller) {
                                    MapCubit.get(context).googleMapController =
                                        controller;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              defaultFormField(
                                context: context,
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return AppStrings.required;
                                  } else if (value.length < 5) {
                                    return AppStrings.shortName;
                                  } else {
                                    return '';
                                  }
                                },
                                controller: nameController,
                                label: AppStrings.name,
                                prefix: Container(
                                  child: Icon(
                                    Icons.person_outline,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color,
                                  ),
                                ),
                                type: TextInputType.name,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              defaultFormField(
                                context: context,
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return AppStrings.required;
                                  } else if (value.length < 5 ||
                                      !value.contains('@')) {
                                    return AppStrings.invalidEmail;
                                  } else {
                                    return null;
                                  }
                                },
                                controller: emailController,
                                label: AppStrings.emailAddress,
                                prefix: Container(
                                  child: Icon(
                                    Icons.email,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color,
                                  ),
                                ),
                                type: TextInputType.emailAddress,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              defaultFormField(
                                context: context,
                                type: TextInputType.number,
                                controller: phoneController,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return AppStrings.required;
                                  } else if (value.length < 6) {
                                    return 'short value';
                                  } else
                                    return null;
                                },
                                label: AppStrings.phone,
                                prefix: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 3),
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 3),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            var flag = await countryPicker
                                                .showPicker(context: context);
                                            flag ??= countryFlag;
                                            setState(() {
                                              countryFlag = flag!;
                                            });
                                          },
                                          child: Row(
                                            children: [
                                              Container(
                                                child: countryFlag != null
                                                    ? countryFlag.flagImage(
                                                        width: 30,
                                                        fit: BoxFit.cover)
                                                    : const SizedBox(),
                                              ),
                                              const SizedBox(
                                                width: 30,
                                                child: Icon(
                                                  Icons.arrow_drop_down,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                AppStrings.deliveryMethod,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: SizedBox(
                                  height: kHeight(context) / 6.8,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 3,
                                    itemBuilder: (ctx, index) =>
                                        DeliveryMethodCard(index: index),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text('Order:'),
                                  Spacer(),
                                  Text(
                                    priceFix(CartCubit.get(context)
                                        .getCart!
                                        .cartDetails!
                                        .total
                                        .toString()),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Text('Delivery:'),
                                  Spacer(),
                                  Text(
                                    '${delivery.toString() + ' ' + AppStrings.lE}',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Text('Total:'),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Text(
                                          '${delivery + CartCubit.get(context).getCart!.cartDetails!.total.toInt()}'),
                                      Text(' ' + '${AppStrings.lE}'),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: kHeight(context) / 10,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
          floatingActionButton: FloatingActionButton.extended(
            label: Text(
              '                 Submit Order                     ',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.white),
            ),
            elevation: 8,
            onPressed: () {},
          ),
        );
      },
    );
  }
}

