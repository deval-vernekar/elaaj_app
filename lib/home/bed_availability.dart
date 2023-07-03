import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../utility/dimensions.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  int _counter = 0;
  var collection = FirebaseFirestore.instance.collection("beds");
  late List<Map<String, dynamic>> items;
  bool isLoaded = false;
  _incrementCounter() async {
    late List<Map<String, dynamic>> tempList = [];
    var data = await collection.get();
    data.docs.forEach((element) {
      tempList.add(element.data());
    });
    setState(() {
      items = tempList;
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//       //////////////////////////////////////////
//       //body: SafeArea(
//       //   child: Column(
//       //     children: [
//       //       BigText(text: "Book"),
//       //       // Text
//       //       Container(
//       //         height: 70,
//       //         child: ListView.builder(
//       //           shrinkWrap: true,
//       //           scrollDirection: Axis.horizontal,
//       //           itemCount: 6,
//       //           itemBuilder: (context, index) {
//       //             return Column(
//       //               children: [
//       //                 Container(
//       //                   margin:
//       //                       EdgeInsets.symmetric(horizontal: 8, vertical: 5),
//       //                   padding:
//       //                       EdgeInsets.symmetric(vertical: 5, horizontal: 25),
//       //                   decoration: BoxDecoration(
//       //                     color: index == 1
//       //                         ? Color.fromARGB(255, 248, 247, 251)
//       //                         : Color(0xFFF2F8FFD),
//       //                     borderRadius:
//       //                         BorderRadius.circular(Dimensions.radius10),
//       //                     // BoxDecoration
//       //                     boxShadow: [
//       //                       BoxShadow(
//       //                         color: Color(0xFF8f837f),
//       //                         blurRadius: 4,
//       //                         spreadRadius: 2,
//       //                       ), // BoxShadow
//       //                     ],
//       //                   ),
//       //                   child: Column(
//       //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       //                     children: [
//       //                       Text(
//       //                         "${index + 8}",
//       //                         style: TextStyle(
//       //                           color: index == 1
//       //                               ? Color(0xff5a4fcf)
//       //                               : Color.fromARGB(255, 246, 250, 255)
//       //                                   .withOpacity(0.6),
//       //                         ),
//       //                       ),
//       //                       SizedBox(
//       //                         height: Dimensions.height10,
//       //                       ),
//       //                       Text(
//       //                         "MAR",
//       //                         style: TextStyle(
//       //                           color: index == 1
//       //                               ? Color(0xff5a4fcf)
//       //                               : Color.fromARGB(255, 246, 250, 255)
//       //                                   .withOpacity(0.6),
//       //                         ),
//       //                       ),
//       //                     ],
//       //                   ), // Column
//       //                 ),
//       //               ],
//       //             );
//       //           },
//       //         ),
//       //       ),
//       //     ],
//       //   ),
//       // ),

//       //////////////////////////////////////////////
      appBar: AppBar(
        backgroundColor: Color(0xff0466de),
        centerTitle: true,
        title: Text(
          "Available Beds",
        ),
      ),
      body: Center(
        child: isLoaded
            ? ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 2),
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20)),
                      leading: const CircleAvatar(
                        backgroundColor: Color(0xff0466de),
                        child: Icon(Icons.medical_information),
                      ),
                      title: Row(
                        children: [
                          Text(
                            items[index]["name"] ?? "Not given",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: Dimensions.width5,
                          ),
                          Text("Icu: "),
                          Text(
                            items[index]["icu_beds"].toString(),
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: Dimensions.width5),
                          Text("Gen: "),
                          Text(
                            items[index]["general_beds"].toString(),
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: Dimensions.width5),
                          Text("Oxy: "),
                          Text(
                            items[index]["oxygen_beds"].toString(),
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: Dimensions.width5),
                          Text("Pri: "),
                          Text(
                            items[index]["private_beds"].toString(),
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        items[index]["hloc"].toString(),
                      ),

                      // subtitle: Text("general:"),
                      // subtitle: Text("icu:"),
                      //trailing: Icon(Icons.more_vert),
                    ),
                  );
                })
            : Text("No data"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff0466de),
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
