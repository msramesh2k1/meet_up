import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:meetup/Helper/Colors.dart';
import 'package:meetup/Helper/helper.dart';
import 'package:meetup/Helper/userdetails.dart';
import 'package:meetup/Widgets/widgethelper.dart';
import 'package:meetup/interestselector.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: bgcolor, statusBarIconBrightness: Brightness.light));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  MeetUp.prefs = await SharedPreferences.getInstance();
  MeetUp.firestore = FirebaseFirestore.instance;
  runApp(MyApp());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
    
    MaterialApp(
          title: 'Meet - Up',
          theme: Theme.of(context).copyWith(
              textTheme: GoogleFonts.josefinSansTextTheme(),
              highlightColor: Colors.red,
              primaryColor: Colors.black,
              accentColor: Colors.black,
              buttonColor: Colors.grey,
             // appBarTheme: AppBarTheme(brightness: Brightness.light),
              appBarTheme: Theme.of(context)
                  .appBarTheme
                  .copyWith(brightness: Brightness.dark)
              ),
          debugShowCheckedModeBanner: false,
          home: SplashScreen());
  
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
                        height: 100,
          ),
          Column(
            children: [
              Center(child: WidgetHelper.text("Meet-Up", 40, Colors.white70)),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 0.3,
                color: Colors.white,
                width: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: WidgetHelper.text(
                      "Meet Your Matches Here ...", 16, Colors.white60)),
            ],
          ),
          Stack(children: [
            Container(
              height: 500,
              width: 500,
              child: Lottie.network(
                  //  "https://assets3.lottiefiles.com/packages/lf20_hiwnf0xp.json"
                  "https://assets3.lottiefiles.com/packages/lf20_PAugdq.json"),
            ),
          ]),
          Container(
            child: Column(
              children: [],
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(height: 50,),
                  // WidgetHelper.cont(
                  //     Center(child: WidgetHelper.text("Find Matches", 20,Colors.white)),
                  //     200,
                  //     20,
                  //     40,
                  //   kPrimaryColor.withOpacity(0.5)
                  //   ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (b) => interest()));
                    },
                    child: Container(
                      height: 43,
                      child: Center(
                          child: WidgetHelper.text(
                              "Find Matches", 20, Colors.white)),
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          gradient: LinearGradient(
                              colors: [kPrimaryColor, kbgPrimaryColor])),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
