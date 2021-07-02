import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meetup/Helper/Colors.dart';
import 'package:meetup/Helper/helper.dart';
import 'package:meetup/Widgets/widgethelper.dart';
import 'ChatRoom.dart';


class DetailerScreen extends StatefulWidget {
  final String uid;

  const DetailerScreen({key, this.uid}) : super(key: key);

  @override
  _DetailerScreenState createState() => _DetailerScreenState();
}

class _DetailerScreenState extends State<DetailerScreen> {
  String imgurl;
 

  @override
  Widget build(BuildContext context) {
     FirebaseFirestore.instance.collection("users").doc(widget.uid).get().then((value) {
setState(() {
  imgurl = value.data()['image'];
});
   });
    return new Scaffold(
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("users").where("uid",isEqualTo: widget.uid)
          .snapshots(),
          builder: (context,snapshots){
            return  Container(
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                    kPrimaryColor.withOpacity(0.6),
                kbgPrimaryColor,
              
              ]),
            ),
            child: Column(
              children: [
              
                Row(
                  children: [
                    SizedBox(
                      width: 18,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                          backgroundColor: Colors.white60,
                          radius: 15,
                          child: Center(
                              child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                            size: 13,
                          ))),
                    ),
                    new Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, top: 20.0, bottom: 20.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white60,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10, top: 8, bottom: 5),
                              child: WidgetHelper.text(
                                  snapshots.data.docs[0]["name"]
                                  , 20, Colors.black),
                            ))),
                  ],
                ),
           
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 23,
                      decoration: BoxDecoration(
                        color: Colors.white60,
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
                                    image: NetworkImage(imgurl == null ? "" : imgurl),
                                     fit: BoxFit.cover),
                                color: Colors.white60,
                              ),
                              height: 420,
                              width: MediaQuery.of(context).size.width - 120,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, bottom: 8, right: 8),
                              child: Container(
                                height: 420,
                                child: StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection("users")
                                        .doc( snapshots.data.docs[0]['uid'])
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
                                                      top: 10,
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
                                                          color: Colors.white60,
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
                                  color: Colors.white24,
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
     child: Center
     (
       child: WidgetHelper.text( snapshots.data.docs[0]["interest"].toString()
       .replaceAll("[","").replaceAll("]","")
       .replaceAll(",", "  ‣  "),
        18,Colors.black)),
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white60
                    ),

                  ),

                ),
                 Padding(
                  padding: const EdgeInsets.only(left:13.0,right: 13,top:2,bottom: 10),
                  child: Container(                
     child: Center(
           child:  snapshots.data.docs[0]["info"] == "" ? WidgetHelper.text("Bio is Empty !!",18,Colors.black) :
           WidgetHelper.text( snapshots.data.docs[0]["info"].toString(), 18,Colors.black)),
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white60
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
           child: WidgetHelper.text( snapshots.data.docs[0]['gender'],18,Colors.black),
     ),
     height: 30,decoration: BoxDecoration(borderRadius: BorderRadius.circular(9),color: Colors.white60),),),
],),

Padding(
  padding: const EdgeInsets.only(left:13.0,right: 13,top:5,bottom: 10),
  child: GestureDetector(
     onTap: () {
                      List friends = snapshots.data.docs[0]['friends'];
                      print(friends);
                      print(MeetUp.prefs.getString("name"));

                      if (friends.contains(MeetUp.prefs.getString("name"))) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (b) => chat(
                                      receiveruid: snapshots.data.docs[0]['uid'],
                                      query: snapshots.data.docs[0],
                                      receiverimage: snapshots.data.docs[0]['image'],
                                      receivername: snapshots.data.docs[0]['name'],
                                    )));
                      } else {
                        showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (BuildContext context) {
                              return Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: GestureDetector(
                                  onTap: () {
                                    String chatid;
                                    String userid;

                                    userid =
                                        MeetUp.prefs.getString("uid") ?? "";
                                    if (userid.hashCode <=
                                        snapshots.data.docs[0]['uid'].hashCode) {
                                      chatid = MeetUp.prefs
                                              .getString("name")
                                              .toLowerCase() +
                                          "_" +
                                          snapshots.data.docs[0]['name']
                                              .toString()
                                              .toLowerCase();
                                    } else {
                                      chatid = snapshots.data.docs[0]['name']
                                              .toString()
                                              .toLowerCase() +
                                          "_" +
                                          MeetUp.prefs
                                              .getString("name")
                                              .toLowerCase();
                                    }
                                    FirebaseFirestore.instance
                                        .collection("chats")
                                        .doc(chatid)
                                        .set({
                                      "uid": snapshots.data.docs[0]['uid'],
                                      "status": "Waiting",
                                      "name": MeetUp.prefs.getString("name"),
                                      "receivername": snapshots.data.docs[0]['name'],
                                      "img": MeetUp.prefs.getString("img"),
                                      "receiverimg": snapshots.data.docs[0]['image'],
                                      "users": [
                                        MeetUp.prefs
                                            .getString("name")
                                            .toLowerCase(),
                                        snapshots.data.docs[0]['name'].toLowerCase()
                                      ]
                                    });
                                  },
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                            child: WidgetHelper.text(
                                                "Send Request",
                                                20,
                                                Colors.black))
                                      ],
                                    ),
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10)
                                        //  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(50))
                                        ),
                                  ),
                                ),
                              );
                            });
                      }
                    },
    
   
                    child: Container(                
     child: Center(
           child:  WidgetHelper.text("Message",18,Colors.black) 
),
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white60
                      ),

                    ),
                  ),
                  
                )
              ],
            ),
          );
            
          },
            ));
  }
}
