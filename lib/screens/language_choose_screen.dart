import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:s2w/screens/dashboard/fluid_nav_bar.dart';
import 'package:s2w/theme/color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/language_model.dart';
class LanguageChooseScreen extends StatefulWidget {
  bool isContainer = false;

  LanguageChooseScreen({Key? key, required this.isContainer}) : super(key: key);

  @override
  State<LanguageChooseScreen> createState() => _LanguageChooceScreenState();
}

class _LanguageChooceScreenState extends State<LanguageChooseScreen> {
  var languageList = <Data>[];
  String selectedLanguage = "en";

  @override
  void initState() {
    loadData();
    super.initState();
  }

  void loadData() async {
    languageList.clear();
       final response = await rootBundle.loadString("assets/translations/language.json");
     final decodeData = jsonDecode(response);
     var productData = decodeData["data"];
    setState(() {
      languageList = List.from(productData).map<Data>((item) => Data.fromJson(item)).toList();
    });
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (sp.containsKey("languageCode")) {
      selectedLanguage = sp.getString("languageCode")!;
    }
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        appBar: AppBar(
          title: Text('Change Language'),
          centerTitle: true,
          backgroundColor: primary,
        ),
        backgroundColor:  Color(0xffFFFFFF),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              ListView.builder(
                itemCount: languageList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedLanguage = languageList[index].languageCode.toString();
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        decoration: languageList[index].languageCode == selectedLanguage
                            ? BoxDecoration(
                                border: Border.all(color: primary),
                                borderRadius: const BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                                    ),
                              )
                            : null,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10,top: 5,bottom: 5, right: 10),
                                child: Text(languageList[index].language.toString(), style: const TextStyle(fontSize: 16)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: primary,
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(
                  color:primary,
                ),
              ),
            ),
            onPressed: () async {
              if (selectedLanguage == "en") {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString("languageCode", selectedLanguage);
                context.setLocale(Locale(selectedLanguage));
              } else if (selectedLanguage == "ar") {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString("languageCode", selectedLanguage);
                context.setLocale(Locale(selectedLanguage));
              }else if (selectedLanguage == "hi") {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString("languageCode", selectedLanguage);
                context.setLocale(Locale(selectedLanguage));
              }else if (selectedLanguage == "bn") {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString("languageCode", selectedLanguage);
                context.setLocale(Locale(selectedLanguage));
              }else if (selectedLanguage == "kn") {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString("languageCode", selectedLanguage);
                context.setLocale(Locale(selectedLanguage));
              }else if (selectedLanguage == "ta") {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString("languageCode", selectedLanguage);
                context.setLocale(Locale(selectedLanguage));
              }else if (selectedLanguage == "te") {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString("languageCode", selectedLanguage);
                context.setLocale(Locale(selectedLanguage));
              }else if (selectedLanguage == "mr") {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString("languageCode", selectedLanguage);
                context.setLocale(Locale(selectedLanguage));
              }else if (selectedLanguage == "pa") {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString("languageCode", selectedLanguage);
                context.setLocale(Locale(selectedLanguage));
              }else {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString("languageCode", "en");
                context.setLocale(Locale("en"));
              }

              if (widget.isContainer) {
                SnackBar snack = SnackBar(
                  content: const Text(
                    'Language change successfully',
                    style: TextStyle(color: Colors.white),
                  ).tr(),
                  duration: const Duration(seconds: 2),
                  backgroundColor: Colors.black,
                );
                ScaffoldMessenger.of(context).showSnackBar(snack);
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoardScreen()));

              }
            },
            child: Text(
              'Save'.tr(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
