class ChangePassModel{
  late bool status;
 late String message;
 late final Data data;
  ChangePassModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
     data = Data.fromJson(json['data']);
  }
}
class Data{
  late String email;
  Data.fromJson(Map<String,dynamic> json){
    email = json['email'];

  }
}