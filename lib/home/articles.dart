import 'package:elaajapp/home/home.dart';
import 'package:elaajapp/home/main_layout.dart';
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
                        Get.to(() => const MainLayout());
                      },
                      child: Icon(Icons.arrow_back_ios_new_rounded)),
                  const Icon(
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
                    text: "Emergency Services",
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
                          "When calling emergency services for an ambulance, it's important to provide clear and concise information to help them respond effectively. Here are some essential notes to include:\n1.Location: Provide the exact address or intersection of the incident. If you're unsure of the address, provide landmarks or any other descriptive information that can help the ambulance locate the scene quickly.\n2.Nature of the Emergency: Briefly describe the situation, such as a traffic accident, a medical emergency, or a fall. Be specific about the type of injury or symptoms observed, if known.\n3.Number of Patients: Clearly state the number of people requiring medical assistance. Specify if there are any critical injuries or if multiple ambulances may be needed.\n4.Caller's Contact Information: Provide your name, phone number, and any additional contact details required. This information allows emergency services to reach you if they need further information or updates.\n5.Hazards or Special Circumstances: If there are any potential hazards at the scene, such as a fire, downed power lines, or hazardous materials, make sure to mention them. This information helps ensure the safety of the emergency responders.\n6.Instructions or Special Requests: If there are specific instructions or special requests, such as guiding the ambulance to a specific entrance or if the patient requires special equipment, communicate this clearly to the dispatcher.\nRemember, it's important to stay calm and answer any additional questions the dispatcher may have. They are trained to gather critical information and provide appropriate assistance. Follow their instructions and try to provide as much detail as possible to ensure a swift and effective response."),
                  margin: EdgeInsets.only(
                      left: Dimensions.width20, right: Dimensions.width20),
                ),
              ],
            )),
          ],
        ));
  }
}
