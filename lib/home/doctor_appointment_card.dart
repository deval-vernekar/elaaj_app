import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elaajapp/home/doc_history_screen.dart';
import 'package:elaajapp/home/payment_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DoctorAppointCard extends StatefulWidget {
  final snap;
  final String docid;
  const DoctorAppointCard({super.key, required this.docid, required this.snap});

  @override
  State<DoctorAppointCard> createState() => _DoctorAppointCardState();
}

class _DoctorAppointCardState extends State<DoctorAppointCard> {
  var docsnap;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  getdata() async {
    // docsnap = await FirebaseFirestore.instance
    //     .collection('Doctors')
    //     //.doc(widget.docid)
    //     .get();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.snap['docimage']),
                  //NetworkImage(''),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.snap['docname'],
                      style: TextStyle(
                        color: Color(0xFF332d2b),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.snap['docspec'],
                      style: TextStyle(
                        color: Color(0xFF332d2b),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            DateTimeCard(
              snap: widget.snap,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: OutlinedButton(
                    child: Text('Cancel',
                        style: TextStyle(
                          fontSize: 12,
                        )),
                    onPressed: () async {
                      await FirebaseFirestore.instance
                          .collection('users')
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .collection('appointment')
                          .doc(widget.snap['id'])
                          .delete();
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    child: Text('Reschedule',
                        style: TextStyle(
                          fontSize: 12,
                        )),
                    onPressed: () => {},
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: OutlinedButton(
                    child: Text('Pay',
                        style: TextStyle(
                          fontSize: 12,
                        )),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentPage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
