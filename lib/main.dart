
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:house_rent/Screens/agent_profile_screen.dart';
import 'package:house_rent/Screens/edit_profile_screen.dart';
import 'package:house_rent/Screens/front_screen.dart';
import 'package:house_rent/Screens/home_screen.dart';
import 'package:house_rent/Screens/login_screen.dart';
import 'package:house_rent/Screens/search_result_screen.dart';
import 'package:house_rent/Screens/signup_screen.dart';
import 'package:house_rent/Screens/super_admin_screen.dart';

import 'package:provider/provider.dart';

import 'module/user_data.dart';


 

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget _getScreenId (){
    return StreamBuilder<FirebaseUser>(stream: FirebaseAuth.instance.onAuthStateChanged,
    builder: (BuildContext context,snapShort){
      if(snapShort.hasData){
      final String currentUserId=  Provider.of<UserData>(context).currentUserId= snapShort.data.uid;
        
        return HomeScreen();
      }else{
        return LoginScreen();
      }
    },
    );
    
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
          create: (context)=> UserData(),
          child: MaterialApp(
        title: 'Zegital Insta Clone',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFFF3791A),
          primarySwatch: Colors.blue,
          primaryIconTheme: Theme.of(context).primaryIconTheme.copyWith(
            color: Colors.black,
          )
        ),
        home: _getScreenId(),
       routes: {
        LoginScreen.routeId: (context) => LoginScreen(),
        SearchResultScreen.routeId: (context) => SearchResultScreen(),
        SuperAdminScreen.routeId: (context) => SuperAdminScreen(),
        SignupScreen.routeId: (context) => SignupScreen(),
        FrontScreen.routeId: (context)=>FrontScreen(),
        AgentProfileScreen.routeId:(context)=>AgentProfileScreen(),
        EditProfileScreen.routeId: (context)=>EditProfileScreen(),

      },

      ),
    );
  }
}

