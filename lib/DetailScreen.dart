import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meetup/Helper/Colors.dart';
import 'package:meetup/Helper/helper.dart';
import 'package:meetup/Widgets/widgethelper.dart';

import 'ChatRoom.dart';

class DetailScreen extends StatefulWidget {
  final QueryDocumentSnapshot query;
  const DetailScreen({key, this.query}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String imgurl;
  @override
  void initState() {
    super.initState();

    setState(() {
      imgurl = widget.query["image"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 10),
      child: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(colors: [
            kbgPrimaryColor.withOpacity(0.4),
            kPrimaryColor.withOpacity(0.5),
          ]),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                SizedBox(
                  width: 18,
                ),
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15,
                    child: Center(
                        child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 13,
                    ))),
                new Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, top: 20.0, bottom: 20.0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10, top: 8, bottom: 5),
                          child: WidgetHelper.text(
                              widget.query["name"], 20, Colors.black),
                        ))),
              ],
            ),
            SizedBox(height: 0),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 23,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(imgurl), fit: BoxFit.cover),
                            color: Colors.white,
                          ),
                          height: 450,
                          width: MediaQuery.of(context).size.width - 120,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, bottom: 8, right: 8),
                          child: Container(
                            height: 450,
                            child: StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection("users")
                                    .doc(widget.query['uid'])
                                    .collection("images")
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        backgroundColor: kbgPrimaryColor,
                                        valueColor:
                                            new AlwaysStoppedAnimation<Color>(
                                                kPrimaryColor),
                                      ),
                                    );
                                  } else {
                                    return Scrollbar(
                                      child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          itemCount: snapshot.data.docs.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5,
                                                  right: 5,
                                                  bottom: 10),
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    imgurl = snapshot.data
                                                        .docs[index]['image'];

                                                    print(imgurl);
                                                  });
                                                },
                                                child: Container(
                                                  // width: 80,
                                                  height: 100,

                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors.white,
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              snapshot.data
                                                                          .docs[
                                                                      index]
                                                                  ['image']),
                                                          fit: BoxFit.cover)),
                                                ),
                                              ),
                                            );
                                          }),
                                    );
                                  }
                                }),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[200],
                            ),
                          ),
                        ),
                      ),
                      //TODO
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left:13.0,right: 13,top:5,bottom: 10),
              child: Container(                
     child: Center(child: WidgetHelper.text(widget.query["interest"].toString().replaceAll("[","").replaceAll("]","").replaceAll(",", "  |  "), 18,Colors.black)),
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white
                ),

              ),

            ),
             Padding(
              padding: const EdgeInsets.only(left:13.0,right: 13,top:2,bottom: 10),
              child: Container(                
     child: Center(
       child: widget.query["info"] == "" ? WidgetHelper.text("Bio is Empty !!",18,Colors.black) :
       WidgetHelper.text(widget.query["info"].toString(), 18,Colors.black)),
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white
                ),

              ),
              
            ),
             Row(
               children: [
                 Padding(
                  padding: const EdgeInsets.only(left:14.0,top:2,bottom: 10),
                  child: Container(                
     child: Padding(
       padding: const EdgeInsets.only(left:12.0,right: 12,top:9,bottom: 0),
       child: WidgetHelper.text(widget.query['gender'],18,Colors.black),
     ),
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.white
                    ),

                  ),
                  
            ),

               ],

             )
             ,
            Padding(
              padding: const EdgeInsets.only(left:13.0,right: 13,top:5,bottom: 10),
              child: GestureDetector(
                onTap: (){
                   Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (b) => chat(
                                                        receiveruid: widget.query["uid"],
                                                        receivername: widget.query['name'],
                                                        receiverimage: widget.query['image'],
                                                        query: widget.query.data()
                                                            ,
                                                      )));
                },
                child: Container(                
     child: Center(
       child:  WidgetHelper.text("MESSAGE",18,Colors.black) 
),
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white
                  ),

                ),
              ),
              
            )
          ],
        ),
      ),
    ));
  }
}
