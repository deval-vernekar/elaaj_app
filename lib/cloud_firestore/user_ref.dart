// import 'package:elaajapp/models/user_model.dart';
// import 'package:firebase_core/firebase_core.dart';

// Future<userModel> getUserProfiles(String phone) async {
//   CollectionReference userRef = FirebaseFirestore.instance.collection('user');
//   DocumentSnapshot snapshot = userRef.doc(phone).get();
//   if (snapshot.exists) {
//     var userModel = userModel.fromJson(snapshot.data());
//   }
// }
