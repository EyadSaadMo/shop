//
// import 'package:equatable/equatable.dart';
//
// class CartModel extends Equatable {
//   final bool status;
//   final CartData cartData;
//
//   CartModel({required this.status, required this.cartData});
//
//   factory CartModel.fromJson(json){
//     return CartModel(status: json['status'],
//         cartData: CartData.fromJson(json['cartData']));
//   }
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [status, cartData];
// }
//
// class CartData extends Equatable {
//
//   final int total;
//   final int subTotal;
//   final List<CartItemData> cartItemData;
//
//   CartData({required this.cartItemData, required this.total, required this.subTotal});
//
//   factory CartData.fromJson(json){
//     return CartData(
//         total: json['total'],
//         subTotal: json['sub_total'],
//       cartItemData: List.from(json['cart_items']).map((e)=>CartItemData.fromJson(e)).toList(),
//     );
//
//   }
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [cartItemData, total, subTotal];
//
//
// }
//
// class CartItemData extends Equatable {
//   final int id;
//   final int quantity;
//   final ProductData productData;
//   CartItemData({required this.id,required this.quantity,required this.productData});
//   factory CartItemData.fromJson(json){
//     return CartItemData(id: json['id'], quantity: json['quantity'],
//         productData: ProductData.fromJson(json['product']));
//   }
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [id,quantity,productData];
// }
//
// class ProductData extends Equatable {
//   final int id;
//   final dynamic price;
//   final dynamic oldPrice;
//   final int discount;
//   final String image;
//   final String name;
//   final String description;
//   final List<String> images;
//   final bool inFavorites;
//   final bool inCart;
//
//   ProductData({required this.id, required this.price, required this
//       .oldPrice, required this.discount, required this.image, required this.name, required this.description,
//     required this.images, required this.inCart, required this.inFavorites});
//
//   factory ProductData.fromJson(Map<String, dynamic> json){
//     return ProductData(
//     id : json['id'],
//     price : json['price'],
//     oldPrice : json['old_price'],
//     discount : json['discount'],
//     image : json['image'],
//     name : json['name'],
//     description : json['description'],
//     images : List.castFrom<dynamic, String>(json['images']),
//     inFavorites : json['in_favorites'],
//     inCart : json['in_cart'],
//     );}
//
//   @override
//   // TODO: implement props
//   List<Object?> get props =>
//       [
//         id,
//     price,
//     oldPrice,
//     discount,
//     image,
//     images,
//     name,
//     description,
//     inFavorites,
//     inCart
//       ];
// }
class CartModel {
  late final bool status;
  late final Data data;

  CartModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = Data.fromJson(json['data']);
  }

}

class Data {

  late final List<CartItems> cartItems;
  late final int subTotal;
  late final int total;

  Data.fromJson(Map<String, dynamic> json){
    cartItems = List.from(json['cart_items']).map((e)=>CartItems.fromJson(e)).toList();
    subTotal = json['sub_total'];
    total = json['total'];
  }

}

class CartItems {

  late final int id;
  late final int quantity;
  late final Product product;

  CartItems.fromJson(Map<String, dynamic> json){
    id = json['id'];
    quantity = json['quantity'];
    product = Product.fromJson(json['product']);
  }

}

class Product {

  late final int id;
  late final dynamic price;
  late final dynamic oldPrice;
  late final int discount;
  late final String image;
  late final String name;
  late final String description;
  late final List<String> images;
  late final bool inFavorites;
  late final bool inCart;

  Product.fromJson(Map<String, dynamic> json){
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = List.castFrom<dynamic, String>(json['images']);
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }

}