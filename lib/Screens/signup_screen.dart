import 'package:flutter/material.dart';
import 'package:house_rent/widgets/home_top_widget.dart';
import 'package:house_rent/widgets/shape_signup.dart';
import 'package:house_rent/widgets/top_customshpae_clip.dart';

import '../services/auth_services.dart';

class SignupScreen extends StatefulWidget {
  static final String routeId = '/signUpRoute';
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name, _email, _password;
  bool _isLoading = false;
  Color firstFrom = Color(0xFFF47D15);
  Color secondTo = Color(0xFFEF772C);
  _submited() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() {
        _isLoading = true;
      });
      AuthServices.signUpUser(context, _name, _email, _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
                    ShapeSignup(),

                    SizedBox(
                      height: 50.0,
                    ),
                    Image.asset('assets/images/zegital.png'),
                    SizedBox(
                      height: 50.0,
                    ),
                    // Text(
                    //   'ZeChat',
                    //   style: TextStyle(fontSize: 50.0, fontFamily: 'Bilabong'),
                    // ),

                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Username'),
                              validator: (input) => input.trim().isEmpty
                                  ? 'Please Enter a Username'
                                  : null,
                              onSaved: (input) => _name = input,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Email'),
                              validator: (input) => !input.contains('@')
                                  ? 'Please Enter a Valid Email'
                                  : null,
                              onSaved: (input) => _email = input,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Password'),
                              validator: (input) => input.length < 6
                                  ? 'Password Must Be Atleast 6 Charracters'
                                  : null,
                              onSaved: (input) => _password = input,
                              obscureText: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 250.0,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                      child: FlatButton(
                        
                        color: firstFrom,
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Signup',
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                        onPressed: _submited,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 250.0,
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Already Registered? Login',
                          style: TextStyle(color: secondTo, fontSize: 15.0),
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
