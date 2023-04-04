import 'package:fishersc/view/constants.dart';
import 'package:fishersc/view/findhospitals.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FindAgencies extends StatefulWidget {
  const FindAgencies({Key? key}) : super(key: key);

  @override
  State<FindAgencies> createState() => _FindAgenciesState();
}

class _FindAgenciesState extends State<FindAgencies> {
  bool allSelected = false;

  String? dropdownvalue1;
  String? dropdownvalue2;

  var disabilities = [
    "Blindness",
    "Low-vision",
    "Leprosy Cured Persons",
    "Hearing Impairment",
    "Loco motor Disability",
    "Dwarfism",
    "Intellectual Disability",
    "Mental Illness",
    "Autism Spectrum Disorder",
    "Cerebral Palsy",
    "Muscular Dystrophy",
    "Chronic Neurological Conditions",
    "Specific Learning Disabilities",
    "Multiple Sclerosis",
    "Speech and Language Disability",
    "Thalassemia",
    "Hemophilia",
    "Sickle Cell Disease",
    "Multiple Disabilities",
    "Acid Attack Victims",
    "Parkinson’s disease"
  ];
  var states = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Delhi",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "West Bengal",
    "Andaman and Nicobar",
    "Chandigarh",
    "Dadra and Nagar Haveli and Daman and Diu",
    "Jammu and Kashmir",
    "Ladakh",
    "Lakshadweep",
    "Puducherry"
  ];

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
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 15, 0, 0),
            child: Row(
              children: [
                const Icon(Icons.view_list, color: Color(0xff714C38), size: 25),
                const SizedBox(width: 8),
                Text("Choose Disability",
                    style: GoogleFonts.staatliches(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff714C38))),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 40,
                    width: 320,
                    child: DropdownButton(
                        isExpanded: true,
                        value: dropdownvalue1,
                        hint: Text(
                          "Choose Disability",
                          style: GoogleFonts.poppins(),
                        ),
                        underline: Container(),
                        icon: const Icon(Icons.keyboard_arrow_down,
                            color: Color(0xff714C38), size: 20),
                        items: disabilities.map((String disabilities) {
                          return DropdownMenuItem(
                            value: disabilities,
                            child: Text(disabilities,
                                style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    color: const Color(0xff714C38))),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          // allSelected = true;
                          setState(() {
                            dropdownvalue1 = newValue!;
                          });
                        }),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 15, 0, 0),
            child: Row(
              children: [
                const Icon(Icons.home, color: Color(0xff714C38), size: 25),
                const SizedBox(width: 8),
                Text("Choose State/UT",
                    style: GoogleFonts.staatliches(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff714C38))),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 40,
                    width: 320,
                    child: DropdownButton(
                        isExpanded: true,
                        value: dropdownvalue2,
                        hint: Text(
                          "Choose State/UT",
                          style: GoogleFonts.poppins(),
                        ),
                        underline: Container(),
                        icon: const Icon(Icons.keyboard_arrow_down,
                            color: Color(0xff714C38), size: 20),
                        items: states.map((String states) {
                          return DropdownMenuItem(
                            value: states,
                            child: Text(states,
                                style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    color: const Color(0xff714C38))),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          allSelected = true;
                          setState(() {
                            dropdownvalue2 = newValue!;
                          });
                        }),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: Center(
              child: SizedBox(
                height: 50,
                width: 340,
                child: AbsorbPointer(
                  absorbing: !allSelected,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FindHospitals(
                                    disability: dropdownvalue1!,
                                    state: dropdownvalue2!,
                                  )),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        backgroundColor: (allSelected)
                            ? const Color(0xff714C38)
                            : Colors.grey[400],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                20.0)), // Background color
                      ),
                      child: Text(
                        "Next",
                        style: GoogleFonts.poppins(fontSize: 20),
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
