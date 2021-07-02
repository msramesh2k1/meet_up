
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meetup/Helper/Colors.dart';
import 'package:meetup/Helper/helper.dart';
import 'package:meetup/Pages/Profile.dart';
import 'package:meetup/Widgets/widgethelper.dart';

import '../ErrorAlert.dart';
import '../MainScreen.dart';
import '../PhotoFrame.dart';
import '../forgetpassword.dart';
import 'LoginScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _password = true;
  final TextEditingController emailcontroller = new TextEditingController();
  final TextEditingController confirmcontroller =
      new TextEditingController();
  final TextEditingController passwordcontroller = new TextEditingController();
  var snackBar;
  String email = "";
  String password = "";
  String confirmpassword = "";
  var passsnackbar;


  @override
  void initState() {
    super.initState();
    _password = false;
  }

  @override
  Widget build(BuildContext context) {
     snackBar = SnackBar(
                                      content: WidgetHelper.subtext("Fill Details Completely",  14,Colors.black),
                                      backgroundColor: Colors.white,
                                      duration: Duration(seconds: 1),
                                      );
passsnackbar = SnackBar(
                                      content: WidgetHelper.subtext("Password Does Not Match",  14,Colors.black),
                                      backgroundColor: Colors.white,
                                      duration: Duration(seconds: 1),
                                      );
      
    return Scaffold(
      backgroundColor: bgcolor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://images.pexels.com/photos/4669637/pexels-photo-4669637.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
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
                  WidgetHelper.poppin("Register Account", 1, 35, Colors.white),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 14,
                  ),
                  Container(
                    height: 20,
                    color: Colors.transparent,
                    child: WidgetHelper.poppin(
                        "Create Into Your Account",
                        0,
                        13,
                        Colors.white),
                    constraints: BoxConstraints(
                        maxHeight: 200,
                        maxWidth: MediaQuery.of(context).size.width - 45),
                  ),
                ],
              ),
              SizedBox(height: 20,),
               Padding(
                 padding: const EdgeInsets.only(left:15,right: 15),
                 child: Container(
                               decoration: BoxDecoration(
                    
                      borderRadius: BorderRadius.circular(40),color: Colors.white38),
                              child: Padding(
                                padding: const EdgeInsets.only(left:20.0),
                                child: TextFormField(
                                  onChanged: (value){
                                    setState(() {
                                                                          email = value;
                                                                        });
                                  },
                                  style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
                                  cursorColor: Colors.white,
                                  controller: emailcontroller,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    
                                      hintText: 'Email',
                                      hintStyle: TextStyle(color: Colors.white),
                                      
                                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.transparent))),
                                ),
                              ),
                            ),
               ),
                          SizedBox(height: 20.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:15.0),
                            child: Container(
                                 decoration: BoxDecoration(
                  
                    borderRadius: BorderRadius.circular(40),color:Colors.white38),
                            
                              child: Padding(
                                padding: const EdgeInsets.only(left:20.0),
                                child: TextField(
                                  onChanged: (value){
                                    setState(() {
                                                                          
                                                                          password = value;
                                                                        });

                                  },
                                       style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
                                controller: passwordcontroller,
                                  decoration: InputDecoration(
                                    
                                   hintText: 'Password',
                                        hintStyle: TextStyle(color: Colors.white),
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
                          ), SizedBox(height: 20.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:15.0),
                            child: Container(
                                 decoration: BoxDecoration(
                  
                    borderRadius: BorderRadius.circular(40),color:Colors.white38),
                            
                              child: Padding(
                                padding: const EdgeInsets.only(left:20.0),
                                child: TextField(
                                  onChanged: (value){
                                    setState(() {
                                                                          
                                                                          confirmpassword = value;
                                                                        });

                                  },
                                        style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
                                 controller: confirmcontroller,
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
                                   hintText: 'Confim Password',
                                        hintStyle: TextStyle(color: Colors.white),
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
                          ),
                          SizedBox(height: 1.0),
                       
                        SizedBox(height: 20.0),
                          Center(
                            child: GestureDetector(
                              onTap: () {

                                if(email.isNotEmpty &&       password.isNotEmpty && confirmpassword.isNotEmpty
){
confirmcontroller.text.trim().toString() == passwordcontroller.text.trim().toString() ?
_Registerform():ScaffoldMessenger.of(context).showSnackBar(passsnackbar);
 
}else{
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
                                
                               
                             
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 60.0, right: 60),
                                child: Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [Colors.white,Colors.white38]),
                                      borderRadius: BorderRadius.circular(40)),
                                  height: 45,
                                  width: 150,

                                  child: Center(
                                    child: Text(
                                      "REGISTER",
                                      style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 17,
                                            letterSpacing: 0.5),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Center(child: GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                              Navigator.push(context, MaterialPageRoute(builder: (b)=>LoginScreen()));
                            },
                            child: WidgetHelper.poppin("Already an User , Login ..", 0, 12, Colors.white))),
                          SizedBox(
                            height: 50,
                          ),


             
              SizedBox(
                height: 3,
              ),
            ],
          ),
        ),
      ),
    );
  } Future<void> _Registerform() async {
    User firebaseUser;
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailcontroller.text, password: passwordcontroller.text)
        .then((auth) {
      firebaseUser = auth.user;
    }).catchError((error){
       setState(() {
          email = "";
          password = "";
          emailcontroller.clear();
          passwordcontroller.clear();
          confirmpassword = ""
          ;
          confirmcontroller.clear();
        });
         snackBar = SnackBar(
                                      content: WidgetHelper.subtext(error.toString(),  14,Colors.black),
                                      backgroundColor: Colors.white,
                                      duration: Duration(seconds: 1),
                                      );
                                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
     
   
    });
   
    if (firebaseUser != null) {
 
      FirebaseFirestore.instance.collection("users")
      .doc(firebaseUser.uid).set({
        "uid": firebaseUser.uid,
        "email": firebaseUser.email,
        "name": "",
        
        "interest":"",
        "area":"",
        "age":"",
        "image":"",
        "friends":
        "",
        "info":"",
        "gender":""
      });
      MeetUp.prefs.setString("uid", firebaseUser.uid);
      MeetUp.prefs.setString("email", firebaseUser.email)
    
      .then((value) {
      Navigator.pop(context);
      Route route = MaterialPageRoute(builder: (context) => profile());
      Navigator.pushReplacement(context, route);
      });
    }
  }

}
