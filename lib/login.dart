import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meetup/Helper/Colors.dart';
import 'package:meetup/register.dart';
import 'ErrorAlert.dart';



import 'Helper/helper.dart';
import 'HomeScreen.dart';
import 'Widgets/widgethelper.dart';
import 'forgetpassword.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _password = true;
  final TextEditingController emailcontroller = new TextEditingController();
  final TextEditingController resetemailtexteditingcontroller =
      new TextEditingController();
  final TextEditingController passwordcontroller = new TextEditingController();

//  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _password = false;
  }

  @override
  Widget build(BuildContext context) {
    //  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor: Colors.black,
    //     statusBarIconBrightness: Brightness.dark));
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:smallscreen()
        
    
    );
  }

  Widget smallscreen() {
   return Container(
     color: bgcolor,
      // decoration: BoxDecoration(
      //     image: DecorationImage(
      //         image: new NetworkImage(
      //             "https://images.unsplash.com/photo-1449247709967-d4461a6a6103?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mzh8fHxlbnwwfHx8&w=1000&q=80"),
      //         fit: BoxFit.cover)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 75.0),
           
             
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
        
                SizedBox(
                  height: 6,
                ),
                Container(
                  height: 1,
                  color: Colors.white,
                  width: 80,
                ),
               
               
                Padding(
                  padding: const EdgeInsets.only(top:30.0,left: 20,right: 20),
                  child: Container(
                  decoration: BoxDecoration(
                  
                    borderRadius: BorderRadius.circular(10),color: Colors.teal[200].withOpacity(0.4)),
                      padding:
                          EdgeInsets.only(top: 40.0, left: 10.0, right: 10.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                             decoration: BoxDecoration(
                  
                    borderRadius: BorderRadius.circular(4),color: Colors.teal[50]),
                            child: Padding(
                              padding: const EdgeInsets.only(left:20.0),
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                cursorColor: Colors.white,
                                controller: emailcontroller,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  
                                    labelText: 'Email',
                                    // labelStyle: TextStyle(
                                    //     fontFamily: 'lato',
                                    //     fontWeight: FontWeight.bold,
                                    //     color: Colors.white),
                                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.transparent))),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Container(
                               decoration: BoxDecoration(
                  
                    borderRadius: BorderRadius.circular(4),color:Colors.teal[50]),
                          
                            child: Padding(
                              padding: const EdgeInsets.only(left:20.0),
                              child: TextField(
                                      style: TextStyle(color: Colors.white),
                                controller: passwordcontroller,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                          _password
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.white),
                                      onPressed: () {
                                        setState(() {
                                          _password = !_password;
                                        });
                                      },
                                    ),
                                  labelText: 'Password',
                                    // labelStyle: TextStyle(
                                    //     fontFamily: 'JosefinSans',
                                    //     fontWeight: FontWeight.bold,
                                    //     color: Colors.white),
                                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.transparent))
                                  ),
                                obscureText: !_password,
                                cursorColor: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 1.0),
                          Container(
                            alignment: Alignment(1.0, 0.0),
                            padding: EdgeInsets.only(top: 10.0, left: 20.0),
                            child: InkWell(
                              onTap: () {
                                Route route = MaterialPageRoute(
                                    builder: (context) => ForgotPassword());
                                Navigator.push(context, route);
                              },
                              child: Text(
                                "Forget password",
                                style: GoogleFonts.josefinSans(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      fontSize: 14,
                                      letterSpacing: 0),
                                ),
                              ),
                            ),
                          ),
                        SizedBox(height: 20.0),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                emailcontroller.text.isNotEmpty &&
                                        passwordcontroller.text.isNotEmpty
                                    ? _loginform()
                                    : showDialog(
                                        context: context,
                                        builder: (c) {
                                          return ErrorAlertDialog(
                                              message:
                                                  "Provide Email and Password");
                                        });
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 60.0, right: 60),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color:Colors.white,
                                      borderRadius: BorderRadius.circular(4)),
                                  height: 45,
                                  //  width:20,

                                  child: Center(
                                    child: Text(
                                      "LOGIN",
                                      style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 12,
                                            letterSpacing: 3),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      )),
                ),
                SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () {
                    Route route =
                        MaterialPageRoute(builder: (context) => Registerer());
                    Navigator.push(context, route);
                  },
                  child: Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "New User ? ",
                          style: GoogleFonts.josefinSans(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 16,
                                letterSpacing: 0),
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          "Register",
                          style: GoogleFonts.josefinSans(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                                ,
                                fontSize: 16,
                                letterSpacing: 0),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
Widget largescreen(){
 return Container(
     color: Colors.white,
      // decoration: BoxDecoration(
      //     image: DecorationImage(
      //         image: new NetworkImage(
      //             "https://images.unsplash.com/photo-1449247709967-d4461a6a6103?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mzh8fHxlbnwwfHx8&w=1000&q=80"),
      //         fit: BoxFit.cover)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 75.0),
           
             
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Mr & Mrs",
                  style: GoogleFonts.josefinSans(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 30,
                        letterSpacing: 0),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Design Wood Works",
                  style: GoogleFonts.josefinSans(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                        letterSpacing: 0),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 1,
                  color: Colors.white,
                  width: 80,
                ),
               
               
                Padding(
                  padding: const EdgeInsets.only(top:30.0,left: 100,right: 100),
                  child: Container(
                  decoration: BoxDecoration(
                  
                    borderRadius: BorderRadius.circular(10),color: Colors.white),
                      padding:
                          EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                             decoration: BoxDecoration(
                  
                    borderRadius: BorderRadius.circular(4),color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.only(left:20.0),
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                cursorColor: Colors.white,
                                controller: emailcontroller,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  
                                    labelText: 'EMAIL',
                                    labelStyle: TextStyle(
                                        fontFamily: 'lato',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white))),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Container(
                               decoration: BoxDecoration(
                  
                    borderRadius: BorderRadius.circular(4),color:Colors.white),
                          
                            child: Padding(
                              padding: const EdgeInsets.only(left:20.0),
                              child: TextField(
                                      style: TextStyle(color: Colors.white),
                                controller: passwordcontroller,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                          _password
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.white),
                                      onPressed: () {
                                        setState(() {
                                          _password = !_password;
                                        });
                                      },
                                    ),
                                    labelText: 'PASSWORD',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white))),
                                obscureText: !_password,
                                cursorColor: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 1.0),
                          Container(
                            alignment: Alignment(1.0, 0.0),
                            padding: EdgeInsets.only(top: 10.0, left: 20.0),
                            child: InkWell(
                              onTap: () {
                                Route route = MaterialPageRoute(
                                    builder: (context) => ForgotPassword());
                                Navigator.push(context, route);
                              },
                              child: Text(
                                "Forget password",
                                style: GoogleFonts.josefinSans(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black,
                                      fontSize: 14,
                                      letterSpacing: 0),
                                ),
                              ),
                            ),
                          ),
                        SizedBox(height: 20.0),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                emailcontroller.text.isNotEmpty &&
                                        passwordcontroller.text.isNotEmpty
                                    ? _loginform()
                                    : showDialog(
                                        context: context,
                                        builder: (c) {
                                          return ErrorAlertDialog(
                                              message:
                                                  "Provide Email and Password");
                                        });
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 60.0, right: 60),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color:Colors.white,
                                      borderRadius: BorderRadius.circular(4)),
                                  height: 45,
                                   width:120,

                                  child: Center(
                                    child: Text(
                                      "LOGIN",
                                      style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 12,
                                            letterSpacing: 3),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      )),
                ),
                SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () {
                    Route route =
                        MaterialPageRoute(builder: (context) => Registerer());
                    Navigator.push(context, route);
                  },
                  child: Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "New User ? ",
                          style: GoogleFonts.josefinSans(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                fontSize: 14,
                                letterSpacing: 1),
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          "Register",
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                fontSize: 12,
                                letterSpacing: 1),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

}
  Future<void> _loginform() async {
    User firebaseUser;
    await auth
        .signInWithEmailAndPassword(
            email: emailcontroller.text, password: passwordcontroller.text)
        .then((authUser) {
      print("hypo");
      // Fluttertoast.showToast(
      //   msg: 'Logged In  hee Successfully',
      //   toastLength: Toast.LENGTH_LONG,
      //   gravity: ToastGravity.BOTTOM,

      //   timeInSecForIos: 5,
      //   backgroundColor: Colors.black,
      //   textColor: Colors.white,
      //   // webPosition: "center"
      // );
      firebaseUser = authUser.user;
      print(firebaseUser.uid);
    }).catchError((error) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (c) {
            return ErrorAlertDialog(
              message: error.message.toString(),
            );
          });
    });
    if (firebaseUser != null) {
      readData(firebaseUser).then((s) {
        Navigator.pop(context);
        Route route = MaterialPageRoute(builder: (context) => HomeScreen());
        Navigator.pushReplacement(context, route);
      });
    }
  }

  readData(User fUser) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(fUser.uid)
        .get()
        .then((dataSnapshot) async {
      // MRANDMRS.firestore
      //     .collection("users")
      //     .doc(fUser.uid)
      //     .collection("CartItems")
      //     .get()
      //     .then((value) => value.docs.forEach((element) async {
      //           await MRANDMRS.sharedPreferences.setString(
      //               element.data()["title"],
      //               element.data()["Quantity"].toString());
      //           print(element.data()["title"]);

      //           print(element.data());
      //         }));
      await MeetUp.prefs.setString("uid", dataSnapshot.data()["uid"]);
      await MeetUp.prefs
          .setString("email", dataSnapshot.data()["email"]);
      await MeetUp.prefs.setString("name", dataSnapshot.data()["name"]);
    });
  }
}
