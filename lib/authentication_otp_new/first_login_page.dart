// import 'package:elaajapp/state/state_management.dart';
// import 'package:elaajapp/utility/dimensions.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_ui_auth/firebase_ui_auth.dart';
// import 'package:flutter/material.dart';

// class FirstLoginPage extends StatelessWidget {
//   const FirstLoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(Dimensions.radius20),
//           image: DecorationImage(
//             image: AssetImage('asset/images/Doctors-bro.png'),
//             //fit: BoxFit.cover,
//           )),
//       child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
//         Container(
//           padding: const EdgeInsets.all(16),
//           width: MediaQuery.of(context).size.width,
//           child: ElevatedButton.icon(
//             icon: Icon(Icons.phone),
//             label: Text("LOGIN WITH PHONE"),
//             style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(Colors.black)),
//             onPressed: () => processLogin(context),
//           ),
//         )
//       ]),
//     ));
//   }

//   processLogin(BuildContext context) {
//     var user = FirebaseAuth.instance.currentUser;
//     if (user == null) {
//       FirebaseAuthUi.instance()
//           .launchAuth([AuthProvider.phone()]).then((FirebaseUser) {
//         context.read(userLogged).state = FirebaseAuth.instance.currentUser;
//         print("user login ok");}).catchError(e)
//         {
//           if(e)
//         }
//       });
//     } else {}
//   }
// }
