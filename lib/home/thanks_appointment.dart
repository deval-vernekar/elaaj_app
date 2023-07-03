import 'package:elaajapp/home/home.dart';
import 'package:elaajapp/home/main_layout.dart';
import 'package:elaajapp/utility/colors.dart';
import 'package:flutter/material.dart';

class ThanksAppointment extends StatefulWidget {
  const ThanksAppointment({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ThanksAppointment> createState() => _ThanksAppointmentState();
}

Color themeColor = AppColors.buttonBackgroundColor;

class _ThanksAppointmentState extends State<ThanksAppointment> {
  double screenWidth = 600;
  double screenHeight = 400;
  Color textColor = const Color(0xff0466de);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 170,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: themeColor,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                "asset/images/Events-bro.png",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: screenHeight * 0.1),
            Text(
              "Thank You!",
              style: TextStyle(
                color: themeColor,
                fontWeight: FontWeight.w600,
                fontSize: 36,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              "Appointment Booked Successfully",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Text(
              "Click here to return to home page",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            SizedBox(height: screenHeight * 0.06),
            Container(
              child: OutlinedButton(
                child: Text('Back',
                    style: TextStyle(
                      fontSize: 12,
                    )),
                onPressed: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
