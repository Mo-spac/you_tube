import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:you_tube/features/auth/model/user_model.dart';

final userDataServiceProvider = Provider(
  (ref) => UserDataService(
    auth: FirebaseAuth.instance,
    fireStore: FirebaseFirestore.instance,
  ),
);

class UserDataService {
  FirebaseAuth auth;
  FirebaseFirestore fireStore;

  UserDataService({
    required this.auth,
    required this.fireStore,
  });

  addUserDataToFireStore({
    required String displayName,
    required String username,
    required String email,
    required String profilePic,
    required String description,
  }) async {
    UserModel user = UserModel(
      displayName: displayName,
      username: username,
      email: email,
      profilePic: profilePic,
      subscriptions: [],
      videos: 0,
      userId: auth.currentUser!.uid,
      description: description,
      type: "user",
    );

    await fireStore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .set(user.toMap());
  }
}
