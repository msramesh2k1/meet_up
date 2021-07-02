import 'package:flutter/material.dart';
import 'package:meetup/Helper/Colors.dart';
import 'package:meetup/MainScreen.dart';
import 'package:path/path.dart';
import 'package:meetup/Widgets/widgethelper.dart';
import 'dart:io'as io;
// import 'package:universal_html/html.dart';
// import 'package:firebase/firebase.dart' as fb;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meetup/interestselector.dart';
import 'package:toast/toast.dart';
import 'Helper/helper.dart';
class Photoframe extends StatefulWidget {
  const Photoframe({  key }) : super(key: key);

  @override
  _PhotoframeState createState() => _PhotoframeState();
}

class _PhotoframeState extends State<Photoframe> {
  bool uploaded = false;
  String url;
  String imgurl;
  io.File img;
  io.File img1;
  io.File img2;
  io.File img3;
  io.File img4;
  io.File img5;
  io.File img6;
  

  TextEditingController agecontroller = new TextEditingController();
  TextEditingController areacontroller = new TextEditingController();
  TextEditingController gendercontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            GestureDetector(
              onTap: () async {
                        await ImagePicker().getImage(
                                source: ImageSource.gallery)
                            .then((image) {
                          setState(() {
                            img = io.File(image.path);
                          });
                        });
                      },
              child: CircleAvatar(
                backgroundImage: img == null ?
                 NetworkImage("https://img.icons8.com/cotton/2x/gender-neutral-user--v2.png")
                 : FileImage(img),
             
                // child: img == null ? 
                // GestureDetector(
                //   onTap: () async {
                //           await ImagePicker().getImage(
                //                   source: ImageSource.gallery)
                //               .then((image) {
                //             setState(() {
                //               img = io.File(image.path);
                //             });
                //           });
                //         },
                //   child: Icon(Icons.add_a_photo,color: Colors.white,size: 30,)) : Container(
                //         decoration: BoxDecoration(
                //             image: new DecorationImage(
                //               image: new FileImage(img),
                //               fit: BoxFit.cover,
                //             ),
                //             color: Colors.black,
                //             borderRadius: BorderRadius.circular(20)),
                //         height: 100,
                //         width: 100,
                //       ),
                backgroundColor: Colors.white12,
                radius: 70,
              ),
            ),
            SizedBox(height: 20,)
            ,
            WidgetHelper.text(MeetUp.prefs.getString("name"), 25,Colors.white),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [

                     WidgetHelper.text("Age", 16,Colors.white),
                     SizedBox(height: 5,),
                    Container(height: 
                    40,width: 80,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                         decoration: InputDecoration(border: InputBorder.none),
                          controller: agecontroller,
                          style: TextStyle(color: Colors.white),
                        
                        ),
                      ),
                    ),
                    
                    decoration: BoxDecoration(
                      color: Colors.white10,borderRadius:  BorderRadius.circular(10)
                    ),),
                  ],
                ),
                 Column(
                  children: [

                     WidgetHelper.text("Area", 16,Colors.white),
                     SizedBox(height: 5,),
                    Container(height: 
                    40,width: 80,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                         decoration: InputDecoration(border: InputBorder.none),
                          controller: areacontroller,
                          style: TextStyle(color: Colors.white),
                        
                        ),
                      ),
                    ),
                    
                    decoration: BoxDecoration(
                      color: Colors.white10,borderRadius:  BorderRadius.circular(10)
                    ),),
                  ],
                ),
                 Column(
                  children: [
                     WidgetHelper.text("Gender", 16,Colors.white),
                     SizedBox(height: 5,),
                    Container(height: 
                    40,width: 80,
                     child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                         decoration: InputDecoration(border: InputBorder.none),
                          controller: gendercontroller,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white10,borderRadius:  BorderRadius.circular(10)
                    ),),
                  ],
                )
              ],
            ),
            SizedBox(height: 20,),
            WidgetHelper.text("Add Photos of Your's :", 20,Colors.white),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                              onTap: () async {
                            await ImagePicker().getImage(
                                    source: ImageSource.gallery)
                                .then((image) {
                              setState(() {
                                img1 = io.File(image.path);
                              });
                            });
                          },
                          child: Container(
                            height: 100,width: 100,   decoration: BoxDecoration(
                                color: Colors.white10,
                              borderRadius: BorderRadius.circular(9),
                            image: DecorationImage(image:img1 == null ?
                     NetworkImage("https://img.icons8.com/cotton/2x/gender-neutral-user--v2.png")
                     : FileImage(img1),),                           
                          ),),
                        ),
                        GestureDetector(
                              onTap: () async {
                            await ImagePicker().getImage(
                                    source: ImageSource.gallery)
                                .then((image) {
                              setState(() {
                                img2 = io.File(image.path);
                              });
                            });
                          },
                          child: Container(                          
                            height: 100,width: 100,                            
                            decoration: BoxDecoration(
                                color: Colors.white10,
                              borderRadius: BorderRadius.circular(9),
                            image: DecorationImage(image:img2 == null ?
                     NetworkImage("https://img.icons8.com/cotton/2x/gender-neutral-user--v2.png")
                     : FileImage(img2), ),
                           
                          ),),
                        ),
                        
                        GestureDetector(
                              onTap: () async {
                            await ImagePicker().getImage(
                                    source: ImageSource.gallery)
                                .then((image) {
                              setState(() {
                                img3 = io.File(image.path);
                              });
                            });
                          },
                          child: Container(
                          
                            height: 100,width: 100,
                            
                            decoration: BoxDecoration(
                                color: Colors.white10,
                              borderRadius: BorderRadius.circular(9),
                            image: DecorationImage(image:img3 == null ?
                     NetworkImage("https://img.icons8.com/cotton/2x/gender-neutral-user--v2.png")
                     : FileImage(img3), ),
                           
                          ),),
                        )
                      ],
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                              onTap: () async {
                            await ImagePicker().getImage(
                                    source: ImageSource.gallery)
                                .then((image) {
                              setState(() {
                                img4 = io.File(image.path);
                              });
                            });
                          },
                          child: Container(
                            height: 100,width: 100,
                            
                            decoration: BoxDecoration(
                                color: Colors.white10,
                              borderRadius: BorderRadius.circular(9),
                            image: DecorationImage(image:img4 == null ?
                     NetworkImage("https://img.icons8.com/cotton/2x/gender-neutral-user--v2.png")
                     : FileImage(img4), ),
                           
                          ),),
                        ),
                        GestureDetector(
                              onTap: () async {
                            await ImagePicker().getImage(
                                    source: ImageSource.gallery)
                                .then((image) {
                              setState(() {
                                img5 = io.File(image.path);
                              });
                            });
                          },
                          child: Container(
                          
                            height: 100,width: 100,
                            
                            decoration: BoxDecoration(
                                color: Colors.white10,
                              borderRadius: BorderRadius.circular(9),
                            image: DecorationImage(image:img5 == null ?
                     NetworkImage("https://img.icons8.com/cotton/2x/gender-neutral-user--v2.png")
                     : FileImage(img5), ),
                           
                          ),),
                        ),
                        
                        GestureDetector(
                              onTap: () async {
                            await ImagePicker().getImage(
                                    source: ImageSource.gallery)
                                .then((image) {
                              setState(() {
                                img6 = io.File(image.path);
                              });
                            });
                          },
                          child: Container(
          height: 100,width: 100,decoration: BoxDecoration
          (
          color: Colors.white10,
          borderRadius: BorderRadius.circular(9),
          image: DecorationImage(image:img6 == null ?
          NetworkImage("https://img.icons8.com/cotton/2x/gender-neutral-user--v2.png")
          :FileImage(img6),),                           
                          ),),
                        )
                      ],
                    ),
                GestureDetector(
                  onTap: (){
                    String name = basename(img.path);
          
                     Reference storageref = FirebaseStorage.instance
                    .ref()
                    .child(name);
                UploadTask uploadTaskSnapshot =
                    storageref.putFile(img).
                   
                    whenComplete(() async => 
                    FirebaseFirestore.instance.collection("users").doc(MeetUp.prefs.getString("uid")).update({
                      "area":areacontroller.text.toString(),
                      "age":agecontroller.text.toString(),
                      "gender":gendercontroller.text.toString(),
                      "image":await storageref.getDownloadURL(),
                    
                    

                    }).whenComplete(() async {
                        print(await storageref.getDownloadURL());
                      Navigator.push(context, MaterialPageRoute(builder: (b)=>interest()));
                    })
                    );},child: Container(
                        child: Center(child: WidgetHelper.text("Finish", 18,Colors.white)),
                        decoration: BoxDecoration(
                          color: Colors.white24
,
borderRadius: BorderRadius.circular(9)                      ),
                        height: 30,width: 100,),
                    )
                  ],
                ),


                           ),
            )
          ],
        ),
      ),

    );
  }
}