import 'package:flutter/material.dart';
Widget defaultFormField({
  @required String? hint,
  @required TextInputType? type,
  @required TextEditingController? controller,
  required Function validate,
  required Widget? prefixIcon,
})=>
   Card(
     elevation: 0.0,
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(30.0),
     ),
     child: TextFormField(
       style: TextStyle(color: Colors.blueAccent),
      keyboardType: type,
       validator: (val){
         validate(val);
       },
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: prefixIcon,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        border:  InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: 20.0),
      ),
  ),
   );

Widget defaultButton({

  @required String? text,
  bool isUppercase = true,
  Color background = Colors.blue,
  required Function function,
})
=> Container(
  height: 50,
  width: 150,
  clipBehavior: Clip.antiAliasWithSaveLayer,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
  ),
  child: MaterialButton(
    color: Colors.blue,

    onPressed:(){
      function();
    },
    child: Text(
      isUppercase?
      text!.toUpperCase():text!,
      style: TextStyle(color: Colors.white),
  ),

  ),
);

class DefaultRectangleButton extends StatelessWidget {
 late final Size? size;
  late final Color? color;
   late final String text;
  late final IconData? icon;
 DefaultRectangleButton({this.size,this.color,required this.text,this.icon});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: (){},
        child:Container(
          width: size!.width * .35,
          height: 40,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,color: Colors.white,),
              SizedBox(width: 5.0,),
              Text(text,style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
    );
  }
}
Widget defaultTextButton({
  required Function function,
  @required String? text,
}) {
  return TextButton(onPressed:(){
    function();
  }, child: Text(text!.toUpperCase()));
}
void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => widget));

