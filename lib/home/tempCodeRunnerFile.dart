import 'dart:convert';
// import 'package:elaajapp/utility/dimensions.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;

// class Paymentpage extends StatefulWidget {
//   const Paymentpage({super.key});

//   @override
//   State<Paymentpage> createState() => _PaymentpageState();
// }

// class _PaymentpageState extends State<Paymentpage> {
//   // Map<String, dynamic>? paymentIntentData;
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       title: Text('Payment'),
//   //       centerTitle: true,
//   //     ),
//   //     body: Column(
//   //       mainAxisAlignment: MainAxisAlignment.center,
//   //       crossAxisAlignment: CrossAxisAlignment.center,
//   //       children: [
//   //         InkWell(
//   //           onTap: () async {
//   //             await makePayment();
//   //           },
//   //           child: Container(
//   //             height: Dimensions.height50,
//   //             width: 100,
//   //             decoration: BoxDecoration(color: Colors.amberAccent),
//   //             child: Center(
//   //               child: Text("Pay"),
//   //             ),
//   //           ),
//   //         )
//   //       ],
//   //     ),
//   //   );
//   // }

//   // Future<void> makePayment() async {
//   //   try {
//   //     paymentIntentData = await createPaymentIntent('1200', 'USD');
//   //     await Stripe.instance.initPaymentSheet(
//   //         paymentSheetParameters: SetupPaymentSheetParameters(
//   //             paymentIntentClientSecret: paymentIntentData!['client_secret'],
//   //             // googlePay: true,
//   //             // applePay: true,
//   //             style: ThemeMode.dark,
//   //             merchantDisplayName: "Elaaj"));
//   //     displayPaymentSheet();
//   //   } catch (e) {
//   //     print('exception' + e.toString());
//   //   }
//   // }

//   // calculateAmount(String amount) {
//   //   final price = int.parse(amount) * 80;
//   // }

//   // createPaymentIntent(String amount, String currency) async {
//   //   try {
//   //     Map<String, dynamic> body = {
//   //       'amount': calculateAmount(amount),
//   //       'currency': currency,
//   //       'payment_method_types[]': 'card',
//   //     };
//   //     var response = await http.post(
//   //         Uri.parse('https://api.stripe.com/v1/payment_intents'),
//   //         body: body,
//   //         headers: {
//   //           'Authorization':
//   //               'Bearer sk_test_51MwP5GSGMmfUmisBsKhyAumV7ahy5tgrnqjzrQLktK7e4egqpegUUqIIgQht4nLOIkCzfqAcJaad94xtW52eidFY00F8M9btMh',
//   //           'Content-type': 'application/x-www-form-urlencoded',
//   //         });
//   //     return jsonDecode(response.body.toString());
//   //   } catch (e) {
//   //     print('exception' + e.toString());
//   //   }
//   // }

//   // displayPaymentSheet() async {
//   //   try {
//   //     Stripe.instance.presentPaymentSheet(parameters: PresentPaymentSheetParameters(clientSecret:  paymentIntentData!['client_secret'],),
//   //     confirmPayment: true);
//   //   }
//   //   setState(() {
//   //     paymentIntentData = null;
//   //   },)
//   //   catch (e) {
//   //     print(e.toString());
//   //   }
//   // }
//   Map<String, dynamic>? paymentIntent;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Stripe Payment'),
//       ),
//       body: Center(
//         child: TextButton(
//           child: const Text('Make Payment'),
//           onPressed: () async {
//             await makePayment();
//           },
//         ),
//       ),
//     );
//   }

//   Future<void> makePayment() async {
//     try {
//       paymentIntent = await createPaymentIntent('10', 'USD');
//       //Payment Sheet
//       await Stripe.instance
//           .initPaymentSheet(
//               paymentSheetParameters: SetupPaymentSheetParameters(
//                   paymentIntentClientSecret: paymentIntent!['client_secret'],
//                   // applePay: const PaymentSheetApplePay(merchantCountryCode: '+92',),
//                   // googlePay: const PaymentSheetGooglePay(testEnv: true, currencyCode: "US", merchantCountryCode: "+92"),
//                   style: ThemeMode.dark,
//                   merchantDisplayName: 'Adnan'))
//           .then((value) {});

//       ///now finally display payment sheeet
//       displayPaymentSheet();
//     } catch (e, s) {
//       print('exception:$e$s');
//     }
//   }

//   displayPaymentSheet() async {
//     try {
//       await Stripe.instance.presentPaymentSheet().then((value) {
//         showDialog(
//             context: context,
//             builder: (_) => AlertDialog(
//                   content: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Row(
//                         children: const [
//                           Icon(
//                             Icons.check_circle,
//                             color: Colors.green,
//                           ),
//                           Text("Payment Successfull"),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ));
//         // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("paid successfully")));

//         paymentIntent = null;
//       }).onError((error, stackTrace) {
//         print('Error is:--->$error $stackTrace');
//       });
//     } on StripeException catch (e) {
//       print('Error is:---> $e');
//       showDialog(
//           context: context,
//           builder: (_) => const AlertDialog(
//                 content: Text("Cancelled "),
//               ));
//     } catch (e) {
//       print('$e');
//     }
//   }

//   //  Future<Map<String, dynamic>>
//   createPaymentIntent(String amount, String currency) async {
//     try {
//       Map<String, dynamic> body = {
//         'amount': calculateAmount(amount),
//         'currency': currency,
//         'payment_method_types[]': 'card'
//       };

//       var response = await http.post(
//         Uri.parse('https://api.stripe.com/v1/payment_intents'),
//         headers: {
//           'Authorization':
//               'Bearer sk_test_51MwP5GSGMmfUmisBsKhyAumV7ahy5tgrnqjzrQLktK7e4egqpegUUqIIgQht4nLOIkCzfqAcJaad94xtW52eidFY00F8M9btMh',
//           'Content-Type': 'application/x-www-form-urlencoded'
//         },
//         body: body,
//       );
//       // ignore: avoid_print
//       print('Payment Intent Body->>> ${response.body.toString()}');
//       return jsonDecode(response.body);
//     } catch (err) {
//       // ignore: avoid_print
//       print('err charging user: ${err.toString()}');
//     }
//   }

//   calculateAmount(String amount) {
//     final calculatedAmout = (int.parse(amount)) * 100;
//     return calculatedAmout.toString();
//   }
// }
