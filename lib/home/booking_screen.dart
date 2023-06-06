import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elaajapp/controllers/payment_controller.dart';
import 'package:elaajapp/home/main_layout.dart';
import 'package:elaajapp/home/payment_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class DateAndTime extends StatefulWidget {
  final String docid;
  final String docimage;
  final String docspec;
  final String docname;

  const DateAndTime(
      {Key? key,
      required this.docid,
      required this.docimage,
      required this.docname,
      required this.docspec})
      : super(key: key);

  @override
  _DateAndTimeState createState() => _DateAndTimeState();
}

class _DateAndTimeState extends State<DateAndTime> {
  int _selectedDay = 2;
  int _selectedRepeat = 0;
  String _selectedHour = '19:00';
  List list = [];
  List<int> _selectedExteraCleaning = [];
  var snap;
  var apt;
  bool first = false;

  ItemScrollController _scrollController = ItemScrollController();

  final List<dynamic> _days = [
    [1, 'Fri'],
    [2, 'Sat'],
    [3, 'Sun'],
    [4, 'Mon'],
    [5, 'Tue'],
    [6, 'Wed'],
    [7, 'Thu'],
    [8, 'Fri'],
    [9, 'Sat'],
    [10, 'Sun'],
  ];

  final List<String> _hours = <String>[
    '01:00',
    '01:30',
    '02:00',
    '02:30',
    '03:00',
    '03:30',
    '04:00',
    '04:30',
    '05:00',
    '05:30',
    '06:00',
    '06:30',
    '07:00',
    '07:30',
    '08:00',
    '08:30',
  ];

  final List<String> _repeat = [
    // 'No repeat',
    // 'Every day',
    // 'Every week',
    // 'Every month'
    '09:30',
    '10:00',
    '10:30',
    '11:00',
    '11:30',
  ];

  // final List<dynamic> _exteraCleaning = [
  //   ['Cold', 'https://img.icons8.com/office/2x/washing-machine.png', '10'],
  //   ['Fridge', 'https://img.icons8.com/cotton/2x/fridge.png', '8'],
  //   [
  //     'Oven',
  //     'https://img.icons8.com/external-becris-lineal-color-becris/2x/external-oven-kitchen-cooking-becris-lineal-color-becris.png',
  //     '8'
  //   ],
  //   [
  //     'Vehicle',
  //     'https://img.icons8.com/external-vitaliy-gorbachev-blue-vitaly-gorbachev/2x/external-bycicle-carnival-vitaliy-gorbachev-blue-vitaly-gorbachev.png',
  //     '20'
  //   ],
  //   // [
  //   //   'Windows',
  //   //   'https://img.icons8.com/external-kiranshastry-lineal-color-kiranshastry/2x/external-window-interiors-kiranshastry-lineal-color-kiranshastry-1.png',
  //   //   '20'
  //   // ],
  // ];

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 500), () {
      _scrollController.scrollTo(
        index: 24,
        duration: Duration(seconds: 3),
        curve: Curves.easeInOut,
      );
    });

    getData();
    super.initState();
  }

  getData() async {
    snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    try {
      apt = await FirebaseFirestore.instance
          .collection('Doctors')
          .doc(widget.docid)
          .collection('appointment')
          .doc('June')
          .get();
      print(
          '--------------------------------------appointment -----------------------');
      list = apt.data()!['appointments_day'];
    } catch (e) {
      first = true;
      list = [];
      print('checking err..................................................');
      print(e);
    }
  }

  //final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //final PaymentController = Get.put(PaymentController());
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // final appointment = {
            //   'day': _selectedDay,
            //   'hour': _selectedHour,
            //   'repeat': _repeat[_selectedRepeat],
            //   'extra_cleaning': _selectedExteraCleaning
            //       .map((index) => _exteraCleaning[index][0])
            //       .toList(),
            // };

            // FirebaseFirestore.instance
            //     .collection('Doctors').doc(widget.docid).collection('appointment').doc('${_selectedDay}').;
            var uuid = const Uuid();
            String id = uuid.v1();

            if (!list.contains('$_selectedDay $_selectedHour') || first) {
              FirebaseFirestore.instance
                  .collection('users')
                  .doc(snap.data()!['uid'].toString())
                  .collection('appointment')
                  .doc(id) // change months accordingly
                  .set({
                'doctorid': widget.docid,
                'id': id,
                'docimage': widget.docimage,
                'month': 'June',
                'day': _selectedDay.toString(),
                'time': _selectedHour.toString(),
                'docname': widget.docname,
                'docspec': widget.docspec,
              });
              if (first) {
                FirebaseFirestore.instance
                    .collection('Doctors')
                    .doc(widget.docid)
                    .collection('appointment')
                    .doc('June')
                    .set({
                  'appointments_day':
                      FieldValue.arrayUnion(['$_selectedDay $_selectedHour'])
                });
              } else {
                FirebaseFirestore.instance
                    .collection('Doctors')
                    .doc(widget.docid)
                    .collection('appointment')
                    .doc('June')
                    .update({
                  'appointments_day':
                      FieldValue.arrayUnion(['$_selectedDay $_selectedHour'])
                });
              }
            } else {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Sorry Time Slot is Already Booked"),
                  );
                },
              );
            }

            //--------------------------------------

//---------------------------------------

            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => MainLayout()),
            // );

            // final name = controller.text;
            // createAppointment()
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => PaymentPage(),
            //   ),
            // );
          },
          child: Icon(Icons.arrow_forward_ios),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                  child: Padding(
                padding: EdgeInsets.only(top: 70.0, right: 20.0, left: 20.0),
                child: Text(
                  'Select Date \nand Time',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.grey.shade900,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ))
            ];
          },
          body: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Date",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //Spacer(),
                    // IconButton(
                    //   padding: EdgeInsets.all(0),
                    //   onPressed: () {},
                    //   icon: Icon(
                    //     Icons.arrow_drop_down_circle_outlined,
                    //     color: Colors.grey.shade700,
                    //   ),
                    // )
                  ],
                ),
                Container(
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border:
                          Border.all(width: 1.5, color: Colors.grey.shade200),
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _days.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedDay = _days[index][0];
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            width: 62,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: _selectedDay == _days[index][0]
                                  ? Colors.blue.shade100.withOpacity(0.5)
                                  : Colors.blue.withOpacity(0),
                              border: Border.all(
                                color: _selectedDay == _days[index][0]
                                    ? Colors.blue
                                    : Colors.white.withOpacity(0),
                                width: 1.5,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _days[index][0].toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  _days[index][1],
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )),
                SizedBox(
                  height: 10,
                ),
                // Container(
                //   height: 60,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     color: Colors.white,
                //     border: Border.all(width: 1.5, color: Colors.grey.shade200),
                //   ),
                // child: ScrollablePositionedList.builder(
                //     itemScrollController: _scrollController,
                //     scrollDirection: Axis.horizontal,
                //     itemCount: _hours.length,
                //     itemBuilder: (BuildContext context, int index) {
                //       return GestureDetector(
                //         onTap: () {
                //           setState(() {
                //             _selectedHour = _hours[index];
                //           });
                //         },
                //         child: AnimatedContainer(
                //           duration: Duration(milliseconds: 300),
                //           width: 100,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(5),
                //             color: _selectedHour == _hours[index]
                //                 ? Colors.orange.shade100.withOpacity(0.5)
                //                 : Colors.orange.withOpacity(0),
                //             border: Border.all(
                //               color: _selectedHour == _hours[index]
                //                   ? Colors.orange
                //                   : Colors.white.withOpacity(0),
                //               width: 1.5,
                //             ),
                //           ),
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Text(
                //                 _hours[index],
                //                 style: TextStyle(
                //                     fontSize: 20,
                //                     fontWeight: FontWeight.w500),
                //               ),
                //             ],
                //           ),
                //         ),
                //       );
                //     }),
                // ),
                SizedBox(
                  height: 40,
                ),

                Text(
                  "Time",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _repeat.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedHour = _hours[index];
                          });
                          // onTap: () {
                          //   setState(() {
                          //     _selectedRepeat = index;
                          //   });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: _selectedHour == _hours[index]
                                ? Colors.blue.shade400
                                : Colors.grey.shade100,
                          ),
                          margin: EdgeInsets.only(right: 20),
                          child: Center(
                              child: Text(
                            _hours[index],
                            style: TextStyle(
                                fontSize: 18,
                                color: _selectedHour == _hours[index]
                                    ? Colors.white
                                    : Colors.grey.shade800),
                          )),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                // FadeAnimation(1.4, Text("Additional Service", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),)),
                SizedBox(
                  height: 10,
                ),
                // Container(
                //   height: 120,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     color: Colors.white,
                //   ),
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: _exteraCleaning.length,
                //     itemBuilder: (context, index) {
                //       return GestureDetector(
                //         onTap: () {
                //           setState(() {
                //             if (_selectedExteraCleaning.contains(index)) {
                //               _selectedExteraCleaning.remove(index);
                //             } else {
                //               _selectedExteraCleaning.add(index);
                //             }
                //           });
                //         },
                //         child: Container(
                //           width: 110,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(15),
                //             color: _selectedExteraCleaning.contains(index)
                //                 ? Colors.blue.shade400
                //                 : Colors.transparent,
                //           ),
                //           margin: EdgeInsets.only(right: 20),
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             children: [
                //               Image.network(
                //                 _exteraCleaning[index][1],
                //                 height: 40,
                //               ),
                //               SizedBox(
                //                 height: 10,
                //               ),
                //               Text(
                //                 _exteraCleaning[index][0],
                //                 style: TextStyle(
                //                     fontSize: 15,
                //                     fontWeight: FontWeight.w500,
                //                     color:
                //                         _selectedExteraCleaning.contains(index)
                //                             ? Colors.white
                //                             : Colors.grey.shade800),
                //               ),
                //               SizedBox(
                //                 height: 5,
                //               ),
                //               Text(
                //                 "+${_exteraCleaning[index][2]}\$",
                //                 style: TextStyle(color: Colors.black),
                //               )
                //             ],
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ));
  }
}

class ScrollablePositionedList {
  static builder(
      {required ItemScrollController itemScrollController,
      required Axis scrollDirection,
      required int itemCount,
      required GestureDetector Function(BuildContext context, int index)
          itemBuilder}) {}
}

class ItemScrollController {
  final ScrollController _scrollController;

  ItemScrollController() : _scrollController = ScrollController();

  double get offset => _scrollController.offset;

  set offset(double value) => _scrollController.jumpTo(value);

  void jumpTo({double offset = 0.0}) {
    _scrollController.jumpTo(offset);
  }

  void animateTo(
      {required double offset,
      required Duration duration,
      required Curve curve}) {
    _scrollController.animateTo(offset, duration: duration, curve: curve);
  }

  void dispose() {
    _scrollController.dispose();
  }

  void scrollTo(
      {required int index, required Duration duration, required Cubic curve}) {}
}
