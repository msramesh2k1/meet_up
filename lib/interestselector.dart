import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meetup/Helper/Colors.dart';
import 'package:meetup/Helper/helper.dart';
import 'package:meetup/HomeScreen.dart';
import 'package:meetup/MainScreen.dart';
import 'package:meetup/Widgets/widgethelper.dart';
import 'package:meetup/onboardScreen.dart';
import 'package:meetup/subinterestselector.dart';

import 'HomeScreen2.dart';

class interest extends StatefulWidget {
  const interest({key}) : super(key: key);

  @override
  _interestState createState() => _interestState();
}

class _interestState extends State<interest> {
  List<String> userinterest = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(MeetUp.prefs.getStringList("interest"));
    print(userinterest);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16),
        backgroundColor: Colors.white,
        onPressed: () {
          FirebaseFirestore.instance
              .collection("users")
              .doc(MeetUp.prefs.getString("uid"))
              .update({"interest": userinterest});

          Navigator.push(
              context, MaterialPageRoute(builder: (b) => MainScreen()));
          MeetUp.prefs.setStringList("interest", userinterest);
        },
      ),
      backgroundColor: bgcolor,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://images.pexels.com/photos/3186010/pexels-photo-3186010.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.black, BlendMode.colorDodge)),
            color: Colors.grey.shade300,
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 25),
                  child: WidgetHelper.text(
                      "Choose Your Interest ...", 18, Colors.white),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 10),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 90,
                  child: Stack(
                    fit: StackFit.loose,
                    children: [
                      Positioned(
                        left: MediaQuery.of(context).size.width / 2.5,
                        top: MediaQuery.of(context).size.height / 4.5,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 45,
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  userinterest.contains("Anime")
                                      ? userinterest.remove("Anime")
                                      : userinterest.add("Anime");
                                });
                              },
                              child: CircleAvatar(
                                  radius: 60,
                                  child: WidgetHelper.text(
                                      "Anime", 20, Colors.white),
                                  backgroundColor:
                                      userinterest.contains("Anime")
                                          ? Colors.white54
                                          : Colors.transparent),
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 3)
                                //     gradient: RadialGradient(
                                //       focalRadius:50,
                                //       radius: 0.8,
                                //       colors: [
                                //  kPrimaryColor,      Colors.white, ]
                                //     ),
                                ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width / 2,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 40,
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  userinterest.contains("Books")
                                      ? userinterest.remove("Books")
                                      : userinterest.add("Books");
                                });
                              },
                              child: CircleAvatar(
                                  radius: 50,
                                  child: WidgetHelper.text(
                                      "Books", 20, Colors.white),
                                  backgroundColor:
                                      userinterest.contains("Books")
                                          ? Colors.white54
                                          : Colors.transparent),
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 3)
                                // gradient: RadialGradient(
                                //   colors: [
                                //     kPrimaryColor.withOpacity(0.6),kbgPrimaryColor.withOpacity(0.6)]
                                // ),
                                ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width / 1.4,
                        top: MediaQuery.of(context).size.height / 7.5,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 40,
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  userinterest.contains("Foods")
                                      ? userinterest.remove("Foods")
                                      : userinterest.add("Foods");
                                });
                              },
                              child: CircleAvatar(
                                  radius: 40,
                                  child: WidgetHelper.text(
                                      "Foods", 20, Colors.white),
                                  backgroundColor:
                                      userinterest.contains("Foods")
                                          ? Colors.white54
                                          : Colors.transparent),
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 3)
                                // gradient: RadialGradient(
                                //   colors: [
                                //     kPrimaryColor.withOpacity(0.6),kbgPrimaryColor.withOpacity(0.6)]
                                // ),
                                ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width / 1.7,
                        top: MediaQuery.of(context).size.height / 2.5,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 55,
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  userinterest.contains("Movies")
                                      ? userinterest.remove("Movies")
                                      : userinterest.add("Movies");
                                });
                              },
                              child: CircleAvatar(
                                  radius: 55,
                                  child: WidgetHelper.text(
                                      "Movies", 20, Colors.white),
                                  backgroundColor:
                                      userinterest.contains("Movies")
                                          ? Colors.white54
                                          : Colors.transparent),
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 3)
                                // gradient: RadialGradient(

                                //   colors: [

                                //     kPrimaryColor.withOpacity(0.6),kbgPrimaryColor.withOpacity(0.6)]
                                // ),
                                ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width / 9,
                        top: MediaQuery.of(context).size.height / 3.2,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 50,
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  userinterest.contains("Travel")
                                      ? userinterest.remove("Travel")
                                      : userinterest.add("Travel");
                                });
                              },
                              child: CircleAvatar(
                                  radius: 50,
                                  child: WidgetHelper.text(
                                      "Travel", 20, Colors.white),
                                  backgroundColor:
                                      userinterest.contains("Travel")
                                          ? Colors.white54
                                          : Colors.transparent),
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 3)
                                // gradient: RadialGradient(

                                //   colors: [
                                //     kPrimaryColor.withOpacity(0.6),kbgPrimaryColor.withOpacity(0.6)]
                                // ),
                                ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width / 4.5,
                        top: MediaQuery.of(context).size.height / 2,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 40,
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  userinterest.contains("Music")
                                      ? userinterest.remove("Music")
                                      : userinterest.add("Music");
                                });
                              },
                              child: CircleAvatar(
                                  radius: 100,
                                  child: WidgetHelper.text(
                                      "Music", 20, Colors.white),
                                  backgroundColor:
                                      userinterest.contains("Music")
                                          ? Colors.white54
                                          : Colors.transparent),
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 3)

                                // gradient: RadialGradient(

                                //   colors: [
                                //     kPrimaryColor.withOpacity(0.6),kbgPrimaryColor.withOpacity(0.6)]
                                // ),
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Positioned(
                          left: MediaQuery.of(context).size.width / 1.4,
                          top: MediaQuery.of(context).size.height / 3,
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.transparent,
                            child: Container(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    userinterest.contains("Sports")
                                        ? userinterest.remove("Sports")
                                        : userinterest.add("Sports");
                                  });
                                },
                                child: CircleAvatar(
                                    radius: 60,
                                    child: WidgetHelper.text(
                                        "Sports", 20, Colors.white),
                                    backgroundColor:
                                        userinterest.contains("Sports")
                                            ? Colors.white54
                                            : Colors.transparent),
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.white, width: 3)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
