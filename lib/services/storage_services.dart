import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:house_rent/utilities/constant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class StorageService{
  static Future<String> uploadProfileImage(String url, File imageFile ) async{
    String photoId= Uuid().v4();
    File image = await compressImage(photoId, imageFile);
    
    if(url.isNotEmpty){
      //if the user has already choosen a photo you just need to update the user profile with new photo
      //instead of uplaoding a new one
      RegExp exp = RegExp(r'user_profile(.*).jpg');
      photoId = exp.firstMatch(url)[1];
      print(photoId);
    }
    
    StorageUploadTask uploadTask = storageRef.child('images/users/user_profile$photoId.jpg').putFile(image);
    StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
    String downloadImageUrl = await storageTaskSnapshot.ref.getDownloadURL();
    return downloadImageUrl;

  }

  static Future<File> compressImage(String photoId, File image) async{
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    File compressedImageFile = await FlutterImageCompress.compressAndGetFile(
      image.absolute.path, 
      '$path/img_$photoId.jpg',
      quality: 70,
      );
      return compressedImageFile;
  }

  
 static Future<String> uploadPost(File imageFile) async{
    String photoId= Uuid().v4();
    File image = await compressImage(photoId, imageFile); 
    StorageUploadTask uploadTask = storageRef.child('images/posts/user_post$photoId.jpg').putFile(image,StorageMetadata(contentType: '{mp4,jpg,jpeg}', ));
    StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
    String downloadImageUrl = await storageTaskSnapshot.ref.getDownloadURL();
    return downloadImageUrl;

  }
}