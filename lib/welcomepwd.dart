import 'package:disability/checkschemes.dart';
import 'package:disability/findagencies.dart';
import 'package:disability/sortagencies.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePWD extends StatefulWidget {
  const WelcomePWD({Key? key}) : super(key: key);

  @override
  State<WelcomePWD> createState() => _WelcomePWDState();
}

class _WelcomePWDState extends State<WelcomePWD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF3E9),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Material(
                elevation: 5,
                child: Container(
                  height: 70,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "EnabledMe",
                          style: GoogleFonts.staatliches(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff714C38)),
                        ),
                        IconButton(
                          icon: const Icon(Icons.account_box),
                          color: const Color(0xff714C38),
                          iconSize: 35,
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
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
                              fontSize: 22,
                              color: const Color(0xff714C38),
                              fontWeight: FontWeight.w500)),
                      Text("Your profile has been verified and",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: const Color(0xff714C38),
                              fontWeight: FontWeight.w500)),
                      Text("you are eligible for benefits.",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
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
                              fontSize: 34,
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
                                      fontSize: 15,
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
                                      fontSize: 15,
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
                                      fontSize: 15,
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
