import 'package:equatable/equatable.dart';
class ChangeCartModel extends Equatable{
  final bool status;
  final String message;
  // final CartData cartData;
  ChangeCartModel({required this.status,required this.message});
  factory ChangeCartModel.fromJson(json){
    return ChangeCartModel(status: json['status'], message: json['message'],
        // cartData: CartData.fromJson(json['data']),
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status,message];
}
//
// class CartData extends Equatable{
//   final int id;
//   final int quantity;
//   final Product product;
//   CartData({required this.id,required this.quantity,required this.product});
//   factory CartData.fromJson(json){
//     return CartData(id: json['id'], quantity: json['quantity'], product: json['product']);
//   }
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [id,quantity,product];
// }
// class Product extends Equatable{
//   final int id;
//   final dynamic price;
//   final dynamic oldPrice;
//   final int discount;
//   final String image;
//   Product({required this.id,required this.price,required this.oldPrice,required this.discount,required this.image,});
//   factory Product.fromJson(json){
//     return Product(
//         id: json['id'],
//         price:  json['price'],
//         oldPrice: json['old_price'],
//         discount: json['discount'],
//         image: json['image']);
//   }
//
//   @override
//   // TODO: implement props
//   List<Object?> get props =>[id,price,oldPrice,discount,image];
// }