import 'package:flutter/material.dart';
import 'package:flutter_challenges/modules/login/login_Screen.dart';
import 'package:flutter_challenges/shared/component/components.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    var phoneController = TextEditingController();
    var formKey= GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:Icon( Icons.arrow_back_outlined,color: Colors.black,)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Let\'s Get Started!',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Create an account of Q Affurs to get all features',
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
                        controller: phoneController,
                        type: TextInputType.number,
                        hint: 'phone',
                        prefixIcon: Icon(Icons.phone_android_outlined),
                      ),
                      defaultFormField(
                        validate: (String value){
                          if(value.isEmpty){
                            return 'required';
                          }
                          else return null;
                        },
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        hint: 'password',
                        prefixIcon: Icon(Icons.lock),
                      ),
                      SizedBox(height: 10.0,),
                      defaultFormField(

                        validate: (String value){
                          if(value.isEmpty){
                            return 'required';
                          }
                          else return null;
                        },
                        controller: confirmPasswordController,
                        type: TextInputType.visiblePassword,
                        hint: 'confirm password',
                        prefixIcon: Icon(Icons.lock),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 10.0,),
                defaultButton(
                  text: 'create',
                   function: (){
                  if(formKey.currentState!.validate()){
                    return;
                  }
                  else{
                    formKey.currentState!.save();
                  }
                },
                ),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?'),
                    defaultTextButton(
                        function: (){
                          navigateTo(context, LoginScreen());
                        }, text: 'Login Here'),
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
