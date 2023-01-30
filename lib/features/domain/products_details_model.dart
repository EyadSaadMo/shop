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
    int? id;
    dynamic  price;
    String? image;
    String? name;
    String? description;
    List<String>? images;
    bool? inFavourites;
    bool? inCart;


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