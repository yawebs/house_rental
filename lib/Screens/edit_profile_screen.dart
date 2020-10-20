import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:house_rent/module/user_data.dart';
import 'package:house_rent/module/user_module.dart';
import 'package:house_rent/services/database_service.dart';
import 'package:house_rent/services/storage_services.dart';
import 'package:house_rent/utilities/constant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  static String routeId ='/EditProfileScreen';
  final String currentUserId;
  EditProfileScreen({this.currentUserId});
  
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
   File _profileImage;
  String _name = '';
  String _bio = '';
  String _firstName ='';
  String _lastName ='';
  String _address ='';
  String _phoneNumber ='';
  bool _isLoading = false;
  String _userId ='';
  User incomginUser;
  
  @override
  void initState() {
    super.initState();
   
    _setupUserProfileField();
  }
  
   _setupUserProfileField() async {
   final String userId=  ModalRoute.of(context).settings.arguments;
    User profileUser = await DatabaseServices.fetchUserId(userId);
    setState(() {
      incomginUser = profileUser;
    });
  }


  final _formKey = GlobalKey<FormState>();
   
//   _recieveIncomingUserId(BuildContext context,){
// User user;
//  String mainUserid = Provider.of<UserData>(context).currentUserId;
//  if(user.id==mainUserid){
   
//   setState(() {
//    incomginUser =user;
//  });
//  }
 
//   }

  _submit() async {
    if (_formKey.currentState.validate()&& !_isLoading) {
      _formKey.currentState.save();
      setState(() {
        _isLoading= true;
      });
      String _userProfileImageUrl ='';

      if (_userProfileImageUrl ==null) {
        _userProfileImageUrl = incomginUser.imageUrl;
      } else {
        _userProfileImageUrl = await StorageService.uploadProfileImage(
            incomginUser.imageUrl, _profileImage);
      }

      User user = User(
        id: incomginUser.id,
        email: incomginUser.email,
        username: incomginUser.username,
        firstName: _firstName,
        lastName: _lastName,
        address: _address,
        phoneNumber: _phoneNumber.toString(),
        imageUrl: _userProfileImageUrl,
        bio: _bio,
      );

     DatabaseServices.updateUser(user);
      Navigator.of(context).pop();
    }
     
  }

    _handleImageFromGallary() async {
    File imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      setState(() {
        _profileImage = imageFile;
      });
    }
  }

  _displayProfileImage() {
    if (_profileImage == null) {
      //Checking if There is No profile Image Selected
      if (incomginUser.imageUrl.isEmpty) {
        return AssetImage('assets/images/user_profile_image.jpg');
      } else {
        // if there is already an existing profile image in database, set it

        return CachedNetworkImageProvider(incomginUser.imageUrl);
      }
    } else {
      return FileImage(_profileImage);
    }
  }


  @override
  Widget build(BuildContext context) {
  return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: GestureDetector(
        onTap: ()=> FocusScope.of(context).unfocus(),
              child: ListView(
          children: <Widget>[
            _isLoading? LinearProgressIndicator(backgroundColor: Colors.blue[200],
            valueColor: AlwaysStoppedAnimation(Colors.blue),)
            :SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 60.0,
                      backgroundColor: Colors.grey,
                      backgroundImage: _displayProfileImage(),
                    ),
                    FlatButton(
                      onPressed: _handleImageFromGallary,
                      child: Text(
                        'Choose Profile Image',
                        style: TextStyle(
                            fontSize: 16.0, color: Theme.of(context).accentColor),
                      ),
                    ),
                    TextFormField(
                      validator: (input) => input.trim().length < 1
                          ? 'Please Enter Profile Name'
                          : null,
                      initialValue: _name,
                      onSaved: (input) => _firstName = input,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                      decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: 'First Name',
                      ),
                    ),
                     TextFormField(
                      validator: (input) => input.trim().length < 1
                          ? 'Please Enter Last Name'
                          : null,
                    
                      onSaved: (input) => _lastName = input,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                      decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: 'Last Name',
                      ),
                    ),

                     TextFormField(
                      validator: (input) => input.trim().length < 1
                          ? 'Please Enter Address'
                          : null,
                      initialValue: _name,
                      onSaved: (input) => _address = input,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                      decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: 'Residential Address',
                      ),
                    ),
                     TextFormField(
                      validator: (input) => input.trim().length < 1
                          ? 'Please Enter Phone Number'
                          : null,
                     
                      onSaved: (input) => _phoneNumber = input,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: 'Phone Number',
                      ),
                    ),
                    TextFormField(
                      validator: (input) => input.trim().length > 150
                          ? 'Charracters Must be less than 150'
                          : null,
                      onSaved: (input) => _bio = input,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                      decoration: InputDecoration(
                        icon: Icon(Icons.book),
                        labelText: 'Please Tell Us About Yourself',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      color: Colors.blue,
                      height: 40.0,
                      width: 250.0,
                      child: FlatButton(
                        child: Text(
                          'Save profile',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: _submit,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}