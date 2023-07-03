import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:elaajapp/controllers/popular_doctor_controller.dart';
import 'package:elaajapp/pages/articles/article_info.dart';
import 'package:elaajapp/utility/app_column.dart';
import 'package:elaajapp/utility/big_text.dart';
import 'package:elaajapp/utility/colors.dart';
import 'package:elaajapp/utility/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'articles.dart';

class ArticlePageBody extends StatefulWidget {
  const ArticlePageBody({Key? key}) : super(key: key);

  @override
  State<ArticlePageBody> createState() => _ArticlePageBodyState();
}

class _ArticlePageBodyState extends State<ArticlePageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;
  TextEditingController _searchController = TextEditingController();
  List images = [];

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() /*async*/ {
        _currPageValue = pageController.page!;
        // var snap = await FirebaseFirestore.instance
        //     .collection("Articles")
        //     .doc("1nOlfIMmmRoyIaHCsPTa")
        //     .get();
        // images = snap.data()!["images"];
        // print(images);
      });
    });
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
    //super.dispose();
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  _onSearchChanged() {
    print(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //article slider section
        //GetBuilder<PopularDoctorController>(builder: (context) {
        /*return*/ Container(
          height: Dimensions.pageViewContainer,

          child: PageView.builder(
              controller: pageController,
              itemCount: 1,
              /*images.length,*/
              itemBuilder: (context, position) {
                // print("hello");
                // print(images[position]);
                return _buildPageItem(
                  position,
                  _currPageValue,
                  _scaleFactor,
                  _height,
                  // images[position]
                  //     .toString()
                ); //here the images and text are sourced from api for articles section
              }),
          // PageView. builder
          // );
          //}
        ),
        //dots
        //GetBuilder<PopularDoctorController>(builder: (popularDoctors) {
        /* return*/
        new DotsIndicator(
          dotsCount: 1,
          /*images.isEmpty ? 1 : images.length,*/
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        //}),
        SizedBox(
          height: Dimensions.height25,
        ),
        //search bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimensions.radius20),
            ),
            child: TextField(
              onTap: () async {},
              controller: _searchController,
              //textAlign: TextAlign.center,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search,
                    color: Color(0xff5a4fcf),
                    size: Dimensions
                        .iconSize24), // for custom icon try Image.asset("asset/icons/search.png",height: 1,width: 1,),
                border: InputBorder.none,
                hintText: 'How can we help you ?',
              ),
            ),
          ),
        ),
        SizedBox(
          height: Dimensions.height25,
        ),
        //search functionlity end

        SizedBox(
          height: Dimensions.height25,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            children: [
              BigText(
                text: "Available Doctor's",
                size: Dimensions.font20,
              )
            ],
          ),
        ),
        SizedBox(
          height: Dimensions.height25,
        ),
        //available doctors list are
        //list of doctors and details
        GetBuilder<PopularDoctorController>(builder: (popularDoctors) {
          return StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('Doctors').snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final snap = snapshot.data!.docs[index].data();
                      return GestureDetector(
                        // onTap: () {
                        //   Get.toNamed(RouteHelper.articles);
                        // },
                        child: Container(
                          //creating doctor tiles
                          margin: EdgeInsets.only(
                              left: Dimensions.width20,
                              right: Dimensions.width20,
                              bottom: Dimensions.height10),
                          child: Row(
                            children: [
                              //doctor image section
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => ArticleInfo(
                                        pageId: index,
                                        snap: snap,
                                      ));
                                  // Get.to(ArticleInfo(
                                  //   pageId: index,
                                  //   snap: snap,
                                  // ));
                                  // MaterialPageRoute(builder: (context) => ArticleInfo()
                                  /*Get.toNamed(
                                  
                                  RouteHelper.getArticleDetails(index));*/ // here the index is wrong but as of now to work we have used
                                },
                                child: Container(
                                  width: Dimensions.listViewImgSize,
                                  height: Dimensions.listViewImgSize,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius20),
                                    color: Colors.white38,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          /*AppConstants.BASE_URL +
                                                  AppConstants.UPLOAD_URL +*/ //at timestamp 7:30 the code here is changed //from avalaibledoc to popdoctor due to diffferent api loading of imahes in available section
                                          snap['image'].toString()),
                                    ),
                                  ),
                                ),
                              ),
                              //text doctor details container
                              Expanded(
                                child: Container(
                                  height: Dimensions.listViewTextContSize,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(
                                            Dimensions.radius20),
                                        bottomRight: Radius.circular(
                                            Dimensions.radius20)),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: Dimensions.width10,
                                        right: Dimensions.width10),
                                    child: AppColumn(
                                      text: 'Dr. ${snap['name']}',
                                      specilalization: snap['spec'],
                                      location: snap['city'],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              });
        }),
      ],
    );
  }

  Widget _buildPageItem(
    int index,
    _currPageValue,
    _scaleFactor,
    _height,
    /*String imgUrl*/
  ) {
    //print("container image");
    //print(imgUrl);
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale.toDouble(), 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale.toDouble(), 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale.toDouble(), 1);
      matrix = Matrix4.diagonal3Values(1, currScale.toDouble(), 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          InkWell(
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ArticleDetails())),
            child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width10, right: Dimensions.width10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: index.isEven ? Color(0xff5a4fcf) : Color(0xFFffd28d),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("asset/images/ambulance.png"),
                    // image: NetworkImage(
                    //                   /*AppConstants.BASE_URL +
                    //                      AppConstants.UPLOAD_URL +*/
                    //     imgUrl), //AssetImage("asset/images/ambulance.png"),
                    //just the network and imgurl is there and not app constant part
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
