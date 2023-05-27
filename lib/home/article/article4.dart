import 'package:elaajapp/home/home.dart';
import 'package:elaajapp/utility/app_icon.dart';
import 'package:elaajapp/utility/big_text.dart';
import 'package:elaajapp/utility/colors.dart';
import 'package:elaajapp/utility/dimensions.dart';
import 'package:elaajapp/utility/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ArticleDetails extends StatelessWidget {
  const ArticleDetails({super.key, String? pageId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 60,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.to(HomePage());
                      },
                      child: Icon(Icons.arrow_back_ios_new_rounded)),
                  Icon(
                    Icons.favorite_border_outlined,
                  ),
                  // AppIcon(icon: Icons.clear),
                  // AppIcon(icon: Icons.shopping_cart_outlined),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: Container(
                  child: Center(
                      child: BigText(
                    text: "article 4",
                    size: Dimensions.font26,
                  )),
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius20),
                          topRight: Radius.circular(Dimensions.radius20))),
                ),
              ),
              pinned: true,
              backgroundColor: AppColors.yellowColor,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "asset/images/ambulance.png",
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Column(
              children: [
                Container(
                  child: ExpandableText(
                      text:
                          "Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'sLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'sLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'sLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'sLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'sLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'sLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'sLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'sLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'stext of the printing and typesetting industry. Lorem Ipsum has been the industry'sLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'sLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'sLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'sLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'sLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'sLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'sLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'sLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. "),
                  margin: EdgeInsets.only(
                      left: Dimensions.width20, right: Dimensions.width20),
                ),
              ],
            )),
          ],
        ));
  }
}
