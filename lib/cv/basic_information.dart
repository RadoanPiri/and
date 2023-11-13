// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watheq/Authentication/login_screen.dart';
import 'package:watheq/cv/widgets/required_field_widget.dart';
import 'package:watheq/database_connection/connection.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:watheq/offers_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:string_capitalize/string_capitalize.dart';
import 'package:watheq/Applications_Screen.dart';

import 'controller/form_controller.dart';

class BasicInformationScreen extends StatefulWidget {
  final isEdit;
  final GlobalKey<FormState> formKey;
  final VoidCallback onNext;

  BasicInformationScreen({super.key, required this.isEdit, required this.formKey, required this.onNext});
  State<BasicInformationScreen> createState() => _BasicInformationScreenState();
}

class _BasicInformationScreenState extends State<BasicInformationScreen> {
  List<Map<String, dynamic>> filteredCities = [];
  late List<DropdownMenuItem<Map<String, dynamic>>> cityDropdownItems =[];
  final FormController formController = Get.put(FormController());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCities().then((value) {
      setState(() {
        cityDropdownItems = List<DropdownMenuItem<Map<String, dynamic>>>.from(value.map((city) {
          return DropdownMenuItem<Map<String, dynamic>>(
            value: city,
            child: Text(city['CityName'].toString()),
          );
        }));
      });



    });
  }
  dynamic fetchCities() async {
    final response = await http.get(Uri.parse(Connection.getCities));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load cities');
    }
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    int selectedIndex = 0;
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController phoneNumberController = TextEditingController();
    final TextEditingController contactEmailController = TextEditingController();
    final TextEditingController summaryController = TextEditingController();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/PagesBackground.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 50),
            Row(
              children: [
                const SizedBox(width: 55),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 1),
                  child: Text(
                    "Basic Information",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: screenWidth * 0.07,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),

            Expanded(

              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 30,
                ),
                height: screenHeight * 0.86,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80.0),
                  ),
                ),
                child: Form(
                  key: widget.formKey,
                  child: Column(
                  children: [
                    RequiredFieldWidget(label: 'First Name',keyName: 'firstName',controller: firstNameController,),
                    RequiredFieldWidget(label: 'Last Name',keyName: 'lastName',controller: lastNameController,),
                    RequiredFieldWidget(label: 'Phone Number',keyName: 'phoneNumber',controller: phoneNumberController,),
                    RequiredFieldWidget(label: 'Contact Email',keyName: 'contactEmail',controller: contactEmailController,),

                    RequiredFieldWidget(label: 'Summary',keyName: 'summary',controller: summaryController,),
                    // Repeat for other fields
                    DropdownButtonFormField<Map<String, dynamic>>(
                      items: cityDropdownItems,
                      key: Key('city'),
                      onChanged: (Map<String, dynamic>? selectedCity) {
                        if (selectedCity != null) {
                          formController.updateFormData({'city': selectedCity['CityId']});
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'City',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF085399)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF085399)),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                      ),

                    ),

                    Spacer(),

                    // Next button aligned to the bottom right
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Directionality(
                        //   textDirection: TextDirection.ltr,
                        //   child: ElevatedButton.icon(
                        //     onPressed: () {
                        //       formKey.currentState!.save();
                        //       onNext();
                        //     },
                        //     style: ElevatedButton.styleFrom(
                        //       primary: Color(0xFFd4d4d4), // ##d4d4d4
                        //       padding:EdgeInsets.symmetric(horizontal: 50),
                        //
                        //     ),
                        //     icon: Icon(Icons.arrow_back), // Change the icon as needed
                        //     label: Text('Back'),
                        //
                        //   ),
                        // ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: ElevatedButton.icon(
                            onPressed: () {

                              widget.formKey.currentState!.save();
                              formController.updateFormData({ 'firstName': firstNameController.text });
                              formController.updateFormData({'lastName': lastNameController.text});
                              formController.updateFormData({'summary': summaryController.text});
                              formController.updateFormData({'phoneNumber': phoneNumberController.text});
                              formController.updateFormData({'contactEmail': contactEmailController.text});
                              print(formController.formData);
                              //widget.onNext();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF085399), // #085399
                              padding:EdgeInsets.symmetric(horizontal: 50),

                            ),
                            icon: Icon(Icons.arrow_back), // Change the icon as needed
                            label: Text('Next'),

                          ),
                        )
                    ]
                      ),

                  ],
                ),

                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}
