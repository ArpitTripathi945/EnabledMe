import 'package:fishersc/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckSchemes extends StatefulWidget {
  const CheckSchemes({Key? key}) : super(key: key);

  @override
  State<CheckSchemes> createState() => _CheckSchemesState();
}

class _CheckSchemesState extends State<CheckSchemes> {
  List schemesList = [
    {
      'Scheme Name': 'Travelling Allowance for Attendant or Escort',
      'State / UTs Name': 'All State / UTs',
      'Disability Type': 'Blindness',
      'Disability Benefits Criteria': 'Special Benefit',
      'Type of Benefits': 'Allowances',
      'More Details': 'https://www.swavlambancard.gov.in/schemes/search'
    },
    {
      'Scheme Name': 'Chochlear Implant Surgery under ADIP',
      'State / UTs Name': 'All State / UTs',
      'Disability Type': 'Hearing Impairment',
      'Disability Benefits Criteria': '40% Disability',
      'Type of Benefits': 'Misc Benefits',
      'More Details': 'https://www.swavlambancard.gov.in/schemes/search'
    },
    {
      'Scheme Name': 'Age Relaxation for Motorized Tricycle ADIP Scheme',
      'State / UTs Name': 'Chhattisgarh',
      'Disability Type': 'Loco motor Disability',
      'Disability Benefits Criteria': '40% Disability',
      'Type of Benefits': 'Misc Benefits',
      'More Details': 'https://www.swavlambancard.gov.in/schemes/search'
    },
    {
      'Scheme Name': 'Niramaya',
      'State / UTs Name': 'Kerala',
      'Disability Type': 'Intellectual Disability',
      'Disability Benefits Criteria': '40% Disability',
      'Type of Benefits': 'Financial Assistance',
      'More Details': 'https://www.swavlambancard.gov.in/schemes/search'
    },
    {
      'Scheme Name': 'Nishashkt Vivah',
      'State / UTs Name': 'Madhya Pradesh',
      'Disability Type': 'Blindness',
      'Disability Benefits Criteria': '60% Disability',
      'Type of Benefits': 'Allowances',
      'More Details': 'https://www.swavlambancard.gov.in/schemes/search'
    },
    {
      'Scheme Name': 'Early Intervention Centres for Cerebral Palsy',
      'State / UTs Name': 'Tamil Nadu',
      'Disability Type': 'Cerebral Palsy',
      'Disability Benefits Criteria': 'Special Benefit',
      'Type of Benefits': 'Misc Benefits',
      'More Details': 'https://www.swavlambancard.gov.in/schemes/search'
    },
    {
      'Scheme Name': 'Training in Fitter trade for Hearing Impaired',
      'State / UTs Name': 'Tamil Nadu',
      'Disability Type': 'Hearing Impairment',
      'Disability Benefits Criteria': '40% Disability',
      'Type of Benefits': 'Trainings',
      'More Details': 'https://www.swavlambancard.gov.in/schemes/search'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF3E9),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
            child: Text("Schemes",
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
                itemCount: schemesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                    child: Center(
                      child: Container(
                        height: 310,
                        width: 360,
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
                              const SizedBox(
                                  height: 30,
                                  child: Image(
                                      image: AssetImage('assets/rgb.png'))),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(schemesList[index]['Scheme Name'],
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text('Benefits Criteria- ',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black)),
                                  Text(
                                      schemesList[index]
                                          ['Disability Benefits Criteria'],
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black54)),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Disability Type- ',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black)),
                                  Text(schemesList[index]['Disability Type'],
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black54)),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Type of Benefits- ',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black)),
                                  Text(schemesList[index]['Type of Benefits'],
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black54)),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('State / UTs Name- ',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black)),
                                  Text(schemesList[index]['State / UTs Name'],
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black54)),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                child: Center(
                                  child: SizedBox(
                                    height: 45,
                                    width: 360,
                                    child: ElevatedButton(
                                        onPressed: () async {
                                          Uri url = Uri.parse(schemesList[index]
                                              ['More Details']);
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
                                                      15.0)), // Background color
                                        ),
                                        child: Text(
                                          "More Details",
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
