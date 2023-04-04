import 'package:country_picker/country_picker.dart';
import 'package:fishersc/view/constants.dart';
import 'package:fishersc/view_model/auth_provider.dart';
import 'package:fishersc/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phoneController = TextEditingController();

  Country selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );

  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: phoneController.text.length,
      ),
    );
    return Scaffold(
      backgroundColor: bg,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Container(
              width: 225,
              height: 225,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                //color: Colors.purple.shade50,
              ),
              child: Image.asset(
                "assets/image1.png",
              ),
            ),
            Text(
              "Login",
              style: TextStyle(
                  fontFamily: GoogleFonts.staatliches().fontFamily,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: primary),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                children: [
                  const Text(
                    "Add your phone number. We'll send you a verification code",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black38,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    cursorColor: Colors.purple,
                    controller: phoneController,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    onChanged: (value) {
                      setState(() {
                        phoneController.text = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Enter phone number",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.grey.shade600,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black12),
                      ),
                      prefixIcon: Container(
                        padding: const EdgeInsets.fromLTRB(8, 13, 8, 8),
                        child: InkWell(
                          onTap: () {
                            showCountryPicker(
                                context: context,
                                countryListTheme: const CountryListThemeData(
                                  bottomSheetHeight: 550,
                                ),
                                onSelect: (value) {
                                  setState(() {
                                    selectedCountry = value;
                                  });
                                });
                          },
                          child: Text(
                            "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      suffixIcon: phoneController.text.length > 9 &&
                              phoneController.text.length < 11
                          ? Container(
                              height: 20,
                              width: 20,
                              margin: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                              child: const Icon(
                                Icons.done,
                                color: Colors.white,
                                size: 20,
                              ),
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: CustomButton(
                        text: "Login", onPressed: () => sendPhoneNumber()),
                  ),
                ],
              ),
            ),
            Image.asset(
              "assets/mon.png",
              height: 310,
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomCenter,
            ),
          ],
        ),
      ),
    );
  }

  void sendPhoneNumber() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneController.text.trim();
    ap.signInWithPhone(context, "+${selectedCountry.phoneCode}$phoneNumber");
  }

  String? validateMobile(String value) {
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }
}
