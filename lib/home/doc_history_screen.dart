import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elaajapp/home/doctor_appointment_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// class DocHistory extends StatefulWidget {
//   const DocHistory({super.key});

//   @override
//   State<DocHistory> createState() => _DocHistoryState();
// }

// class _DocHistoryState extends State<DocHistory> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(children: [
//           Padding(
//             padding: const EdgeInsets.all(20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 //1
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: () => Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => MyHomePage(
//                         title: 'title1',
//                       ),
//                     )),
//                     child: Container(
//                       child: Card(
//                         child: Padding(
//                           padding: const EdgeInsets.all(6),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.book_online,
//                                 size: 58,
//                               ),
//                               Text(
//                                 "Booking",
//                                 style: GoogleFonts.poppins(),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 //2
//                 Expanded(
//                   child: Container(
//                     child: Card(
//                       child: Padding(
//                         padding: const EdgeInsets.all(6),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(
//                               Icons.shopping_cart,
//                               size: 58,
//                             ),
//                             Text(
//                               "Cart",
//                               style: GoogleFonts.poppins(),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 //3
//                 Expanded(
//                   child: Container(
//                     child: Card(
//                       child: Padding(
//                         padding: const EdgeInsets.all(6),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(
//                               Icons.history,
//                               size: 58,
//                             ),
//                             Text(
//                               "History",
//                               style: GoogleFonts.poppins(),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           //banner used on doc history page not needed
//           // FutureBuilder(
//           //     future: getBanners(),
//           //     builder: (context, snapshot) {
//           //       if (snapshot.connectionState == ConnectionState.waiting) {
//           //         return Center(
//           //           child: CircularProgressIndicator(),
//           //         );
//           //       } else {
//           //         var banner = snapshot.data as List<ImageModel>;
//           //         return CarouselSlider(
//           //           items: banner.map((e)=>Container(child:ClipRRect(borderRadius: BorderRadius.all(6),child: Image.network(e.image),),
//           //         )).toList(), options: null,);
//           //       }
//           //     })
//         ]),
//       ),
//     );
//   }
// }

class ScheduleTab extends StatefulWidget {
  const ScheduleTab({Key? key}) : super(key: key);

  @override
  State<ScheduleTab> createState() => _ScheduleTabState();
}

enum FilterStatus { Upcoming, Complete, Cancel }

List<Map> schedules = [
  {
    'img': 'asset/images/doc1.png',
    'doctorName': 'Dr. Anastasya Syahid',
    'doctorTitle': 'Dental Specialist',
    'reservedDate': 'Monday, Aug 29',
    'reservedTime': '11:00 - 12:00',
    'status': FilterStatus.Upcoming
  },
  {
    'img': 'asset/images/doc2.png',
    'doctorName': 'Dr. Mauldya Imran',
    'doctorTitle': 'Skin Specialist',
    'reservedDate': 'Monday, Sep 29',
    'reservedTime': '11:00 - 12:00',
    'status': FilterStatus.Upcoming
  },
  {
    'img': 'asset/images/doc3.png',
    'doctorName': 'Dr. Rihanna Garland',
    'doctorTitle': 'General Specialist',
    'reservedDate': 'Monday, Jul 29',
    'reservedTime': '11:00 - 12:00',
    'status': FilterStatus.Upcoming
  },
  {
    'img': 'asset/images/doc1.png',
    'doctorName': 'Dr. John Doe',
    'doctorTitle': 'Something Specialist',
    'reservedDate': 'Monday, Jul 29',
    'reservedTime': '11:00 - 12:00',
    'status': FilterStatus.Complete
  },
  {
    'img': 'asset/images/doc2.png',
    'doctorName': 'Dr. Sam Smithh',
    'doctorTitle': 'Other Specialist',
    'reservedDate': 'Monday, Jul 29',
    'reservedTime': '11:00 - 12:00',
    'status': FilterStatus.Cancel
  },
  {
    'img': 'asset/images/doc3.png',
    'doctorName': 'Dr. Sam Smithh',
    'doctorTitle': 'Other Specialist',
    'reservedDate': 'Monday, Jul 29',
    'reservedTime': '11:00 - 12:00',
    'status': FilterStatus.Cancel
  },
];

class _ScheduleTabState extends State<ScheduleTab> {
  FilterStatus status = FilterStatus.Upcoming;
  Alignment _alignment = Alignment.centerLeft;
  String _datetime = DateTime.now().toString();
  String currentdate = '';
  @override
  void initState() {
    // TODO: implement initState
    currentdate = _datetime.substring(7, 9);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Map> filteredSchedules = schedules.where((var schedule) {
      return schedule['status'] == status;
    }).toList();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Schedule',
              textAlign: TextAlign.center,
              // style: kTitleStyle,
            ),
            SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 4, 102, 222),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (FilterStatus filterStatus in FilterStatus.values)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (filterStatus == FilterStatus.Upcoming) {
                                  status = FilterStatus.Upcoming;
                                  _alignment = Alignment.centerLeft;
                                } else if (filterStatus ==
                                    FilterStatus.Complete) {
                                  status = FilterStatus.Complete;
                                  _alignment = Alignment.center;
                                } else if (filterStatus ==
                                    FilterStatus.Cancel) {
                                  status = FilterStatus.Cancel;
                                  _alignment = Alignment.centerRight;
                                }
                              });
                            },
                            child: Center(
                              child: Text(
                                filterStatus.name,
                                //style: kFilterStyle,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                AnimatedAlign(
                  duration: Duration(milliseconds: 200),
                  alignment: _alignment,
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFC3CEDA),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        status.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection('appointment')
                      //.where('day', isGreaterThanOrEqualTo: '4')
                      .snapshots(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final snap = snapshot.data!.docs[index].data();
                          String docid = snap['docid'];
                          return DoctorAppointCard(
                            snap: snap,
                            docid: docid,
                          );
                        });
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class DateTimeCard extends StatelessWidget {
  final snap;
  const DateTimeCard({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFC3CEDA),
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.calendar_today,
                color: Color(0xFF332d2b),
                size: 15,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '${snap['month']} ${snap['day']}',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF332d2b),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.access_alarm,
                color: Color(0xFF332d2b),
                size: 17,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '${snap['time']}',
                style: TextStyle(
                  color: Color(0xFF332d2b),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
