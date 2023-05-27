import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //signuser out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  final double coverHeight = 280;
  final double profileHeight = 280;

  @override
  Widget build(BuildContext context) {
    final double top = 110;

    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))],
      ),
      // body: Stack(
      //   alignment: Alignment.center,
      //   children: [
      //     buildCoverImage(),
      //     Positioned(
      //       child: buildProfileImage(),
      //       top: top,
      //     )
      //   ],
      // ));
    );
  }
}

// Widget buildCoverImage() => Container(
//       color: Colors.grey,
//       child: Image.network(
//         'https://cdn.dribbble.com/users/1450874/screenshots/14691183/media/f6e87b3caa3bc8ce90dbfb7af515fad6.jpg?compress=1&resize=1000x750&vertical=top',
//         width: double.infinity,
//         height: 280,
//         fit: BoxFit.cover,
//       ),
//     );

// Widget buildProfileImage() => CircleAvatar(
//     radius: 144 / 2,
//     backgroundColor: Colors.grey.shade800,
//     backgroundImage: NetworkImage(
//         'https://cdn.dribbble.com/users/2749602/screenshots/15183939/media/46b88d11e3bf62aa1e4ad81131e41a0e.jpg?compress=1&resize=1000x750&vertical=top'));


//---------------------------------------------------
// class UpcomingCard extends StatelessWidget {
//   const UpcomingCard({
//     Key? key,
//   }) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     width: double.maxFinite,
  //     height: 150,
  //     padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 20),
  //     decoration: BoxDecoration(
  //       color: Theme.of(context).primaryColor.withOpacity(0.8),
  //       borderRadius: BorderRadius.circular(20),
  //     ),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         ClipRRect(
  //           borderRadius: BorderRadius.circular(10),
  //           child: Image.asset(
  //             'assets/doctor_2.jpg',
  //             width: 45,
  //             fit: BoxFit.cover,
  //           ),
  //         ),
  //         const SizedBox(width: 14),
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               "Dr. Ruben Dorwart",
  //               style: TextStyle(
  //                 fontSize: 18,
  //                 fontWeight: FontWeight.bold,
  //                 color: Theme.of(context).colorScheme.onPrimary,
  //               ),
  //             ),
  //             const SizedBox(height: 5),
  //             Text(
  //               "Dental Specialist",
  //               style: Theme.of(context).textTheme.bodyText1!.copyWith(
  //                     color: Colors.white70,
  //                   ),
  //             ),
  //             const SizedBox(height: 18),
  //             Container(
  //               padding: const EdgeInsets.symmetric(
  //                 vertical: 6,
  //                 horizontal: 8.0,
  //               ),
  //               decoration: BoxDecoration(
  //                   color: Colors.white10,
  //                   borderRadius: BorderRadius.circular(10)),
  //               child: Row(
  //                 children: const [
  //                   Icon(
  //                     Icons.calendar_month,
  //                     size: 18,
  //                     color: Colors.white,
  //                   ),
  //                   Padding(
  //                     padding: EdgeInsets.only(left: 6, right: 14),
  //                     child: Text(
  //                       "Today",
  //                       style: TextStyle(color: Colors.white),
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: EdgeInsets.only(right: 8),
  //                     child: Icon(
  //                       Icons.timer,
  //                       size: 18,
  //                       color: Colors.white,
  //                     ),
  //                   ),
  //                   Text(
  //                     "14:30 - 15:30 AM",
  //                     style: TextStyle(
  //                       color: Colors.white,
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             )
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }
//}