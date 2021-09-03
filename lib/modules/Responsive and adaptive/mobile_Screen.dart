import 'package:flutter/material.dart';

class MobileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.teal,
            ),
          ),
          Expanded(
            flex: 2,

            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Login With Your Account',style: Theme.of(context).textTheme.headline4,),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email address',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.teal,
                          height: 45.0,
                          child: MaterialButton(
                            onPressed: () {},
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                color: Colors.white,

                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20.0,),
                      Expanded(
                        child: Container(
                          color: Colors.blue,
                          height: 45.0,
                          child: MaterialButton(
                            onPressed: () {},
                            child: Text(
                              'REGISTER',
                              style: TextStyle(
                                color: Colors.white,

                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
