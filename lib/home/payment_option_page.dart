import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elaajapp/home/payment_page.dart';
import 'package:elaajapp/home/upi_payment_page.dart';
import 'package:elaajapp/utility/dimensions.dart';
import 'package:flutter/material.dart';

class PaymentOptions extends StatefulWidget {
  const PaymentOptions({super.key});

  @override
  State<PaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff0466de),
        title: Text(
          "Payments",
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(22),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff0466de),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0)),
                    minimumSize: Size(200, 60),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UPIPayment()),
                    );
                  },
                  child: const Text("Pay Using UPI"),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff0466de),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0)),
                    minimumSize: Size(200, 60),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PaymentPage()));
                  },
                  child: const Text("Pay Using Card"),
                ),
              ]),
        ),
      ),
    );
  }
}
