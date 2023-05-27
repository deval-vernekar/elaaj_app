// import 'package:flutter/material.dart';

// class EmergencyPage extends StatefulWidget {
//   const EmergencyPage({super.key});

//   @override
//   State<EmergencyPage> createState() => _EmergencyPageState();
// }

// class _EmergencyPageState extends State<EmergencyPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('Emergency page'),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// void main() {
//   runApp(EmergencyPage());
// }

// class EmergencyPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Emergency Contact List',
//       home: EmergencyContactListPage(),
//     );
//   }
// }

// class EmergencyContactListPage extends StatelessWidget {
//   final List<Map<String, String>> hospitals = [
//     {
//       "name": "Hospital A",
//       "phone": "123-456-7890",
//     },
//     {
//       "name": "Hospital B",
//       "phone": "234-567-8901",
//     },
//     {
//       "name": "Hospital C",
//       "phone": "345-678-9012",
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Emergency Contact List'),
//       ),
//       body: ListView.builder(
//         itemCount: hospitals.length,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//             title: Text(hospitals[index]['name']!),
//             subtitle: Text(hospitals[index]['phone']!),
//             //onTap: () => launchUrl("tel://${hospitals[index]['phone']}"),
//           );
//         },
//       ),
//     );
//   }
// }

//------

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HospitalContact {
  final String name;
  final String phone;

  HospitalContact({required this.name, required this.phone});
}

class EmergencyContactsScreen extends StatefulWidget {
  @override
  _EmergencyContactsScreenState createState() =>
      _EmergencyContactsScreenState();
}

class _EmergencyContactsScreenState extends State<EmergencyContactsScreen> {
  late Stream<QuerySnapshot> _stream;

  @override
  void initState() {
    super.initState();
    _stream =
        FirebaseFirestore.instance.collection('HospitalPhone').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Hospital Contacts'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<HospitalContact> contacts = snapshot.data!.docs
              .map((doc) => HospitalContact(
                    name: doc['name'],
                    phone: doc['phone'],
                  ))
              .toList();

          return ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              HospitalContact contact = contacts[index];
              return ListTile(
                title: Text(contact.name),
                subtitle: Text(contact.phone),
                trailing: IconButton(
                  icon: Icon(Icons.call),
                  onPressed: () {
                    launch('tel:${contact.phone}');
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
