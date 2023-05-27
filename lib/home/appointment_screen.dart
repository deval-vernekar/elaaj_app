import 'package:elaajapp/utility/dimensions.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppointmentScreen extends StatelessWidget {
  List imgs = [
    "doc1.png",
    "doc2.png",
    "doc3.png",
  ];

  AppointmentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7165D6),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: Dimensions.height50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Stack(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: Dimensions.radius30,
                      backgroundImage: AssetImage("asset/images/doc2.png"),
                    ),
                    SizedBox(
                      height: Dimensions.height15,
                    ),
                    Text(
                      "Dr.A",
                      style: TextStyle(
                        fontSize: Dimensions.font20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Text(
                      "Therapist",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    )
                  ],
                ),
              ),
            ]),
          )
        ],
      )),
    );
  }
}
