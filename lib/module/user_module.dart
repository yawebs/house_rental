import 'package:cloud_firestore/cloud_firestore.dart';


class User{
final String id;
final String username;
final String email;
final String imageUrl;
final String bio;
final String firstName;
final String lastName;
final String address;
final String phoneNumber;

User({this.id,this.username,this.email,this.imageUrl,this.bio, this.firstName, this.lastName, this.address, this.phoneNumber});


factory User.fromDoc(DocumentSnapshot doc){
  if(doc.documentID!=null){
return User(id: doc.documentID,
username: doc['name'],
email: doc['email'],
imageUrl: doc['profileImageUrl'],
bio: doc['bio']?? '',
firstName: doc['firstName'],
lastName: doc['lastName'],
address: doc['address'],
phoneNumber: doc['phoneNumber'],


);

  }
  
}}