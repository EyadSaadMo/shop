import 'package:flutter/material.dart';
import 'package:flutter_challenges/modules/shop_app/login/shop_login_screen.dart';
import 'package:flutter_challenges/shared/component/components.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    var phoneController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            )),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  SizedBox(
                    height: 15.0,
                  ),
                  Column(
                    children: [
                      defaultFormField(
                        validate: (value){
                          if(value!.isEmpty || value.trim().length == 0) {
                            return 'required';
                          }
                          if(! RegExp(r"^([a-zA-Z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+\/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?)$").hasMatch(value)){
                            return 'please enter valid email';
                          }
                          return null;
                        },
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        label: 'email',
                        prefix: Icons.email,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      defaultFormField(

                        validate: ( value) {
                          if (value!.isEmpty) {
                            return 'required';
                          } else
                            return null;
                        },
                        controller: phoneController,
                        type: TextInputType.number,
                        label: 'phone',
                        prefix: Icons.phone,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      defaultFormField(
                        validate: ( value) {
                          if (value!.isEmpty) {
                            return 'required';
                          } else
                            return null;
                        },
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        label: 'password',
                        prefix: Icons.lock,
                        suffix: Icons.remove_red_eye,
                        isPassword: true,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      defaultFormField(
                        validate: ( value) {
                          if (value != confirmPasswordController.text) {
                            return 'Matching field';
                          } else
                            return null;
                        },
                        controller: confirmPasswordController,
                        type: TextInputType.visiblePassword,
                        label: 'confirm password',
                        prefix: Icons.lock,
                        suffix: Icons.remove_red_eye,
                        isPassword: true,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultButton(
                    text: 'create',
                    function: () {
                      if (formKey.currentState!.validate()) {
                        return;
                      } else {
                        formKey.currentState!.save();
                      }
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?'),
                      defaultTextButton(
                          function: () {
                            navigateTo(context, ShopLoginScreen());
                          },
                          text: 'Login '),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
