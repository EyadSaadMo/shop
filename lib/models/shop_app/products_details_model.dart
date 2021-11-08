class ProductDetailsModel{

  late final bool status;
  late final String? message;
  late final Data data;
  ProductDetailsModel.fromJson(Map<String,dynamic> json){
    status=json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

}
class Data{
  late final int currentPage;
  late final List<ProductDetailsData> data=[];
  Data.fromJson(Map<String,dynamic>json){
    currentPage=json['current_page'];
    json['data'].forEach((element) {
      data.add(ProductDetailsData.fromJson(element));
    });
  }

}
class ProductDetailsData{
  late final int id;
  late final dynamic price;
  late final String image;
  late final String name;
  late final String description;
  late final List<String> images;
  late final bool inFavourites;
  late final bool inCart;


  ProductDetailsData.fromJson(Map<String,dynamic>json){
    id=json['id'];
    price=json['price'];
    image=json['image'];
    name=json['name'];
    description=json['description'];
    if (json["images"] != null) {
      final v = json["images"];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      images = arr0;
    }
     // json['images'].forEach((element) {
     //   images.add(element.toString());
     // });
    inFavourites=json['in_favorites'];
    inCart=json['in_cart'];
  }
}