import 'package:elaajapp/email_login/auth_page.dart';
import 'package:elaajapp/email_login/login_or_register.dart';
import 'package:elaajapp/email_login/login_page.dart';
import 'package:elaajapp/home/emergency_page.dart';
import 'package:elaajapp/home/article_page_body.dart';
import 'package:elaajapp/utility/dimensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'appointment_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        // Safe area prevents from notch or cam cutout
        child: Column(
          children: [
            //app bar

            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      //greetings and name
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello,",
                          style: TextStyle(
                            fontSize: Dimensions.font20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Welcome !",
                          style: TextStyle(
                            fontSize: Dimensions.font20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    //profile picture
                    // Column(
                    //   children: [
                    //     FutureBuilder(
                    //       future: getUserProfiles(FirebaseAuth.instance.currentUser!.phoneNumber),
                    //       builder: (context,snapShot{}));
                    //   ],
                    // ),

                    //emergency
                    InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EmergencyContactsScreen(),
                      )),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xFFffd28d),
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius10),
                        ),
                        height: Dimensions.height40,
                        width: Dimensions.width40,
                        child: Image.asset(
                          "asset/icons/Emergency.png",
                          color: Colors.white,
                        ),
                      ),
                    )
                    // Icon(Icons.person),
                  ]),
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            //showing article section
            Expanded(
                child: SingleChildScrollView(
              child: ArticlePageBody(),
            )),
          ],
        ),
      ),
    );
  }
}
