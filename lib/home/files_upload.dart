import 'dart:io';

import 'package:elaajapp/utility/button_widget.dart';
import 'package:elaajapp/utility/firebase_api.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

//Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);

//   await Firebase.initializeApp();

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   static final String title = 'Firebase Upload';

//   @override
//   Widget build(BuildContext context) => MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: title,
//         theme: ThemeData(primarySwatch: Colors.green),
//         home: MainPage(),
//       );
// }

// class MainPage extends StatefulWidget {
//   @override
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   UploadTask? task;
//   File? file;

//   @override
//   Widget build(BuildContext context) {
//     final fileName = file != null ? basename(file!.path) : 'No File Selected';

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(MyApp.title),
//         centerTitle: true,
//       ),
//       body: Container(
//         padding: EdgeInsets.all(32),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ButtonWidget(
//                 text: 'Select File',
//                 icon: Icons.attach_file,
//                 onClicked: selectFile,
//               ),
//               SizedBox(height: 8),
//               Text(
//                 fileName,
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//               ),
//               SizedBox(height: 48),
//               ButtonWidget(
//                 text: 'Upload File',
//                 icon: Icons.cloud_upload_outlined,
//                 onClicked: uploadFile,
//               ),
//               SizedBox(height: 20),
//               task != null ? buildUploadStatus(task!) : Container(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future selectFile() async {
//     final result = await FilePicker.platform.pickFiles(allowMultiple: false);

//     if (result == null) return;
//     final path = result.files.single.path!;

//     setState(() => file = File(path));
//   }

//   Future uploadFile() async {
//     if (file == null) return;

//     final fileName = basename(file!.path);
//     final destination = 'files/$fileName';

//     task = FirebaseApi.uploadFile(destination, file!);
//     setState(() {});

//     if (task == null) return;

//     final snapshot = await task!.whenComplete(() {});
//     final urlDownload = await snapshot.ref.getDownloadURL();

//     print('Download-Link: $urlDownload');
//   }

//   Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
//         stream: task.snapshotEvents,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final snap = snapshot.data!;
//             final progress = snap.bytesTransferred / snap.totalBytes;
//             final percentage = (progress * 100).toStringAsFixed(2);

//             return Text(
//               '$percentage %',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             );
//           } else {
//             return Container();
//           }
//         },
//       );
// }
// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elaajapp/imageUpload/image_retrive.dart';
import 'package:elaajapp/imageUpload/image_upload.dart';
import 'package:elaajapp/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class UserProfilePage extends StatefulWidget {
//   @override
//   _UserProfilePageState createState() => _UserProfilePageState();
// }

// class _UserProfilePageState extends State<UserProfilePage> {
//   late File _imageFile;
//   final picker = ImagePicker();

//   String _firstName = '';
//   String _lastName = '';
//   String _phoneNumber = '';
//   String _address = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Profile'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Center(
//                 child: GestureDetector(
//                   onTap: () {
//                     _pickImage();
//                   },
//                   child: CircleAvatar(
//                     backgroundImage: _imageFile == null
//                         ? AssetImage('asset/images/doc1.png')
//                         : FileImage(_imageFile) as ImageProvider<Object>,
//                     radius: 75,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'First Name',
//                 ),
//                 onChanged: (value) {
//                   _firstName = value;
//                 },
//               ),
//               SizedBox(height: 16),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Last Name',
//                 ),
//                 onChanged: (value) {
//                   _lastName = value;
//                 },
//               ),
//               SizedBox(height: 16),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Phone Number',
//                 ),
//                 onChanged: (value) {
//                   _phoneNumber = value;
//                 },
//               ),
//               SizedBox(height: 16),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Address',
//                 ),
//                 onChanged: (value) {
//                   _address = value;
//                 },
//               ),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () {
//                   _saveProfile();
//                 },
//                 child: Text('Save'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _pickImage() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       if (pickedFile != null) {
//         _imageFile = File(pickedFile.path);
//       }
//     });
//   }

//   Future<void> _saveProfile() async {
//     // Upload image to Firebase Storage
//     String imageUrl = '';
//     if (_imageFile != null) {
//       final Reference firebaseStorageRef = FirebaseStorage.instance
//           .ref()
//           .child('profile_pictures/${DateTime.now().toIso8601String()}');
//       final UploadTask task = firebaseStorageRef.putFile(_imageFile);
//       final TaskSnapshot snapshot = await task;
//       imageUrl = await snapshot.ref.getDownloadURL();
//     }

//     // Save profile data to Firebase Firestore
//     await FirebaseFirestore.instance.collection('users').doc().set({
//       'first_name': _firstName,
//       'last_name': _lastName,
//       'phone_number': _phoneNumber,
//       'address': _address,
//       'profile_picture': imageUrl,
//     });

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Profile saved successfully!'),
//       ),
//     );
//   }
// }
class FilesUploadPage extends StatefulWidget {
  const FilesUploadPage({super.key});

  @override
  State<FilesUploadPage> createState() => _FilesUploadPageState();
}

class _FilesUploadPageState extends State<FilesUploadPage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  //signuser out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "File Upload",
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(22),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ImageUpload(
                                  userId: loggedInUser.uid,
                                )));
                  },
                  child: const Text("Upload Image"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ImageRetrive(userId: loggedInUser.uid)));
                  },
                  child: const Text("Show Uploads"),
                ),
              ]),
        ),
      ),
    );
  }
}
