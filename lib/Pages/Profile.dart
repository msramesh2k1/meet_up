
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io'as io;
import 'package:path/path.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meetup/Helper/Colors.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meetup/Helper/helper.dart';
import 'package:meetup/Pages/RegisterPage.dart';
import 'package:meetup/Widgets/widgethelper.dart';
import '../MainScreen.dart';
import '../forgetpassword.dart';
import '../interestselector.dart';


class profile extends StatefulWidget {
  const profile({key}) : super(key: key);

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  FirebaseAuth auth = FirebaseAuth.instance;
  PageController controller = PageController();

  bool _password = true;
  final TextEditingController namecontroller = new TextEditingController();
  final TextEditingController dobcontroller =
      new TextEditingController();
  final TextEditingController areacontroller = new TextEditingController();
  var snackBar;
  String name = "";
  String age = "";
  String dob = "";
  String gender = "";
  String area = "";
  List<io.File> imgs = [];

  io.File img;
  io.File img1;
  io.File img2;
  io.File img3;
  io.File img4;
  io.File img5;
  io.File img6;



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

    return Scaffold(
      backgroundColor: bgcolor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://images.pexels.com/photos/4021521/pexels-photo-4021521.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260"),
              fit: BoxFit.cover,
              colorFilter:
                  ColorFilter.mode(Colors.black, BlendMode.colorDodge)),
          color: Colors.grey.shade300,
        ),

        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 55,),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  WidgetHelper.poppin("Hello User ,", 1, 35, Colors.white),
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
                        "Create Profile",
                        0,
                        13,
                        Colors.white),
                    constraints: BoxConstraints(
                        maxHeight: 200,
                        maxWidth: MediaQuery.of(context).size.width - 45),
                  ),
                ],
              ),
              SizedBox(height:5,),
               Flexible(
                 child: Container(
                   height: MediaQuery.of(context).size.height-200,
                   child: PageView(
                     controller: controller,
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Container(   
                           child:  Padding(
                 padding: const EdgeInsets.only(left:15,right: 15),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(height: 50,),
                     Row(
                       children: [
                         SizedBox(width: 10,),
                         WidgetHelper.poppin("Enter Name : ",1, 18, Colors.white),
                       ],
                     ),
                     SizedBox(height: 10,),
                     Container(
                                   decoration: BoxDecoration(
                        
                          borderRadius: BorderRadius.circular(40),color: Colors.white38),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:20.0),
                                    child: TextFormField(
                                      onChanged: (value){
                                        setState(() {
                                                                              name = value;
                                                                            });
                                      },
                                      style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
                                      cursorColor: Colors.white,
                                      controller: namecontroller,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        
                                          hintText: 'Full Name',
                                          hintStyle: TextStyle(color: Colors.white),
                                          
                                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: Colors.transparent))),
                                    ),
                                  ),
                                ),
                   ],
                 ),
               ),                
                           decoration: BoxDecoration(
                                      //  color: Colors.white10,
                             borderRadius: BorderRadius.circular(10)
                           ),
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Container(   
                           child:  Padding(
                 padding: const EdgeInsets.only(left:15,right: 15),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(height: 50,),
                     Row(
                       children: [
                         SizedBox(width: 10,),
                         WidgetHelper.poppin("Enter DOB : ",1, 18, Colors.white),
                       ],
                     ),
                     SizedBox(height: 10,),
                     Container(
                                   decoration: BoxDecoration(
                        
                          borderRadius: BorderRadius.circular(40),color: Colors.white38),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:20.0),
                                    child: TextFormField(
                                      onChanged: (value){
                                        setState(() {
                                                                              dob = value;
                                                                            });
                                      },
                                      style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
                                      cursorColor: Colors.white,
                                      controller: dobcontroller,
                                      keyboardType: TextInputType.datetime,
                                      decoration: InputDecoration(
                                        
                                          hintText: 'DD / MM / YYYY',
                                          hintStyle: TextStyle(color: Colors.white),
                                          
                                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: Colors.transparent))),
                                    ),
                                  ),
                                ),SizedBox(height: 20,),
                                 Row(
                       children: [
                         SizedBox(width: 10,),
                         WidgetHelper.poppin("Enter City : ",1, 18, Colors.white),
                       ],
                     ),
                     SizedBox(height: 10,),
                     Container(
                                   decoration: BoxDecoration(
                        
                          borderRadius: BorderRadius.circular(40),color: Colors.white38),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:20.0),
                                    child: TextFormField(
                                      onChanged: (value){
                                        setState(() {
                                                                              area = value;
                                                                            });
                                      },
                                      style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
                                      cursorColor: Colors.white,
                                      controller: areacontroller,
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                        
                                          hintText: 'Chennai ',
                                          hintStyle: TextStyle(color: Colors.white),
                                          
                                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: Colors.transparent))),
                                    ),
                                  ),
                                ),
                   ],
                 ),
               ),                
                           decoration: BoxDecoration(
                                      //  color: Colors.white10,
                             borderRadius: BorderRadius.circular(10)
                           ),
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Container(   
                           child:  Padding(
                 padding: const EdgeInsets.only(left:15,right: 15),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(height: 50,),
                     Row(
                       children: [
                         SizedBox(width: 10,),
                         WidgetHelper.poppin("I am a ",1, 18, Colors.white),
                       ],
                     ),
                     SizedBox(height: 20,),
                     GestureDetector(
                       onTap: (){
                         setState(() {
                                                    
                                                    gender = "Man";
                                                  });
                       },
                       child: Container(
                         height: 50,
                         child: Center(child: WidgetHelper.poppin("Man", 1, 15, Colors.white)),

                                     decoration: BoxDecoration(
                          
                            borderRadius: BorderRadius.circular(40),color: gender == "Man" ?
                          Colors.white70 : Colors.white38),
                                    
                                  ),
                     ),
                                SizedBox(height: 20),
                                GestureDetector(
                                    onTap: (){
                         setState(() {
                                                    
                                                    gender = "Woman";
                                                  });
                       },
                                   child: Container(
                       height: 50,
                       child: Center(child: WidgetHelper.poppin("Woman", 1, 15, Colors.white)),

                                     decoration: BoxDecoration(
                        
                          borderRadius: BorderRadius.circular(40),color: gender == "Woman" ?
                          Colors.white70 : Colors.white38),
                                    
                                ),
                                 ),
                                SizedBox(height: 20,),
                                 GestureDetector(
                                     onTap: (){
                         setState(() {
                                                    
                                                    gender = "Other";
                                                  });
                       },
                                   child: Container(
                       height: 50,
                       child: Center(child: WidgetHelper.poppin("Other", 1, 15, Colors.white)),

                                     decoration: BoxDecoration(
                        
                          borderRadius: BorderRadius.circular(40),color: gender == "Other" ?
                          Colors.white70 : Colors.white38),
                                    
                                ),
                                 ),
                   ],
                 ),
               ),                
                           decoration: BoxDecoration(
                                      //  color: Colors.white10,
                             borderRadius: BorderRadius.circular(10)
                           ),
                         ),
                       ),

Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Container(   
                           child:  Padding(
                 padding: const EdgeInsets.only(left:15,right: 15),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(height: 50,),
                     Row(
                       children: [
                         SizedBox(width: 10,),
                         WidgetHelper.poppin("Add Photos : ",1, 18, Colors.white),
                       ],
                     ),
                     SizedBox(height: 10,),
                      Container(
                        height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                    
                        GestureDetector(
                              onTap: () async {
                            await ImagePicker().getImage(
                                    source: ImageSource.gallery)
                                .then((image) {
                                  print(basename(image.path));
                                    String name = basename(image.path);          
                     Reference storageref = FirebaseStorage.instance
                    .ref()
                    .child(name);
                UploadTask uploadTaskSnapshot =
                    storageref.putFile(io.File(image.path)).                   
                    whenComplete(() async {
                      MeetUp.prefs.setString("img",await storageref.getDownloadURL());
                      print("DOne Successuly");
                       FirebaseFirestore.instance.collection("users")
                    .doc(MeetUp.prefs.getString("uid")).update({
                      "image":await storageref.getDownloadURL()});

                   
                   
                    FirebaseFirestore.instance.collection("users").
                    doc(MeetUp.prefs.getString("uid")).collection("images").doc()
                    .set({
                      "image":await storageref.getDownloadURL(),
                    }
                    ).whenComplete(() async {

                        print(await storageref.getDownloadURL());
                          setState(() {
                                img1 = io.File(image.path);
                              });
                      // Navigator.push(context, MaterialPageRoute(builder: (b)=>interest()));
                    });

                                  
                      }  );

                            
                            });
                          },
                          child: Container(                          
                            height:150,width: 100,                            
                            decoration: BoxDecoration(
                                color: Colors.white24,
                              borderRadius: BorderRadius.circular(9),
                            image: DecorationImage(image:img1 == null ?
                     NetworkImage("https://upload.wikimedia.org/wikipedia/en/thumb/9/98/Blank_button.svg/1200px-Blank_button.svg.png")
                     : FileImage(img1),fit: BoxFit.cover ),
                           
                          ),),
                        ),
                        
                        GestureDetector(
                              onTap: () async {
                            await ImagePicker().getImage(
                                    source: ImageSource.gallery)
                                .then((image) {
                                  print(basename(image.path));
                                    String name = basename(image.path);          
                     Reference storageref = FirebaseStorage.instance
                    .ref()
                    .child(name);
                UploadTask uploadTaskSnapshot =
                    storageref.putFile(io.File(image.path)).                   
                    whenComplete(() async {
                      print("DOne Successuly");
                   
                    FirebaseFirestore.instance.collection("users").
                    doc(MeetUp.prefs.getString("uid")).collection("images").doc()
                    .set({
                      "image":await storageref.getDownloadURL(),
                    }
                    

                    ).whenComplete(() async {
                        print(await storageref.getDownloadURL());
                          setState(() {
                                img2 = io.File(image.path);
                              });
                      // Navigator.push(context, MaterialPageRoute(builder: (b)=>interest()));
                    });

                                  
                      }  );

                            
                            });
                          },
                          child: Container(                          
                            height:150,width: 100,                            
                            decoration: BoxDecoration(
                                color: Colors.white24,
                              borderRadius: BorderRadius.circular(9),
                            image: DecorationImage(image:img2 == null ?
                     NetworkImage("https://upload.wikimedia.org/wikipedia/en/thumb/9/98/Blank_button.svg/1200px-Blank_button.svg.png")
                     : FileImage(img2),fit: BoxFit.cover ),
                           
                          ),),
                        ),
                       
                        GestureDetector(
                              onTap: () async {
                            await ImagePicker().getImage(
                                    source: ImageSource.gallery)
                                .then((image) {
                                  print(basename(image.path));
                                    String name = basename(image.path);          
                     Reference storageref = FirebaseStorage.instance
                    .ref()
                    .child(name);
                UploadTask uploadTaskSnapshot =
                    storageref.putFile(io.File(image.path)).                   
                    whenComplete(() async {
                      print("Done Successuly");
                   
                    FirebaseFirestore.instance.collection("users").
                    doc(MeetUp.prefs.getString("uid")).collection("images").doc()
                    .set({
                      "image":await storageref.getDownloadURL(),
                    }
                    

                    ).whenComplete(() async {
                        print(await storageref.getDownloadURL());
                          setState(() {
                                img3 = io.File(image.path);
                              });
                      // Navigator.push(context, MaterialPageRoute(builder: (b)=>interest()));
                    });

                                  
                      }  );

                            
                            });
                          },
                          child: Container(                          
                            height:150,width: 100,                            
                            decoration: BoxDecoration(
                                color: Colors.white24,
                              borderRadius: BorderRadius.circular(9),
                            image: DecorationImage(image:img3 == null ?
                     NetworkImage("https://upload.wikimedia.org/wikipedia/en/thumb/9/98/Blank_button.svg/1200px-Blank_button.svg.png")
                     : FileImage(img3),fit: BoxFit.cover ),
                           
                          ),),
                        ),
                        
                      ],
                    ),
          //            Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //             children: [
          //               GestureDetector(
          //                     onTap: () async {
          //                   await ImagePicker().getImage(
          //                           source: ImageSource.gallery)
          //                       .then((image) {
          //                     setState(() {
          //                       img4 = io.File(image.path);
          //                     });
          //                   });
          //                 },
          //                 child: Container(
          //                   height:150,width: 100,
                            
          //                   decoration: BoxDecoration(
          //                       color: Colors.white24,
          //                     borderRadius: BorderRadius.circular(9),
          //                   image: DecorationImage(image:img4 == null ?
          //            NetworkImage("https://upload.wikimedia.org/wikipedia/en/thumb/9/98/Blank_button.svg/1200px-Blank_button.svg.png")
          //            : FileImage(img4), fit: BoxFit.cover),
                           
          //                 ),),
          //               ),
          //               GestureDetector(
          //                     onTap: () async {
          //                   await ImagePicker().getImage(
          //                           source: ImageSource.gallery)
          //                       .then((image) {
          //                     setState(() {
          //                       img5 = io.File(image.path);
          //                     });
          //                   });
          //                 },
          //                 child: Container(
                          
          //                   height:150,width: 100,
                            
          //                   decoration: BoxDecoration(
          //                       color: Colors.white24,
          //                     borderRadius: BorderRadius.circular(9),
          //                   image: DecorationImage(image:img5 == null ?
          //            NetworkImage("https://upload.wikimedia.org/wikipedia/en/thumb/9/98/Blank_button.svg/1200px-Blank_button.svg.png")
          //            : FileImage(img5), fit: BoxFit.cover),
                           
          //                 ),),
          //               ),
                        
          //               GestureDetector(
          //                     onTap: () async {
          //                   await ImagePicker().getImage(
          //                           source: ImageSource.gallery)
          //                       .then((image) {
          //                     setState(() {
          //                       img6 = io.File(image.path);
          //                     });
          //                   });
          //                 },
          //                 child: Container(
          // height:150,width: 100,decoration: BoxDecoration
          // (
          // color: Colors.white24,
          // borderRadius: BorderRadius.circular(9),
          // image: DecorationImage(image:img6 == null ?
          // NetworkImage("https://upload.wikimedia.org/wikipedia/en/thumb/9/98/Blank_button.svg/1200px-Blank_button.svg.png")
          // :FileImage(img6),fit: BoxFit.cover),                           
          //                 ),),
          //               )
          //             ],
          //           ),
             
                  ],
                ),


                           ),
                    
                   ],
                 ),
               ),                
                           decoration: BoxDecoration(
                                      //  color: Colors.white10,
                             borderRadius: BorderRadius.circular(10)
                           ),
                         ),
                       ),
                      
                     ],

                    
                   ),
                 ),
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector( 
                    onTap: (){
    if(controller.page == 3)
    { 
      MeetUp.prefs.setString("name",namecontroller.text.toString());
    FirebaseFirestore.instance
    .collection("users")
    .doc(MeetUp.prefs.getString("uid"))
    .update({
                  "area":areacontroller.text.toString(),"gender":gender.toString(),
                  "name":namecontroller.text.toString(),
    }).whenComplete(() {
                             Navigator.pushReplacement(context,MaterialPageRoute(builder: (b)=>interest()));
                           });
                         }
                         controller.nextPage(duration: Duration(seconds: 2), curve: Curves.fastLinearToSlowEaseIn);
                       },
                       child: CircleAvatar(
                         backgroundColor: Colors.white,
                         radius: 40,
                         child: Icon(Icons.arrow_forward_ios,color: kPrimaryColor,),
                       ),
                     ),
                   ),
                 ],
               )
                        
                        
            ],
          ),
        ),
      ),
    );
  }
}
