// import 'package:elaajapp/state/state_management.dart';
// import 'package:flutter/material.dart';
// import 'package:im_stepper/stepper.dart';
// import 'package:provider/provider.dart';
// import 'package:elaajapp/state/state_management.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

//1st code-----------------------------------------

// class BookingStepper extends StatefulWidget {
//   const BookingStepper({super.key});

//   @override
//   State<BookingStepper> createState() => _BookingStepperState();
// }

// class _BookingStepperState extends State<BookingStepper> {
//   @override
//   Widget build(BuildContext context, watch) {
//     var step = watch(currentStep).state;
//     var cityWatch = watch(selectedCity).state;

//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       body: Column(
//         children: [
//           NumberStepper(
//             activeStep: step - 1,
//             direction: Axis.horizontal,
//             enableNextPreviousButtons: false,
//             enableStepTapping: false,
//             numbers: [1, 2, 3, 4],
//             stepColor: Colors.black,
//             activeStepColor: Colors.grey,
//             numberStyle: TextStyle(color: Colors.white),
//           ),
//           Expanded(
//             child: Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Container(
//                   padding: const EdgeInsets.all(8),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                           child: ElevatedButton(
//                         onPressed: step == 1
//                             ? null
//                             : () => context.read(currentStep).state--,
//                         child: const Text('Previous'),
//                       )),
//                       const SizedBox(
//                         width: 30,
//                       ),
//                       Expanded(
//                           child: ElevatedButton(
//                         onPressed: step == 5
//                             ? null
//                             : () => context.read(currentStep).state++,
//                         child: const Text('Next'),
//                       )),
//                       const SizedBox(
//                         width: 30,
//                       ),
//                     ],
//                   ),
//                 )),
//           )
//         ],
//       ),
//     );
//   }
// }

//en 1st -----------------------------

// //2nd code--------------working
// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _activeStepIndex = 0;
//   TextEditingController name = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController pass = TextEditingController();
//   TextEditingController address = TextEditingController();
//   TextEditingController pincode = TextEditingController();

//   List<Step> stepList() => [
//         Step(
//           state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
//           isActive: _activeStepIndex >= 0,
//           title: const Text('Account'),
//           content: Container(),
//           //   child: Column(
//           //     children: [
//           //       TextField(
//           //         controller: name,
//           //         decoration: const InputDecoration(
//           //           border: OutlineInputBorder(),
//           //           labelText: 'Full Name',
//           //         ),
//           //       ),
//           //       const SizedBox(
//           //         height: 8,
//           //       ),
//           //       TextField(
//           //         controller: email,
//           //         decoration: const InputDecoration(
//           //           border: OutlineInputBorder(),
//           //           labelText: 'Email',
//           //         ),
//           //       ),
//           //       const SizedBox(
//           //         height: 8,
//           //       ),
//           //       TextField(
//           //         controller: pass,
//           //         obscureText: true,
//           //         decoration: const InputDecoration(
//           //           border: OutlineInputBorder(),
//           //           labelText: 'Password',
//           //         ),
//           //       ),
//           //     ],
//           //   ),
//           // ),container end
//         ),
//         Step(
//             state:
//                 _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
//             isActive: _activeStepIndex >= 1,
//             title: const Text('Address'),
//             content: Container(
//                 // child: Column(
//                 //   children: [
//                 //     const SizedBox(
//                 //       height: 8,
//                 //     ),
//                 //     TextField(
//                 //       controller: address,
//                 //       decoration: const InputDecoration(
//                 //         border: OutlineInputBorder(),
//                 //         labelText: 'Full House Address',
//                 //       ),
//                 //     ),
//                 //     const SizedBox(
//                 //       height: 8,
//                 //     ),
//                 //     TextField(
//                 //       controller: pincode,
//                 //       decoration: const InputDecoration(
//                 //         border: OutlineInputBorder(),
//                 //         labelText: 'Pin Code',
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ),
//                 )),
//         Step(
//           state: StepState.complete,
//           isActive: _activeStepIndex >= 2,
//           title: const Text('Confirm'),
//           content: Container(
//               //     child: Column(
//               //   crossAxisAlignment: CrossAxisAlignment.start,
//               //   mainAxisAlignment: MainAxisAlignment.start,
//               //   children: [
//               //     Text('Name: ${name.text}'),
//               //     Text('Email: ${email.text}'),
//               //     const Text('Password: *****'),
//               //     Text('Address : ${address.text}'),
//               //     Text('PinCode : ${pincode.text}'),
//               //   ],
//               // )))
//               ),
//         ),
//       ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter Stepper'),
//       ),
//       body: Stepper(
//         type: StepperType.vertical,
//         currentStep: _activeStepIndex,
//         steps: stepList(),
//         onStepContinue: () {
//           if (_activeStepIndex < (stepList().length - 1)) {
//             setState(() {
//               _activeStepIndex += 1;
//             });
//           } else {
//             print('Submited');
//           }
//         },
//         onStepCancel: () {
//           if (_activeStepIndex == 0) {
//             return;
//           }

//           setState(() {
//             _activeStepIndex -= 1;
//           });
//         },
//         onStepTapped: (int index) {
//           setState(() {
//             _activeStepIndex = index;
//           });
//         },

//         // controlsBuilder: (context, {onStepContinue, onStepCancel}) {
//         //   final isLastStep = _activeStepIndex == stepList().length - 1;
//         //   return Container(
//         //     child: Row(
//         //       children: [
//         //         Expanded(
//         //           child: ElevatedButton(
//         //             onPressed: onStepContinue,
//         //             child: (isLastStep)
//         //                 ? const Text('Submit')
//         //                 : const Text('Next'),
//         //           ),
//         //         ),
//         //         const SizedBox(
//         //           width: 10,
//         //         ),
//         //         if (_activeStepIndex > 0)
//         //           Expanded(
//         //             child: ElevatedButton(
//         //               onPressed: onStepCancel,
//         //               child: const Text('Back'),
//         //             ),
//         //           )
//         //       ],
//         //     ),
//         //   );
//         // },
//       ),
//     );
//   }
// }

//2nd end ----------------

///3rd code
///
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Stepper Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Stepper Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentStep = 0;
  List<String> _cities = [];
  List<String> _doctors = [];
  String _selectedCity = '';

  Future<void> _getCities() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('cities').get();
    List<String> cities =
        snapshot.docs.map((doc) => doc['name'].toString()).toList();
    setState(() {
      _cities = cities;
    });
  }

  Future<void> _getDoctorsForCity(String city) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('doctors')
        .where('city', isEqualTo: city)
        .get();
    List<String> doctors =
        snapshot.docs.map((doc) => doc['name'].toString()).toList();
    setState(() {
      _doctors = doctors;
      _selectedCity = city;
      _currentStep = 1;
    });
  }

  @override
  void initState() {
    super.initState();
    _getCities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepTapped: (step) => setState(() => _currentStep = step),
        onStepContinue:
            _currentStep < 1 ? null : () => setState(() => _currentStep += 1),
        onStepCancel:
            _currentStep > 0 ? () => setState(() => _currentStep -= 1) : null,
        steps: [
          Step(
            title: Text('Select City'),
            content: DropdownButtonFormField<String>(
              value: _selectedCity,
              onChanged: (city) => _getDoctorsForCity(city!),
              items: _cities
                  .map((city) =>
                      DropdownMenuItem(child: Text(city), value: city))
                  .toList(),
            ),
            isActive: _currentStep >= 0,
            state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
          ),
          Step(
            title: Text('Select Doctor'),
            content: DropdownButtonFormField<String>(
              value: '',
              onChanged: (doctor) => setState(() {}),
              items: _doctors
                  .map((doctor) =>
                      DropdownMenuItem(child: Text(doctor), value: doctor))
                  .toList(),
            ),
            isActive: _currentStep >= 1,
            state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
          ),
        ],
      ),
    );
  }
}
