// import 'dart:ui';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:elaajapp/authentication/verify.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   static String verify = "";

//   @override
//   State<LoginPage> createState() => _MyPhoneState();
// }

// class _MyPhoneState extends State<LoginPage> {
//   TextEditingController countryController = TextEditingController();
//   var phone = " ";

//   @override
//   void initState() {
//     // TODO: implement initState
//     countryController.text = "+91";
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue[50],
//       body: Container(
//         margin: EdgeInsets.only(left: 25, right: 25),
//         alignment: Alignment.center,
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 'asset/images/Doctors-bro.png',
//                 width: 250,
//                 height: 250,
//               ),
//               SizedBox(
//                 height: 25,
//               ),
//               Text(
//                 "Phone Verification",
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 "We need to register your phone before getting started!",
//                 style: TextStyle(
//                   fontSize: 16,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Container(
//                 height: 55,
//                 decoration: BoxDecoration(
//                     border: Border.all(width: 1, color: Colors.grey),
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       width: 10,
//                     ),
//                     SizedBox(
//                       width: 40,
//                       child: TextField(
//                         controller: countryController,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                     Text(
//                       "|",
//                       style: TextStyle(fontSize: 33, color: Colors.grey),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Expanded(
//                         child: TextField(
//                       onChanged: (value) {
//                         phone = value;
//                       },
//                       keyboardType: TextInputType.phone,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: "Phone",
//                       ),
//                     ))
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 height: 45,
//                 child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.indigo[600],
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10))),
//                     onPressed: () async {
//                       await FirebaseAuth.instance.verifyPhoneNumber(
//                         phoneNumber: '${countryController.text + phone}',
//                         verificationCompleted:
//                             (PhoneAuthCredential credential) {},
//                         verificationFailed: (FirebaseAuthException e) {},
//                         codeSent: (String verificationId, int? resendToken) {
//                           LoginPage.verify = verificationId;
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => VerifyPage()));
//                         },
//                         codeAutoRetrievalTimeout: (String verificationId) {},
//                       );
//                       // Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyPage()));
//                     },
//                     child: Text("Send the code")),
//               ),
//               // Config.spaceSmall,
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               //     children:
//               //       const<Widget>[
//               //         SocialButton(social:'Google'),
//               //       ],
//               // )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
