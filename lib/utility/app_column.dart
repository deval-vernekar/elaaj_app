import 'package:elaajapp/utility/big_text.dart';
import 'package:elaajapp/utility/colors.dart';
import 'package:elaajapp/utility/dimensions.dart';
import 'package:elaajapp/utility/icon_and_widget.dart';
import 'package:elaajapp/utility/small_text.dart';
import 'package:flutter/material.dart';

class AppColumn extends StatelessWidget {
  final String text;
  final String specilalization;
  final String location;
  const AppColumn(
      {Key? key,
      required this.text,
      required this.specilalization,
      required this.location})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //doctor name
        BigText(
          text: text,
          size: Dimensions.font26,
        ),
        //SizedBox(height: Dimensions.width10,),
        SmallText(text: specilalization),
        // SizedBox(height: Dimensions.height10,),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                  (index) =>
                      Icon(Icons.star, color: AppColors.mainColor, size: 15)),
            ),
            SizedBox(
              height: Dimensions.width10,
            ),
            SmallText(text: "5"),
            // SizedBox(width: Dimensions.width10,),
            // SmallText(text: "1287"),
            // SizedBox(width: Dimensions.width10,),
            // SmallText(text: "comments"),
          ],
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconAndTextWidget(
                icon: Icons.location_on,
                text: location,
                iconColor: AppColors.newColor),
            IconAndTextWidget(
                icon: Icons.access_time_rounded,
                text: "10AM-7PM",
                iconColor: AppColors.iconColor2),
          ],
        ),
      ],
    );
  }
}
