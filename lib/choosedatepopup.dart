import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fishersc/constants.dart';
import 'package:fishersc/welcomepwd.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseDatePopup extends StatefulWidget {
  const ChooseDatePopup({Key? key}) : super(key: key);

  @override
  State<ChooseDatePopup> createState() => _ChooseDatePopupState();
}

class _ChooseDatePopupState extends State<ChooseDatePopup> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  DateTime? pickedDate;

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    pickDate() async {
      DateTime? date = await showDatePicker(
        context: context,
        firstDate: DateTime(DateTime.now().year - 30),
        lastDate: DateTime(DateTime.now().year + 1),
        initialDate: pickedDate!,
      );
      if (date != null) {
        setState(() {
          pickedDate = date;
        });
      }
    }

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
                      Icon(Icons.verified_rounded,
                          size: 30, color: Colors.green),
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
              child: Text("Sort Agencies",
                  style: GoogleFonts.staatliches(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff714C38))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
              child: Text(
                  "List the agencies where in you want to book appointment.",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff714C38))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Center(
                child: Container(
                  height: 350,
                  width: 340,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.brown,
                        blurRadius: 5.0,
                        offset: Offset(0, 1), // shadow direction: bottom right
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Medeor Hospital',
                            style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        const SizedBox(
                          height: 20,
                        ),
                        Text("Choose date for appointment",
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff714C38))),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffFFF3E9),
                          ),
                          child: Center(
                            child: ListTile(
                              title: Text(
                                "${pickedDate!.day}  :  ${pickedDate!.month}  :  ${pickedDate!.year}",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.brown),
                              ),
                              trailing: const Icon(Icons.calendar_today,
                                  color: Color(0xff714C38)),
                              onTap: pickDate,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                          child: Center(
                            child: SizedBox(
                              height: 50,
                              width: 360,
                              child: ElevatedButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                        isScrollControlled: true,
                                        shape: const RoundedRectangleBorder(
                                          // <-- SEE HERE
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20.0),
                                          ),
                                        ),
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Wrap(
                                            children: [
                                              Column(
                                                children: [
                                                  SizedBox(
                                                    height: 380,
                                                    //color: Color(0xffFFF3E9),
                                                    child: GridView.count(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(20.0),
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        crossAxisCount: 3,
                                                        crossAxisSpacing: 10,
                                                        mainAxisSpacing: 10,
                                                        children: List.generate(
                                                            choices.length,
                                                            (index) {
                                                          return Center(
                                                            child: InkWell(
                                                                splashColor:
                                                                    Colors
                                                                        .orange,
                                                                onTap: () {},
                                                                child: SelectCard(
                                                                    choice: choices[
                                                                        index])),
                                                          );
                                                        })),
                                                  ),
                                                  SizedBox(
                                                    //color: Color(0xffFFFFFF),
                                                    height: 50,
                                                    width: 340,
                                                    child: ElevatedButton(
                                                        onPressed: () {
                                                          showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              shape:
                                                                  const RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .vertical(
                                                                  top: Radius
                                                                      .circular(
                                                                          20.0),
                                                                ),
                                                              ),
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return Wrap(
                                                                  children: [
                                                                    Center(
                                                                      child:
                                                                          Column(
                                                                        children: <
                                                                            Widget>[
                                                                          const SizedBox(
                                                                            height:
                                                                                230,
                                                                            width:
                                                                                230,
                                                                            child:
                                                                                Image(image: AssetImage('assets/Frame.png')),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                10,
                                                                          ),
                                                                          Text(
                                                                              'CONGRATULATIONS',
                                                                              style: GoogleFonts.staatliches(fontSize: 35, fontWeight: FontWeight.bold, color: const Color(0xff6E4F6A))),
                                                                          const SizedBox(
                                                                            height:
                                                                                10,
                                                                          ),
                                                                          Text(
                                                                              'Booking Id - #342567',
                                                                              style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500, color: const Color(0xffAB99A9))),
                                                                          Text(
                                                                              'Appointment Date - 04/04/2023',
                                                                              style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500, color: const Color(0xffAB99A9))),
                                                                          Text(
                                                                              'Appointment Time - 08:00 AM',
                                                                              style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500, color: const Color(0xffAB99A9))),
                                                                          Text(
                                                                              'Appointment Institution - Medeor Hospital',
                                                                              style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500, color: const Color(0xffAB99A9))),
                                                                          const SizedBox(
                                                                            height:
                                                                                20,
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                50,
                                                                            width:
                                                                                360,
                                                                            child: ElevatedButton(
                                                                                onPressed: () {
                                                                                  Navigator.push(
                                                                                    context,
                                                                                    MaterialPageRoute(builder: (context) => const WelcomePWD()),
                                                                                  );
                                                                                },
                                                                                style: ElevatedButton.styleFrom(
                                                                                  elevation: 5,
                                                                                  backgroundColor: const Color(0xffFDA758),
                                                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)), // Background color
                                                                                ),
                                                                                child: Text(
                                                                                  "Dashboard",
                                                                                  style: GoogleFonts.poppins(fontSize: 18, color: const Color(0xff6E4F6A), fontWeight: FontWeight.w500),
                                                                                )),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                15,
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                50,
                                                                            width:
                                                                                360,
                                                                            child: ElevatedButton(
                                                                                onPressed: () {
                                                                                  Navigator.push(
                                                                                    context,
                                                                                    MaterialPageRoute(builder: (context) => const ChooseDatePopup()),
                                                                                  );
                                                                                },
                                                                                style: ElevatedButton.styleFrom(
                                                                                  elevation: 5,
                                                                                  backgroundColor: const Color(0xffFFF3E9),
                                                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)), // Background color
                                                                                ),
                                                                                child: Text(
                                                                                  "Continue",
                                                                                  style: GoogleFonts.poppins(fontSize: 18, color: const Color(0xff6E4F6A), fontWeight: FontWeight.w500),
                                                                                )),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                20,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              });
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          elevation: 5,
                                                          backgroundColor:
                                                              const Color(
                                                                  0xffFDA758),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0)), // Background color
                                                        ),
                                                        child: Text(
                                                          "Book",
                                                          style: GoogleFonts.poppins(
                                                              fontSize: 22,
                                                              color: const Color(
                                                                  0xff714C38),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        )),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 5,
                                    backgroundColor: const Color(0xffFDA758),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0)), // Background color
                                  ),
                                  child: Text(
                                    "Choose Time",
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      color: const Color(0xff714C38),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Choice {
  const Choice({required this.title, required this.subtitle});

  final String title;
  final String subtitle;
}

const List<Choice> choices = <Choice>[
  Choice(title: '7:00 AM', subtitle: '4'),
  Choice(title: '7:30 AM', subtitle: '2'),
  Choice(title: '8:00 AM', subtitle: '1'),
  Choice(title: '8:30 AM', subtitle: '5'),
  Choice(title: '9:00 AM', subtitle: '2'),
  Choice(title: '9:30 AM', subtitle: '4'),
  Choice(title: '10:00 AM', subtitle: '1'),
  Choice(title: '10:30 AM', subtitle: '5'),
  Choice(title: '11:00 AM', subtitle: '3')
];

class SelectCard extends StatelessWidget {
  const SelectCard({super.key, required this.choice});

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: const Color(0xffFFF3E9),
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                Text(choice.title,
                    style: GoogleFonts.poppins(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
                const SizedBox(
                  height: 5,
                ),
                Text(choice.subtitle,
                    style: GoogleFonts.poppins(
                        color: const Color(0xff28B446),
                        fontWeight: FontWeight.bold,
                        fontSize: 35)),
              ]),
        ));
  }
}
