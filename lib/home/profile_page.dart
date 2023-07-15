import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elaajapp/utility/account_widget.dart';
import 'package:elaajapp/utility/app_icon.dart';
import 'package:elaajapp/utility/big_text.dart';
import 'package:elaajapp/utility/colors.dart';
import 'package:elaajapp/utility/dimensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//signuser out method

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var snap;
  String uid = FirebaseAuth.instance.currentUser!.uid;
  String name = "";
  String email = "";

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }
//   void signOutGoogle() async{
//   await GoogleSignIn.signOut();
//   print("User Sign Out");
// }

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    snap = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    setState(() {
      name = snap.data()!['name'];
      email = snap.data()!['email'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final double top = 110;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff0466de),
        title: BigText(
          text: "Profile",
          size: 21,
          color: Colors.white,
        ),
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
      body: SingleChildScrollView(
        // Wrap the Column with SingleChildScrollView
        child: Container(
          width: double.maxFinite,
          margin: EdgeInsets.only(
            top: Dimensions.height70 * 2,
          ),
          child: Column(
            children: [
              AccountWidget(
                  appIcon: AppIcon(
                    icon: Icons.person,
                    backgroundColor: AppColors.mainColor,
                    //iconColor: AppColors.yellowColor,
                    size: Dimensions.height10 * 5,
                    iconSize: Dimensions.height10 * 5 / 2,
                  ),
                  bigText: BigText(text: name)),
              SizedBox(
                height: Dimensions.height20,
              ),
              AccountWidget(
                  appIcon: AppIcon(
                    icon: Icons.email,
                    backgroundColor: AppColors.yellowColor,
                    //iconColor: AppColors.yellowColor,
                    size: Dimensions.height10 * 5,
                    iconSize: Dimensions.height10 * 5 / 2,
                  ),
                  bigText: BigText(text: email)),
              SizedBox(
                height: Dimensions.height20,
              ),
              AccountWidget(
                  appIcon: AppIcon(
                    icon: Icons.security,
                    backgroundColor: AppColors.mainColor,
                    //iconColor: AppColors.yellowColor,
                    size: Dimensions.height10 * 5,
                    iconSize: Dimensions.height10 * 5 / 2,
                  ),
                  bigText: BigText(text: uid.toLowerCase())),
              SizedBox(
                height: Dimensions.height20,
              ),
              AccountWidget(
                  appIcon: AppIcon(
                    icon: Icons.phone,
                    backgroundColor: AppColors.mainColor,
                    //iconColor: AppColors.yellowColor,
                    size: Dimensions.height10 * 5,
                    iconSize: Dimensions.height10 * 5 / 2,
                  ),
                  bigText: BigText(text: "phone number")),
              SizedBox(
                height: Dimensions.height20,
              ),
              //ElevatedButton(onPressed: () {}, child: Text("Click"))
            ],
          ),
        ),
      ),
    );
  }
}
