import 'package:flutter/material.dart';
import 'package:flutter_challenges/modules/register/register_screen.dart';
import 'package:flutter_challenges/shared/component/components.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  child: Image(
                    image: NetworkImage(
                        'https://image.freepik.com/free-vector/sign-concept-illustration_114360-5425.jpg'),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Welcome back!',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Log in to your existence account of Q Affurs',
                  style: TextStyle(color: Colors.grey),
                ),
                 SizedBox(height: 15.0,),
                 Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: Column(
                     children: [
                       defaultFormField(

                         validate: (String value){
                           if(value.isEmpty){
                             return 'required';
                           }
                           else return null;
                         },
                         controller: emailController,
                         type: TextInputType.emailAddress,
                         hint: 'email',
                         prefixIcon: Icon(Icons.person),
                       ),
                       SizedBox(height: 10.0,),
                       defaultFormField(
                         validate: (String value){
                           if(value.isEmpty){
                             return 'required';
                           }
                           else return null;
                         },
                         controller: passwordController,
                         type: TextInputType.text,
                         hint: 'password',
                         prefixIcon: Icon(Icons.lock),
                       ),
                     ],
                   ),
                 ),
                SizedBox(height: 10.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Spacer(),
                      Text('forgot password?'),
                    ],
                  ),
                ),
                SizedBox(height: 10.0,),
                defaultButton(
                  text: 'log in',
                  function: (){
                  if(formKey.currentState!.validate()){
                    return ;
                  }
                  else{
                    formKey.currentState!.save();
                  }
                },
                ),
                SizedBox(height: 10,),
                Text('Or connect using',style: TextStyle(color: Colors.grey),),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child:DefaultRectangleButton(
                        size: size,
                        text: 'Facebook',
                        icon: Icons.facebook_sharp,
                        color: Colors.blue,
                      ),
                    ),
                    Expanded(
                      child: DefaultRectangleButton(
                        size:size,
                        text: 'Google',
                        icon: Icons.android_outlined,
                        color: Colors.red,

                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?'),
                    defaultTextButton(
                        function: (){
                      navigateTo(context, RegisterScreen());
                    }, text: 'Sign Up'),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
