import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fishersc/view/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class FindHospitals extends StatefulWidget {
  const FindHospitals({Key? key, required this.disability, required this.state})
      : super(key: key);

  final String disability;
  final String state;

  @override
  State<FindHospitals> createState() => _FindHospitalsState();
}

class _FindHospitalsState extends State<FindHospitals> {
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

  String? downloadImage;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<String> downloadURL(String path) async {
    return downloadImage =
        await storage.ref('hospitals/$path.jpg').getDownloadURL();
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
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                      child: Container(
                        height: 410,
                        width: 330,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.brown,
                              blurRadius: 5.0,
                              offset: Offset(
                                  0, 1), // shadow direction: bottom right
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(25),
                          child: Column(
                            children: <Widget>[
                              Text(hospitalData[index]['name'],
                                  style: GoogleFonts.poppins(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                  padding: const EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 1.5,
                                    ),
                                  ),
                                  height: 230,
                                  width: 230,
                                  child: FutureBuilder<String>(
                                    future: downloadURL(
                                        '${hospitalData[index]['name']}'),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<String> snapshot) {
                                      if (snapshot.hasData) {
                                        return ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                                '${snapshot.data}'));
                                      } else if (snapshot.hasError) {
                                        return const CircularProgressIndicator();
                                      } else {
                                        return const CircularProgressIndicator();
                                      }
                                    },
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 25, 0, 0),
                                child: Row(
                                  children: <Widget>[
                                    Center(
                                      child: SizedBox(
                                        height: 45,
                                        width: 150,
                                        child: ElevatedButton(
                                            onPressed: () async {
                                              Uri url = Uri.parse(
                                                  hospitalData[index]['map']);
                                              if (await launchUrl(url)) {
                                                await canLaunchUrl(url);
                                              } else {
                                                throw 'Could not launch $url';
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              elevation: 5,
                                              backgroundColor:
                                                  const Color(0xffFDA758),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)), // Background color
                                            ),
                                            child: Text(
                                              "Locate",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 22,
                                                  color:
                                                      const Color(0xff714C38),
                                                  fontWeight: FontWeight.w500),
                                            )),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.email),
                                      color: const Color(0xff714C38),
                                      iconSize: 30,
                                      onPressed: () async {
                                        final Uri emailLaunchUri = Uri(
                                          scheme: 'mailto',
                                          path: hospitalData[index]['email'],
                                        );
                                        if (await launchUrl(emailLaunchUri)) {
                                          await canLaunchUrl(emailLaunchUri);
                                        } else {
                                          throw 'Could not launch $emailLaunchUri';
                                        }
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.call),
                                      color: const Color(0xff714C38),
                                      iconSize: 30,
                                      onPressed: () async {
                                        final call =
                                            Uri.parse('tel:+91 1141222222');
                                        if (await canLaunchUrl(call)) {
                                          launchUrl(call);
                                        } else {
                                          throw 'Could not launch $call';
                                        }
                                      },
                                    )
                                  ],
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
