import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:house_rent/Screens/agent_profile_screen.dart';
import 'package:house_rent/Screens/edit_profile_screen.dart';
import 'package:house_rent/module/user_data.dart';


import 'package:provider/provider.dart';


class AuthServices{
 static final _auth = FirebaseAuth.instance;
 static final _fireStore = Firestore.instance;
static void signUpUser(BuildContext context, String name,String email, String passowrd) async{
  try{
    AuthResult authResult = await _auth.createUserWithEmailAndPassword(
      email: email,password: passowrd,
    );
    FirebaseUser logedInUser = authResult.user;
    if(logedInUser!=null){
      _fireStore.collection('/users').document(logedInUser.uid).setData({
        'name':name,
        'email':email,
        'profileImageUrl':'',
        'firstName':'',
        'lastName':'',
        'address':'',
        'phoneNumber':'',
      });
      Provider.of<UserData>(context).currentUserId = logedInUser.uid;
      
      Navigator.of(context).pushNamed(EditProfileScreen.routeId, arguments: logedInUser.uid );
    }

  }catch(e){

    print(e);
  }
}
static void logout(BuildContext context){
  _auth.signOut();
 // Navigator.of(context).pushReplacementNamed(LoginScreen.routeId);
}

static void login(String email, password){


  _auth.signInWithEmailAndPassword(email: email,password: password);


}
}