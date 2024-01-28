import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:freedom_chat_app/core/di/dependancy_injection.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';

class AuthService {
  final FirebaseAuth auth;

  final GoogleSignIn googleSignIn;

  final GitHubSignIn gitHubSignIn;

  final TwitterLogin twitterLogin;

  AuthService({
    required this.gitHubSignIn,
    required this.auth,
    required this.googleSignIn,
    required this.twitterLogin,
  });

  Future<UserCredential> signIn(
      {required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await getIt<DatabaseService>().updateUser({
        'lastActive': DateTime.now(),
        'uId': auth.currentUser!.uid,
        'isOnline': 'true',
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        if (kDebugMode) {
          print('No user found for that email.');
        }
      } else if (e.code == 'wrong-password') {
        if (kDebugMode) {
          print('Wrong password provided for that user.');
        }
      }
    }
    //this after you update email and password there is problem might found so i add this
    //to update user data after update email and password
    return auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> forgetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuth catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<void> signUp({required String email, required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        if (kDebugMode) {
          print('The password provided is too weak.');
        }
      } else if (e.code == 'email-already-in-use') {
        if (kDebugMode) {
          print('The account already exists for that email.');
        }
      }
    }
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
    } on FirebaseAuth catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      throw Exception('Failed to sign out');
    }
  }

  Stream<User?> userState() {
    return auth.authStateChanges();
  }

  String? getCurrentUserId() {
    return auth.currentUser?.uid;
  }

  Future<void> handleGoogleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        throw Exception('Google sign in aborted by user');
      }

      // Force account selection
      await googleSignIn.signOut(); // Sign out to force account selection
      final GoogleSignInAccount? selectedGoogleUser =
      await googleSignIn.signIn();

      if (selectedGoogleUser == null) {
        throw Exception('Google sign in aborted by user');
      }

      final GoogleSignInAuthentication googleAuth =
      await selectedGoogleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await auth.signInWithCredential(credential);

      final currentUser = auth.currentUser;
      final userModel = UserModel(
        uId: currentUser?.uid ?? '',
        name: currentUser?.displayName ?? '',
        email: currentUser?.email ?? '',
        image: currentUser?.photoURL ?? 'https://via.placeholder.com/150',
        lastActive: DateTime.now(),
        password: 'Un allow to display',
        description: 'Default description',
        isOnline: true,
      );
      await getIt<DatabaseService>().createUser(userModel);
    } on FirebaseAuth catch (e) {
      if (kDebugMode) {
        print('Google sign in error: $e');
      }
      throw Exception('Failed to sign in with Google');
    }
  }

  Future<void> signInWithTwitter() async {
    try {
      final authResult = await twitterLogin.login();

      final twitterAuthCredential = TwitterAuthProvider.credential(
        accessToken: authResult.authToken!,
        secret: authResult.authTokenSecret!,
      );

      await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);

      final currentUser = auth.currentUser;

      const userEmail = 'user@example.com';

      final userModel = UserModel(
        uId: currentUser?.uid ?? '',
        name: currentUser?.displayName ?? '',
        email: userEmail,
        image: currentUser?.photoURL ?? '',
        lastActive: DateTime.now(),
        password: 'Un allow to display',
        description: 'Default description',
        isOnline: true,
      );

      await getIt<DatabaseService>().createUser(userModel);
    } on FirebaseAuth catch (e) {
      if (kDebugMode) {
        print('Twitter sign in error: $e');
      }
      throw Exception('Failed to sign in with Twitter');
    }
  }

  Future<void> handleGitHubSignIn(context) async {
    try {
      final result = await gitHubSignIn.signIn(context);
      final githubAuthCredential = GithubAuthProvider.credential(result.token!);

      // Sign in with the GitHub credential
      await FirebaseAuth.instance.signInWithCredential(githubAuthCredential);

      final currentUser = auth.currentUser;

      const String userName = 'user';
      final userModel = UserModel(
        uId: currentUser?.uid ?? '',
        name: userName,
        email: currentUser?.email ?? '',
        image: currentUser?.photoURL ?? '',
        password: 'Un allow to display',
        lastActive: DateTime.now(),
        description: 'Default description',
        isOnline: true,
      );

      await getIt<DatabaseService>().createUser(userModel);
    } on FirebaseAuth catch (e) {
      if (kDebugMode) {
        print('GitHub sign in error: $e');
      }
      throw Exception('Failed to sign in with GitHub');
    }
  }

  Future<bool> isEmailVerified() async {
    final user = auth.currentUser!;
    await user.reload();
    return user.emailVerified;
  }

  Future<void> sendVerificationEmail() async {
    try {
      await auth.currentUser!.sendEmailVerification();
    } on FirebaseAuth catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<void> resendVerificationEmail() async {
    try {
      final user = auth.currentUser!;
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      } else {
        throw Exception('Email is already verified');
      }
    } on FirebaseAuth catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<void>updateEmailAndPassword({required String email,required String password})async{
    try{
      await auth.currentUser!.updateEmail(email);
      await auth.currentUser!.updatePassword(password);
    }on FirebaseAuth catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}

class DatabaseService {
  final FirebaseFirestore _fireStore;

  DatabaseService(this._fireStore);

  Future<void> createUser(UserModel userModel) async {
    final userCollection = _fireStore.collection('users');
    final uid = getIt<AuthService>().getCurrentUserId();
    if (uid != null) {
      final userData = await userCollection.doc(uid).get();
      if (!userData.exists) {
        final user = userModel.toJson();
        await userCollection.doc(uid).set(user);
      }
    } else {
      throw Exception('Failed to create user');
    }
  }

  Stream<List<UserModel>> getAllUsers() {
    final userCollection =
    _fireStore.collection('users').orderBy('lastActive', descending: true);

    return userCollection.snapshots(includeMetadataChanges: true).map(
          (querySnapshot) => querySnapshot.docs
          .map((e) => UserModel.fromJson(e.data()))
          .toList(),
    );
  }

Future<void> updateUser(Map<String, dynamic> data) async {
  try {
    await _fireStore
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(data);
  } catch (e) {
    if (kDebugMode) {
      print('Error updating user: $e');
    }
    throw Exception('Failed to update user');
  }
}

Stream<UserModel> getSingleUser(String uId) {
  final userDoc = _fireStore.collection('users').doc(uId);

  return userDoc.snapshots(includeMetadataChanges: true).map((userSnapshot) {
    if (userSnapshot.exists) {
      final userData = userSnapshot.data() as Map<String, dynamic>;
      return UserModel.fromJson(userData);
    }
    throw Exception('User does not exist');
  });
}}
//   Future<void> addTextMessage({required MessageModel messageEntity}) async {
//     final uId = AuthService().getCurrentUserId();
//     final message = MessageModel(
//       senderId: uId!,
//       receiverId: messageEntity.receiverId,
//       content: messageEntity.content,
//       sendTime: DateTime.now(),
//       messageType: MessageType.text,
//     ).toMap();
//     if (uId == messageEntity.receiverId) {
//       //that me i send message to my self
//       await _firestore
//           .collection('users')
//           .doc(uId)
//           .collection('chats')
//           .doc(messageEntity.receiverId)
//           .collection('messages')
//           .add(message);
//     } else {
//       //that me i send message to other user
//       await _firestore
//           .collection('users')
//           .doc(uId)
//           .collection('chats')
//           .doc(messageEntity.receiverId)
//           .collection('messages')
//           .add(message);
//       //that other user i send message to me
//       await _firestore
//           .collection('users')
//           .doc(messageEntity.receiverId)
//           .collection('chats')
//           .doc(uId)
//           .collection('messages')
//           .add(message);
//     }
//   }
//
//   Future<void> addImageMessage({required MessageModel messageEntity}) async {
//     final uId = AuthService().getCurrentUserId();
//     final message = MessageModel(
//       senderId: uId!,
//       receiverId: messageEntity.receiverId,
//       content: messageEntity.content,
//       sendTime: DateTime.now(),
//       messageType: MessageType.image,
//     ).toMap();
//     if (uId == messageEntity.receiverId) {
//       //that me i send message to my self
//       await _firestore
//           .collection('users')
//           .doc(uId)
//           .collection('chats')
//           .doc(messageEntity.receiverId)
//           .collection('messages')
//           .add(message);
//     } else {
//       //that me i send message to other user
//       await _firestore
//           .collection('users')
//           .doc(uId)
//           .collection('chats')
//           .doc(messageEntity.receiverId)
//           .collection('messages')
//           .add(message);
//       //that other user i send message to me
//       await _firestore
//           .collection('users')
//           .doc(messageEntity.receiverId)
//           .collection('chats')
//           .doc(uId)
//           .collection('messages')
//           .add(message);
//     }
//   }
//
//   Stream<List<MessageModel>> getAllMessage({required String receiverId}) {
//     final uId = AuthService().getCurrentUserId();
//     final messageCollection = _firestore
//         .collection('users')
//         .doc(uId)
//         .collection('chats')
//         .doc(receiverId)
//         .collection('messages')
//         .orderBy('sendTime', descending: false)
//         .snapshots(includeMetadataChanges: true);
//     return messageCollection.map((querySnapshot) {
//       return querySnapshot.docs
//           .map((e) => MessageModel.fromJson(e.data()))
//           .toList();
//     });
//   }
//
//   Stream<List<UserEntity>> searchUser({required String name}) {
//     final userCollection = _firestore
//         .collection('users')
//         .where('name', isGreaterThanOrEqualTo: name)
//         .where('name', isLessThanOrEqualTo: '$name\uf8ff')
//         .snapshots(includeMetadataChanges: true);
//     return userCollection.map((querySnapshot) {
//       return querySnapshot.docs
//           .map((e) => UserEntity.fromJson(e.data()))
//           .toList();
//     });
//   }
// }

class StorageService {
  final FirebaseStorage storage;

  StorageService(this.storage);

  Future<String> uploadImage(File imageFile) async {
    try {
      final ext = imageFile.path
          .split('.')
          .last;

      final ref = storage
          .ref()
          .child('images/${DateTime
          .now()
          .millisecondsSinceEpoch}.$ext');
      await ref
          .putFile(imageFile, SettableMetadata(contentType: 'image/$ext'))
          .then((p0) {
        log('Data Transferred: ${p0.bytesTransferred / 1000} kb');
      });
      final imageUrl = await ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      if (kDebugMode) {
        print('Image upload error: $e');
      }
      throw Exception('Failed to upload image');
    }
  }
}
