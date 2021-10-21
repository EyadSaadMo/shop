class HomeModel {
  late final bool status;
  late final HomeDataModel data;

  HomeModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = HomeDataModel.fromJson(json['data']);
  }

}

class HomeDataModel {
  late final List<BannersModel> banners;
   // final List<BannersModel> banners=[];
  late final List<ProductsModel> products;
  late final String ad;

  HomeDataModel.fromJson(Map<String, dynamic> json){
   // json['banners'].forEach((element){
   //   banners.add(element);
   // });
    banners = List.from(json['banners']).map((e)=>BannersModel.fromJson(e)).toList();
    products = List.from(json['products']).map((e)=>ProductsModel.fromJson(e)).toList();
    ad = json['ad'];
  }
}

class BannersModel {
  late final int id;
  late final String image;
  // late final Null category;
  // late final Null product;

  BannersModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    image = json['image'];
    // category = json['category'];
    // product = json['product'];
  }
}

class ProductsModel {
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

  ProductsModel.fromJson(Map<String, dynamic> json){
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