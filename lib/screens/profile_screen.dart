import 'package:fishersc/constants.dart';
import 'package:fishersc/provider/auth_provider.dart';
import 'package:fishersc/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: bg,
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
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
                  SizedBox(width: 120),
                  Icon(Icons.account_circle_rounded, size: 30, color: primary),
                  SizedBox(width: 5),
                  InkWell(
                      onTap: () {
                        ap.userSignOut().then(
                              (value) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const WelcomeScreen(),
                                ),
                              ),
                            );
                      },
                      child: Icon(Icons.exit_to_app, size: 30, color: primary)),
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: EdgeInsets.all(10),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          CircleAvatar(
            radius: 55,
            backgroundColor: tertiary,
            child: CircleAvatar(
              backgroundColor: secondary,
              backgroundImage: NetworkImage(ap.userModel.profilePic),
              radius: 50,
            ),
          ),
          SizedBox(height: 15),
          Text(
            ap.userModel.name,
            style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.bold,
                color: primary,
                fontSize: 24),
          ),
          Text(
            "UDID:  " + ap.userModel.uid.substring(0, 11),
            style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: primary,
                fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 5.0,
              shadowColor: textbutton,
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Aadhar No:",
                            style: TextStyle(
                                color: secondary,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 14)),
                        Text(ap.userModel.aadhar,
                            style: TextStyle(
                                color: secondary,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 14)),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      indent: 40,
                      endIndent: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Disability Certificate id:",
                            style: TextStyle(
                                color: secondary,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 14)),
                        Text(ap.userModel.disability,
                            style: TextStyle(
                                color: secondary,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 14)),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      indent: 40,
                      endIndent: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Address:",
                            style: TextStyle(
                                color: secondary,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 14)),
                        Text(ap.userModel.address,
                            style: TextStyle(
                                color: secondary,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 14)),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      indent: 40,
                      endIndent: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Pincode:",
                            style: TextStyle(
                                color: secondary,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 14)),
                        Text(ap.userModel.pincode,
                            style: TextStyle(
                                color: secondary,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 14)),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      indent: 40,
                      endIndent: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Date of birth:",
                            style: TextStyle(
                                color: secondary,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 14)),
                        Text(ap.userModel.dob,
                            style: TextStyle(
                                color: secondary,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 14)),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      indent: 40,
                      endIndent: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("PhoneNumber:",
                            style: TextStyle(
                                color: secondary,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 14)),
                        Text(ap.userModel.phoneNumber,
                            style: TextStyle(
                                color: secondary,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 14)),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      indent: 40,
                      endIndent: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Status of verification:",
                            style: TextStyle(
                                color: secondary,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 14)),
                        Container(
                          decoration: BoxDecoration(
                            color: tertiary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: 25,
                          width: 77,
                          child: Center(
                            child: Text(ap.userModel.status,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    fontSize: 14)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Image.asset(
            "assets/mon.png",
            height: 190,
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ),
        ],
      )),
    );
  }
}
