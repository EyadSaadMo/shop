
class FavouritesModel {
  late final bool status;
  late final Data data;
  FavouritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data =  Data.fromJson(json['data']);
  }
}
class Data {
late final  int currentPage;
 late final List<FavouritesData> data = [];
 late final String firstPageUrl;
 late final int lastPage;
  late final String lastPageUrl;
 late final String path;
  late final int perPage;
  late final int total;
  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];

    json['data'].forEach((element) {
      data.add( FavouritesData.fromJson(element));
    });

    firstPageUrl = json['first_page_url'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    total = json['total'];
  }
}

class FavouritesData {
  late final int id;
  late final Product product;
  FavouritesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    product = Product.fromJson(json['product']);
  }
}
class Product {
 late final int  id;
 late final dynamic price;
 late final  dynamic oldPrice;
 late final  int discount;
 late final  String image;
 late final String name;
 late final String description;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }
}