import 'package:fishersc/checkschemes.dart';
import 'package:fishersc/constants.dart';
import 'package:fishersc/findagencies.dart';
import 'package:fishersc/provider/auth_provider.dart';
import 'package:fishersc/screens/profile_screen.dart';
import 'package:fishersc/screens/welcome_screen.dart';
import 'package:fishersc/sortagencies.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WelcomePWD extends StatefulWidget {
  const WelcomePWD({Key? key}) : super(key: key);

  @override
  State<WelcomePWD> createState() => _WelcomePWDState();
}

class _WelcomePWDState extends State<WelcomePWD> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color(0xffFFF3E9),
      body: SingleChildScrollView(
        child: Column(
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
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ProfileScreen()));
                          },
                          child: Icon(Icons.account_circle_rounded,
                              size: 30, color: primary)),
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
              child: Text("Welcome User !",
                  style: GoogleFonts.staatliches(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff714C38))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(35, 10, 0, 0),
              child: Row(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Icon(
                      Icons.check_circle,
                      color: Color(0xff0AA06E),
                      size: 50,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Congratulations!",
                          style: GoogleFonts.poppins(
                              fontSize: 19,
                              color: const Color(0xff714C38),
                              fontWeight: FontWeight.w500)),
                      Text("Your profile has been verified and",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color(0xff714C38),
                              fontWeight: FontWeight.w500)),
                      Text("you are eligible for benefits.",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color(0xff714C38),
                              fontWeight: FontWeight.w500))
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
              child: Container(
                height: 583,
                width: 360,
                decoration: const BoxDecoration(
                  color: Color(0xffCC0000),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 4.0,
                      offset: Offset(0, 1),
                    )
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 30, 20, 0),
                      child: Text("Book Slots for Benefits!",
                          style: GoogleFonts.staatliches(
                              fontSize: 30,
                              color: const Color(0xffFFF3E9),
                              fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 20, 0),
                      child: Container(
                        height: 115,
                        width: 300,
                        decoration: const BoxDecoration(
                          color: Color(0xffFFF3E9),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              const Icon(Icons.info,
                                  color: Color(0xff714C38), size: 25),
                              Text("Find Nearest Implementing Agency",
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500)),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const FindAgencies()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 10,
                                    backgroundColor: const Color(0xff714C38),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            20.0)), // Background color
                                  ),
                                  child: Text(
                                    "Find Now!",
                                    style: GoogleFonts.poppins(),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 20, 0),
                      child: Container(
                        height: 115,
                        width: 300,
                        decoration: const BoxDecoration(
                          color: Color(0xffFFF3E9),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              const Icon(Icons.search,
                                  color: Color(0xff714C38), size: 25),
                              Text("Check out current available schemes",
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500)),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CheckSchemes()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 10,
                                    backgroundColor: const Color(0xff714C38),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            20.0)), // Background color
                                  ),
                                  child: Text(
                                    "Check Schemes",
                                    style: GoogleFonts.poppins(),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 20, 20, 0),
                      child: Container(
                        height: 115,
                        width: 300,
                        decoration: const BoxDecoration(
                          color: Color(0xffFFF3E9),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              const Icon(Icons.calendar_month,
                                  color: Color(0xff714C38), size: 20),
                              Text("Book Slots for Benefits",
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500)),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SortAgencies()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 10,
                                    backgroundColor: const Color(0xff714C38),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            20.0)), // Background color
                                  ),
                                  child: Text(
                                    "Book Now!",
                                    style: GoogleFonts.poppins(),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Image(image: AssetImage('assets/Group 10212.png'))
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Image(image: AssetImage('assets/mon.png')),
            )
          ],
        ),
      ),
    );
  }
}
