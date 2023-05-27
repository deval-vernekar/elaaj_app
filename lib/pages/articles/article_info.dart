import 'package:elaajapp/controllers/popular_doctor_controller.dart';
import 'package:elaajapp/home/booking_screen.dart';
import 'package:elaajapp/home/main_layout.dart';
import 'package:elaajapp/routes/routes_helper.dart';
import 'package:elaajapp/utility/app_column.dart';
import 'package:elaajapp/utility/app_constants.dart';
import 'package:elaajapp/utility/big_text.dart';
import 'package:elaajapp/utility/dimensions.dart';
import 'package:elaajapp/utility/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleInfo extends StatefulWidget {
  final int pageId;
  final snap;
  const ArticleInfo({Key? key, required this.pageId, required this.snap})
      : super(key: key);

  @override
  State<ArticleInfo> createState() => _ArticleInfoState();
}

class _ArticleInfoState extends State<ArticleInfo> {
//this is doctor_details_screen and  the article part is in
  @override
  Widget build(BuildContext context) {
    var doctor =
        Get.find<PopularDoctorController>().popularDoctorList[widget.pageId];
    //print("page ID :" + pageId.toString());
    //print("doctor details is :" + doctor.firstName + " " + doctor.lastName);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 252, 217, 204),
        leading: GestureDetector(
          onTap: () {
            Get.toNamed(RouteHelper.initial);
          },
          child: GestureDetector(
              onTap: () {
                Get.to(() => MainLayout());
              },
              child: Icon(Icons.arrow_back_ios_new_rounded)),
        ),
        // title: Text('Article Info'),
      ),
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.articleImage,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(widget.snap['image'].toString()),
                ),
              ),
            ),
          ),
          Positioned(
            top: Dimensions.height30 + kToolbarHeight,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // add more children here as needed
                ],
              ),
            ),
          ),
          //icons and Doctext
          Positioned(
              left: 0,
              right: 0,
              // bottom: 0,
              top: Dimensions.articleImage - 20,
              child: Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      top: Dimensions.height20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius20),
                          topRight: Radius.circular(Dimensions.radius20)),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(
                        text: 'Dr. ${widget.snap['name']}',
                        specilalization: widget.snap['spec'],
                        location: widget.snap['city'],
                      ),
                      SizedBox(height: Dimensions.height20),
                      BigText(text: 'About'),
                      ExpandableText(
                        text: widget.snap['about'].toString(),
                      )
                      //product.description or email anything that you want to print 8:21
                    ],
                  ))),
          //introduction-doctor
          //       Positioned(
          // left: 0,
          // right: 0,
          // // bottom: 0,
          // top: Dimensions.articleImage - 20,
          // child: Container(
          //     padding: EdgeInsets.only(
          //         left: Dimensions.width20,
          //         right: Dimensions.width20,
          //         top: Dimensions.height20),
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.only(
          //             topLeft: Radius.circular(Dimensions.radius20),
          //             topRight: Radius.circular(Dimensions.radius20)),
          //         color: Colors.white),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         AppColumn(text: "Dr.ABC"),
          //         SizedBox(height: Dimensions.height20),
          //         BigText(text: "Introduction")
          //       ],
          //     ))),
        ],
      ),
      //this is the bottom part of the article page that may contain link //3:47 timestamp +-
      bottomNavigationBar: Container(
        height: 80,
        padding: EdgeInsets.only(
            top: Dimensions.height30,
            bottom: Dimensions.height30,
            right: Dimensions.width20,
            left: Dimensions.width20),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 243, 241, 241),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20),
                topRight: Radius.circular(Dimensions.radius20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => DateAndTime(
                          docid: widget.snap['docid'].toString(),
                          docimage: widget.snap['image'].toString(),
                          docname: widget.snap['name'].toString(),
                          docspec: widget.snap['spec'].toString(),

                          //doctors: '',
                        )), //earlier was bookinpage()
              ),
              child: Container(
                alignment: Alignment.center,
                width: 200,
                height: 500,
                // padding: EdgeInsets.only(
                //     top: Dimensions.height20,
                //     bottom: Dimensions.height20,
                //     left: Dimensions.width20,
                //     right: Dimensions.width20),
                child: BigText(
                  text: "Book Appointment",
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Color(0xff5a4fcf)),
              ),
            ),
            //SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
