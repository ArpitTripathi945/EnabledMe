import 'dart:io';

import 'package:fishersc/constants.dart';
import 'package:fishersc/model/user_model.dart';
import 'package:fishersc/provider/auth_provider.dart';
import 'package:fishersc/screens/profile_screen.dart';
import 'package:fishersc/utils/utils.dart';
import 'package:fishersc/widgets/custom_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserInfromationScreen extends StatefulWidget {
  const UserInfromationScreen({super.key});

  @override
  State<UserInfromationScreen> createState() => _UserInfromationScreenState();
}

class _UserInfromationScreenState extends State<UserInfromationScreen> {
  File? image;
  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final aadharController = TextEditingController();
  final disabilityController = TextEditingController();
  final addressController = TextEditingController();
  final pincodeController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    dobController.dispose();
    aadharController.dispose();
    disabilityController.dispose();
    addressController.dispose();
    pincodeController.dispose();
  }

  // for selecting image
  void selectImage() async {
    image = await pickImage(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      backgroundColor: bg,
      body: isLoading == true
          ? Center(
              child: Image.asset(
                "assets/success.png",
                fit: BoxFit.fill,
                alignment: Alignment.center,
              ),
            )
          : SafeArea(
              child: SingleChildScrollView(
                // padding: const EdgeInsets.only(top: 30.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                      child: Row(
                        children: [
                          Text(
                            "Complete your \nprofile!",
                            style: TextStyle(
                              fontFamily: GoogleFonts.staatliches().fontFamily,
                              color: primary,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                            child: InkWell(
                              onTap: () => selectImage(),
                              child: image == null
                                  ? CircleAvatar(
                                      backgroundColor: primary,
                                      radius: 60,
                                      child: CircleAvatar(
                                        backgroundColor: primary,
                                        radius: 55,
                                        child: Icon(
                                          Icons.account_circle,
                                          size: 95,
                                          color: bg,
                                        ),
                                      ),
                                    )
                                  : CircleAvatar(
                                      backgroundColor: tertiary,
                                      radius: 60,
                                      child: CircleAvatar(
                                        backgroundImage: FileImage(image!),
                                        radius: 55,
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "    Enter your details!",
                        style: TextStyle(
                          color: primary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 15),
                      margin: const EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          // name field
                          textFeld(
                            hintText: "As per documents",
                            labelText: "Fullname",
                            inputType: TextInputType.name,
                            maxLines: 1,
                            controller: nameController,
                          ),
                          // dob field
                          textFeld(
                            hintText: "As per documents",
                            labelText: "Date of Birth",
                            inputType: TextInputType.number,
                            maxLines: 1,
                            controller: dobController,
                          ),
                          // aadhar field
                          textFeld(
                            hintText: "Enter your Aadhar Number",
                            labelText: "Aadhar No.",
                            inputType: TextInputType.number,
                            maxLines: 1,
                            controller: aadharController,
                          ),
                          // disability field
                          textFeld(
                            hintText: "Enter your Disability Certificate Id",
                            labelText: "Disability Certificate Id",
                            inputType: TextInputType.name,
                            maxLines: 1,
                            controller: disabilityController,
                          ),
                          // address field
                          textFeld(
                            hintText: "As per documents",
                            labelText: "Address",
                            inputType: TextInputType.name,
                            maxLines: 1,
                            controller: addressController,
                          ),
                          // pincode
                          textFeld(
                            hintText: "As per documents",
                            labelText: "Pincode",
                            inputType: TextInputType.number,
                            maxLines: 1,
                            controller: pincodeController,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: CustomButton(
                        text: "Continue",
                        onPressed: () => storeData(),
                      ),
                    ),
                    Image.asset(
                      "assets/mon.png",
                      height: 190,
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.bottomCenter,
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget textFeld({
    required String hintText,
    required String labelText,
    required TextInputType inputType,
    required int maxLines,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: SizedBox(
        height: 50,
        width: 340,
        child: TextFormField(
          cursorColor: textbutton,
          controller: controller,
          keyboardType: inputType,
          maxLines: maxLines,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: textbutton),
                borderRadius: BorderRadius.circular(10.0),
              ),
              labelText: labelText,
              labelStyle: TextStyle(
                  color: textbutton, fontSize: 15, fontWeight: FontWeight.w500),
              hintText: hintText,
              hintStyle: TextStyle(
                color: textbutton,
                fontSize: 12,
              )),
        ),
      ),
    );
  }

  // store user data to database
  void storeData() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel(
        name: nameController.text.trim(),
        dob: dobController.text.trim(),
        aadhar: aadharController.text.trim(),
        disability: disabilityController.text.trim(),
        address: addressController.text.trim(),
        pincode: pincodeController.text.trim(),
        profilePic: "",
        createdAt: "",
        phoneNumber: "",
        uid: "",
        status: "Verified");
    if (image != null) {
      ap.saveUserDataToFirebase(
        context: context,
        userModel: userModel,
        profilePic: image!,
        onSuccess: () {
          ap.saveUserDataToSP().then(
                (value) => ap.setSignIn().then(
                      (value) => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                          (route) => false),
                    ),
              );
        },
      );
    } else {
      showSnackBar(context, "Please upload your profile photo");
    }
  }
}
