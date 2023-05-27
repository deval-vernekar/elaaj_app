// import 'package:elaajapp/models/image_model.dart';
// import 'package:elaajapp/models/user_model.dart';
// import 'package:firebase_core/firebase_core.dart';

// Future<List<ImageModel>> getBanners(String phone) async {
//   List<ImageModel> result = new List<ImageModel>.empty(growable: true);
//   CollectionReference articleref =
//   FirebaseFirestore.instance.collection('Articles');
//   QuerySnapshot snapshot = articleref.doc(phone).get();
//   snapshot.docs.forEach((element) {
//     result.add(ImageModel.fromJson(element.data()));
//   });
//   return result;
// }
