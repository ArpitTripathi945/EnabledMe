import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fishersc/view/choosedatepopup.dart';
import 'package:fishersc/view/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FindSortedAgencies extends StatefulWidget {
  const FindSortedAgencies({Key? key}) : super(key: key);

  @override
  State<FindSortedAgencies> createState() => _FindSortedAgenciesState();
}

class _FindSortedAgenciesState extends State<FindSortedAgencies> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var data;
  List hospitalData = [];

  @override
  void initState() {
    super.initState();

    firestore.collection('hospitals').doc('Delhi').get().then((value) {
      setState(() {
        data = value.data();
        hospitalData = data['hospital'];
      });
    }).catchError((onError) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF3E9),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Center(
            child: Container(
              height: 90,
              width: 360,
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Row(
                  children: [
                    Text(
                      "   EnabledMe",
                      style: TextStyle(
                          fontFamily: GoogleFonts.staatliches().fontFamily,
                          color: primary,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 160),
                    Icon(Icons.verified_rounded, size: 30, color: Colors.green),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
            child: Text("Find Agencies",
                style: GoogleFonts.staatliches(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff714C38))),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
            child: Text("Sort through the list of available benefits for you.",
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff714C38))),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: hospitalData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                    child: Center(
                      child: Container(
                        height: 295,
                        width: 340,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.brown,
                              blurRadius: 5.0,
                              offset: Offset(
                                  0, 1), // shadow direction: bottom right
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(25),
                          child: Column(
                            children: <Widget>[
                              const Icon(
                                Icons.local_hospital,
                                size: 30,
                                color: Color(0xffCC0000),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(hospitalData[index]['name'],
                                  style: GoogleFonts.poppins(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(hospitalData[index]['address'],
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54)),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                child: Center(
                                  child: SizedBox(
                                    height: 45,
                                    width: 360,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ChooseDatePopup()),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          elevation: 5,
                                          backgroundColor:
                                              const Color(0xffFDA758),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      15.0)), // Background color
                                        ),
                                        child: Text(
                                          "Book Slot",
                                          style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              color: const Color(0xff714C38),
                                              fontWeight: FontWeight.w500),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
