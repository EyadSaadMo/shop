class ChangeFavouritesModel{
  late final bool  status;
 late final String message;
  ChangeFavouritesModel.fromJson(Map<String,dynamic> json){
    status=json['status'];
    message=json['message'];
  }

}