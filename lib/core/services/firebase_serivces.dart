import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';

class AuthService {
  final FirebaseAuth auth;

  final GoogleSignIn googleSignIn;

  final GitHubSignIn gitHubSignIn;

  final TwitterLogin twitterLogin;
  AuthService(
      {required this.gitHubSignIn,
      required this.auth,
      required this.googleSignIn,
      required this.twitterLogin
      });

  Future<UserCredential> signIn(
      {required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // await DatabaseService().updateUser({
      //   'lastActive': DateTime.now(),
      //   'uId': auth.currentUser!.uid,
      //   'isOnline': 'true',
      // });
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
    } catch (e) {
      if (kDebugMode) {
        print('Forgot password error: $e');
      }
      throw Exception('Failed to reset password');
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
    } catch (e) {
      if (kDebugMode) {
        print('Sign out error: $e');
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
    } catch (e) {
      if (kDebugMode) {
        print('Google sign in error: $e');
      }
      throw Exception('Failed to sign in with Google');
    }
  }

  Future<void> signInWithTwitter() async {
    // Create a TwitterLogin instance
    try {
      final authResult = await twitterLogin.login();

      // Create a credential from the access token
      final twitterAuthCredential = TwitterAuthProvider.credential(
        accessToken: authResult.authToken!,
        secret: authResult.authTokenSecret!,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);
    }  catch (e) {
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
      await FirebaseAuth.instance.signInWithCredential(githubAuthCredential);
    } catch (e) {
      if (e is FirebaseAuthException && e.code == 'account-exists-with-different-credential') {
        print('The account already exists with a different credential');
      } else {
        // Handle other exceptions or generic sign-in failure scenarios.
        if (kDebugMode) {
          print('GitHub sign in error: $e');
        }
        throw Exception('Failed to sign in with GitHub');
      }
    }
  }

  Future<bool> isEmailVerified() async {
    final user = auth.currentUser!;
    await user.reload();
    return user.emailVerified;
  }

  Future<void> sendVerificationEmail() async {
    try {
      final user = auth.currentUser!;
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      } else {
        throw Exception('Email is already verified');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  updateEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final user = auth.currentUser!;
      await user.updateEmail(email);
      await user.updatePassword(password);
    } catch (e) {
      if (kDebugMode) {
        print('Update email and password error: $e');
      }
      throw Exception('Failed to update email and password');
    }
  }
}

// class DatabaseService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   Future<void> createUser(UserEntity userEntity) async {
//     final userCollection = _firestore.collection('users');
//     final uid = AuthService().getCurrentUserId();
//     if (uid != null) {
//       final userData = await userCollection.doc(uid).get();
//       if (!userData.exists) {
//         final user = userEntity.toJson();
//         await userCollection.doc(uid).set(user);
//       }
//     } else {
//       throw Exception('Failed to create user');
//     }
//   }
//
//   Stream<List<UserEntity>> getAllUsers() {
//     final userCollection =
//         _firestore.collection('users').orderBy('lastActive', descending: true);
//
//     return userCollection.snapshots(includeMetadataChanges: true).map(
//           (querySnapshot) => querySnapshot.docs
//               .map((e) => UserEntity.fromJson(e.data()))
//               .toList(),
//         );
//   }
//
//   Future<void> updateUser(Map<String, dynamic> data) async {
//     try {
//       await _firestore
//           .collection('users')
//           .doc(FirebaseAuth.instance.currentUser!.uid)
//           .update(data);
//     } catch (e) {
//       if (kDebugMode) {
//         print('Error updating user: $e');
//       }
//       throw Exception('Failed to update user');
//     }
//   }
//
//   Stream<UserEntity> getSingleUser(String uId) {
//     final userDoc = _firestore.collection('users').doc(uId);
//
//     return userDoc.snapshots(includeMetadataChanges: true).map((userSnapshot) {
//       if (userSnapshot.exists) {
//         final userData = userSnapshot.data() as Map<String, dynamic>;
//         return UserEntity.fromJson(userData);
//       }
//       throw Exception('User does not exist');
//     });
//   }
//
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
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadImage(File imageFile) async {
    try {
      final ext = imageFile.path.split('.').last;

      final ref = _storage
          .ref()
          .child('images/${DateTime.now().millisecondsSinceEpoch}.$ext');
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
