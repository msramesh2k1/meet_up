import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meetup/Helper/Colors.dart';
import 'package:meetup/Helper/helper.dart';
import 'package:meetup/Widgets/widgethelper.dart';

class chat extends StatefulWidget {
  final int counter;
  final Future<QuerySnapshot> query;
  final String receivername;

  const chat({
    key,
    this.counter,
    this.query, this.receivername,
  }) : super(key: key);

  @override
  _chatState createState() => _chatState();
}

class _chatState extends State<chat> {
  TextEditingController chatcontroller = TextEditingController();
  String chatid;
  ScrollController scrollController = ScrollController();

  List userlist = [];
  String name;
  String url;
   @override
    void initState() {
      super.initState();
     
print(name);
      setState(() {
     
        
   
        
    
   
        var username = MeetUp.prefs.getString("name");
        userlist.add(name);
        userlist.add(MeetUp.prefs.getString("name"));
       
        
      });
    }
  @override
  Widget build(BuildContext context) {
    widget.query.then((value) {
        setState(() {
                  name = value.docs[widget.counter]['name'];
                });
        // print(value.docs[widget.counter]['name']);
      });

   
  
// print(MeetUp.prefs.getString("name"));
    return Scaffold(
      body: Container(
        color: bgcolor,
        child: FutureBuilder(
          future: widget.query,
          builder: (context, snapshots) {
            return Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 19,
                        ),
                        SizedBox(width: 10),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white10,
                                image: DecorationImage(
                                    image: NetworkImage(
                                      snapshots.data.docs[widget.counter]
                                          ['image'],
                                    ),
                                    fit: BoxFit.contain)),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        
                        WidgetHelper.text(
                          name
,                            // snapshots.data.docs[widget.counter]['name'],
                            20,
                            Colors.white)
                      ],
                    ),
                    height: 50,
                    color: bgcolor,
                  ),
                  Flexible(
                      child: Container(
                        
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: StreamBuilder(
                          stream: FirebaseFirestore.instance.collection("chats")
                          .doc(MeetUp.prefs.getString("name").toLowerCase()+"_"+"$name".toLowerCase()).
                          collection("messages").orderBy("time").snapshots(),
                          builder: (context,snapshots){
                            if (snapshots.connectionState == ConnectionState.done){
                              return ListView.builder(
                            controller: scrollController,

                            scrollDirection: Axis.vertical,
                            
                            itemCount: snapshots.data.docs.length,
                            itemBuilder: (BuildContext context,int index){
                            return Padding(
                              padding: const EdgeInsets.only(left:8.0,right: 8,top:2),                         

                              child: Container(
                                                             
                                alignment: snapshots.data.docs[index]['sentby'] ==  MeetUp.prefs.getString("name")   ?    Alignment.topRight :Alignment.topLeft,
                                child: Container(
                               
                                  decoration: BoxDecoration(
                                       color: bgcolor,
                                       borderRadius: BorderRadius.circular(10)

                                  ),
                                  padding: EdgeInsets.symmetric(vertical:15,horizontal: 20),
                                  child: WidgetHelper.text(snapshots.data.docs[index]['message'],14,Colors.white)),
                                ),
                            );

                          });

                            }
                            return CircularProgressIndicator();
                        
                        }),
                    color: Colors.white10,
                  )),
                  chatinput()
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget chatinput() {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.image,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.face,
          color: Colors.white,
        ),
        SizedBox(width: 15),
        Flexible(
            child: TextField(
              style: TextStyle(color: Colors.white),
          decoration: InputDecoration(            
              fillColor: Colors.white10,
              hintText: "Text Here ...",
              hintStyle: TextStyle(color: Colors.white),
              border: InputBorder.none),
          controller: chatcontroller,
        )),
        GestureDetector(
            onTap: () {
               FirebaseFirestore.instance
                  .collection("chats")
                  .doc(MeetUp.prefs.getString("name").toLowerCase()+"_"+"$name".toLowerCase())
                  .set({"users": [MeetUp.prefs.getString("name").toLowerCase(),name.toLowerCase()], 
                  "chatroomid":MeetUp.prefs.getString("name").toLowerCase()+"_"+"$name".toLowerCase() });
              FirebaseFirestore.instance
                  .collection("chats")
                  .doc(MeetUp.prefs.getString("name").toLowerCase()+"_"+"$name".toLowerCase())
                  .collection("messages")
                  .doc()
                  .set({
                "message": chatcontroller.text.toString(),
                "sentby": MeetUp.prefs.getString("name").toLowerCase(),
                "time": Timestamp.now().millisecondsSinceEpoch
              }).whenComplete(() {
 chatcontroller.text = "";
               print("jnka");
               scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
          );
              
              });
            },
            child: Icon(
              Icons.send_rounded,
              color: Colors.white,
            ))
            ,SizedBox(width: 5,)
      ],
    );
  }
 void setmessage() {
    FirebaseFirestore.instance
                  .collection("chats")
                  .doc(MeetUp.prefs.getString("name").toLowerCase()+"_"+"$name".toLowerCase())
                  .set({"users": [MeetUp.prefs.getString("name").toLowerCase(),name.toLowerCase()], 
                  "chatroomid":MeetUp.prefs.getString("name").toLowerCase()+"_"+"$name".toLowerCase() });
              FirebaseFirestore.instance
                  .collection("chats")
                  .doc(MeetUp.prefs.getString("name").toLowerCase()+"_"+"$name".toLowerCase())
                  .collection("messages")
                  .doc()
                  .set({
                "message": chatcontroller.text.toString(),
                "sentby": MeetUp.prefs.getString("name").toLowerCase(),
                "time": Timestamp.now().millisecondsSinceEpoch
              });
  
}
}



class messagetile extends StatelessWidget {
  final String message;
  final String time;
  const messagetile({  key, this.message, this.time }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}