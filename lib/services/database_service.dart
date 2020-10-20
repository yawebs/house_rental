import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:house_rent/module/house_module.dart';
import 'package:house_rent/module/user_module.dart';
import 'package:house_rent/utilities/constant.dart';


class DatabaseServices {
  static void updateUser(User user) {
    userRef.document(user.id).updateData({
      'username': user.username,
      'profileImageUrl': user.imageUrl,
      'bio': user.bio,
      'firstName': user.firstName,
      'lastName': user.lastName,
      'address': user.address,
      'phoneNumber': user.phoneNumber,
    });
  }

  static Future<QuerySnapshot> searchUsers(String name) {
    Future<QuerySnapshot> users =
        userRef.where('name', isGreaterThanOrEqualTo: name).getDocuments();
    return users;
  }

  static Future<QuerySnapshot> searchAllUsers(String name) {
    Future<QuerySnapshot> users =
        userRef.where('name', isGreaterThanOrEqualTo: name).getDocuments();
    return users;
  }

//   static Future<QuerySnapshot> searchAllUsers() async {
//     final QuerySnapshot result =
//           await Firestore.instance.collection('users').getDocuments();
// final List<DocumentSnapshot> documents = result.documents;
//  User ourUser;
//   documents.forEach((data){
//  ourUser= data.reference.get() as User;
//   });

//   }

  static void createPost(AgentsHouse post) {
    postRef.document(post.authorId).collection('usersPost').add({
      'imageUrl': post.imageUrl,
      'caption': post.caption,
      'likes': post.likes,
      'authorId': post.authorId,
      'timestamp': post.timestamp,
    });
    // allPostRef.add({
    //   'imageUrl': post.imageUrl,
    //   'caption': post.caption,
    //   'likes': post.likes,
    //   'authorId': post.authorId,
    //   'timestamp': post.timestamp,

    // });
  }

  static void followUser({String currentUserId, String userId}) {
    //Add user to currentUser following collection

    followingRef
        .document(currentUserId)
        .collection('userfollowing')
        .document(userId)
        .setData({});

    //add currentUser to user followers collection
    followersRef
        .document(userId)
        .collection('userFollowers')
        .document(currentUserId)
        .setData({});
  }

  static void unfollowUser({String currentUserId, String userId}) {
    //Remove user from currentUser following collection

    followingRef
        .document(currentUserId)
        .collection('userfollowing')
        .document(userId)
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });

    //Remover currentUser from user followers collection
    followersRef
        .document(userId)
        .collection('userFollowers')
        .document(currentUserId)
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
  }

  static Future<bool> isfollowingUser(
      {String currentUserId, String userid}) async {
    DocumentSnapshot followingDoc = await followersRef
        .document(userid)
        .collection('userFollowers')
        .document(currentUserId)
        .get();
    return followingDoc.exists;
  }

  static Future<int> numFollowing(String userId) async {
    QuerySnapshot followingSnapshot = await followingRef
        .document(userId)
        .collection('userfollowing')
        .getDocuments();
    return followingSnapshot.documents.length;
  }

  static Future<int> numFollowers(String userId) async {
    QuerySnapshot followersSnapshot = await followersRef
        .document(userId)
        .collection('userFollowers')
        .getDocuments();
    return followersSnapshot.documents.length;
  }

  static Future<List<AgentsHouse>> usersFeed(String userId) async {
    QuerySnapshot userFeedsQuerySnapshot = await feedsRef
        .document(userId)
        .collection('userFeed')
        .orderBy('timestamp', descending: true)
        .getDocuments();
    List<AgentsHouse> userPost = userFeedsQuerySnapshot.documents
        .map((postDoc) => AgentsHouse.fromDoc(postDoc))
        .toList();
        return userPost;
  }

  

  static Future <User> fetchUserId (String userId) async{
    DocumentSnapshot fetchedUserDocumentSnapshot = await userRef.document(userId).get();
    if(fetchedUserDocumentSnapshot.exists){
      return User.fromDoc(fetchedUserDocumentSnapshot);
    }
    return User();
  }

  static Future<List<AgentsHouse>> userProfilePost(String userId)async{

     QuerySnapshot userProfilePostSnapshot = await postRef
        .document(userId)
        .collection('usersPost')
        .orderBy('timestamp', descending: true)
        .getDocuments();
    List<AgentsHouse> userPost = userProfilePostSnapshot.documents
        .map((postDoc) => AgentsHouse.fromDoc(postDoc))
        .toList();
        return userPost;
  }
}
