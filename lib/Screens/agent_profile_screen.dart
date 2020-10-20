import 'package:flutter/material.dart';
import 'package:house_rent/services/auth_services.dart';

class AgentProfileScreen extends StatefulWidget {
  static String routeId ='/agentProfile';
  String currentUserId;
  AgentProfileScreen({this.currentUserId});
  @override
  _AgentProfileScreenState createState() => _AgentProfileScreenState();
}

class _AgentProfileScreenState extends State<AgentProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        Text('Agent Profile Screen'),
        FlatButton(child: Text('Logout'),
        onPressed:()=> AuthServices.logout(context),)
      ]),
    );
  }
}
