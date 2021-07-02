import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meetup/Helper/Colors.dart';
import 'package:meetup/Helper/helper.dart';
import 'package:meetup/MainScreen.dart';
import 'package:meetup/Pages/LoginScreen.dart';
import 'package:meetup/Providers/Authentication.dart';
import 'package:meetup/Widgets/widgethelper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
 SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
 statusBarColor: Colors.transparent,
 statusBarIconBrightness: Brightness.light));
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
 SystemChrome.setPreferredOrientations(
 [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
 MeetUp.prefs = await SharedPreferences.getInstance();
 MeetUp.firestore = FirebaseFirestore.instance;
 runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Authentication())],      
      child:
            MaterialApp(
            title: 'Meet - Up',
            theme: Theme.of(context).copyWith(
            textTheme: GoogleFonts.josefinSansTextTheme(),
            appBarTheme: Theme.of(context)
            .appBarTheme
            .copyWith(brightness: Brightness.dark)),
            debugShowCheckedModeBanner: false,
            home: MeetUp.prefs.getString("uid") == null
                ? SplashScreen()
                : MainScreen()),
      
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://images.pexels.com/photos/7130220/pexels-photo-7130220.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
              fit: BoxFit.cover,
              colorFilter:
                  ColorFilter.mode(Colors.black, BlendMode.colorDodge)),
          color: Colors.grey.shade300,
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 11,
                  ),
                  WidgetHelper.poppin("Find", 1, 35, Colors.white),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 100,
                    color: Colors.transparent,
                    child: WidgetHelper.poppin(
                        "Matches ,Better than Even Before ..",
                        1,
                        35,
                        Colors.white),
                    constraints: BoxConstraints(
                        maxHeight: 200,
                        maxWidth: MediaQuery.of(context).size.width - 45),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 12,
                  ),
                  Container(
                    height: 1,
                    width: 100,
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          WidgetHelper.logo("Meet - Up", 0, 32, Colors.white),
                        ],
                      ),
                Row
                (
                   children: [
                          SizedBox(
                            width: 6,
                          ),
                          WidgetHelper.poppin("Meet Your Matches Here", 0, 10, Colors.white),
                        ],
                    ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (b)=>LoginScreen()));
                      },
                      child: CircleAvatar(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: kPrimaryColor,
                        ),
                        radius: 40,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
