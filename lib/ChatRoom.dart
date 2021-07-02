import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:meetup/Helper/Colors.dart';
import 'package:meetup/Helper/helper.dart';
import 'package:meetup/Widgets/widgethelper.dart';

class chat extends StatefulWidget {
  final Map query;
  final String receivername;
  final String receiverimage;
  final String receiveruid;

  const chat({
    key,this.query, this.receivername, this.receiverimage, this.receiveruid
   
  }) : super(key: key);

  @override
  _chatState createState() => _chatState();
}

class _chatState extends State<chat> {
  TextEditingController chatcontroller = TextEditingController();
  String chatid;
  String userid;

   ScrollController scrollController = ScrollController();
  //   initialScrollOffset:  position.maxE

  // );


  List userlist = [];
@override
    void initState() {
   setchatid();
      
      super.initState();
      }
     setchatid(){
   userid =  MeetUp.prefs.getString("uid") ?? "";
   if(userid.hashCode <= widget.receiveruid.hashCode){

     chatid = MeetUp.prefs.getString("name").toLowerCase()+"_"+widget.receivername.toString().toLowerCase();
   }else{
     chatid = widget.receivername.toString().toLowerCase()+"_"+MeetUp.prefs.getString("name").toLowerCase();
   }
     }

void _scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 100), curve: Curves.elasticOut);
    } else {
      Timer(Duration(milliseconds: 0), () => _scrollToBottom());
    }
 }
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_){
_scrollToBottom();
    });
  

    // String chatroomid = MeetUp.prefs.getString("name")+"_"+widget.query["name"];
      return Scaffold(
          body: Container(
              height: MediaQuery.of(context).size.height,          
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://images.pexels.com/photos/963436/pexels-photo-963436.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.black, BlendMode.colorDodge)),
            color: Colors.grey.shade300,
          ),
       
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
          child: Column(
                  children: [
                    SizedBox(
                      height:45,
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
                          SizedBox(width: 3),
                          Padding(
                            padding: const EdgeInsets.only(left:4.0,right: 4, bottom: 4),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white10,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        widget.receiverimage,
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          
                          WidgetHelper.text(
                           widget.receivername
,                           
                              20,
                              Colors.white)
                        ],
                      ),
                      height: 50,
                      color: Colors.transparent,
                    ),
                    Flexible(
                        child: Container(
                          
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: StreamBuilder(
                            stream: FirebaseFirestore.instance.collection("chats")
                          
                             .doc(chatid).
                            collection("messages").orderBy("time").snapshots(),
                            builder: (context,snapshots){
                              if(!snapshots.hasData){
                                 return Center(child: CircularProgressIndicator(
                    backgroundColor:kbgPrimaryColor,valueColor:  new AlwaysStoppedAnimation<Color>(kPrimaryColor),),);
                
                              }
                             
                                return ListView.builder(
                                  // reverse: true,
                              controller: scrollController,

                              scrollDirection: Axis.vertical,
                              
                              itemCount: snapshots.data.docs.length,
                              itemBuilder: (BuildContext context,int index){
                              return Padding(
                                padding: const EdgeInsets.only(left:8.0,right: 8,bottom: 5),                         
       child: Container(alignment: snapshots.data.docs[index]['sentby']
==  MeetUp.prefs.getString("name").toLowerCase()   ?    Alignment.topRight :Alignment.topLeft,
                                  child: Container(
                                 
                                    decoration: BoxDecoration(
                                         color:  snapshots.data.docs[index]['sentby']
==  MeetUp.prefs.getString("name").toLowerCase() ?
                                         Colors.white70 : Colors.white70,
                                         borderRadius:
                                         BorderRadius.circular(15)

                                    ),
                                    padding: EdgeInsets.symmetric(vertical:13,horizontal: 20),
                                    child:
                                     WidgetHelper.text(snapshots.data.docs[index]['message'],15,Colors.black)),
                                  ),
                              );

                            });

                             
                          
                          }),
                      color: Colors.white10,
                    )),
                    chatinput()
                  ],
                ),
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
         
         
         
        //  FirebaseFirestore.instance
        //           .collection("chats")
        //           .doc(chatid)
        //           .set({

                  //     "receiverimg" :widget.query['image'],
                  //     "uid":widget.query['uid'],
                  //   "users": [
                  //     MeetUp.prefs.getString
                  //     ("name").toLowerCase()
                  //     ,widget.query['name'].toLowerCase()], 
                  // "chatroomid":chatid});
              FirebaseFirestore.instance
                  .collection("chats")
                  .doc(chatid)
                  .collection("messages")
                  .doc()
                  .set({
                    
              //"receiverimg" :widget.query['image'],

              "message": chatcontroller.text.toString(),
              "sentby": MeetUp.prefs.getString("name").toLowerCase(),
              "time": Timestamp.now().millisecondsSinceEpoch
              }).then((value) {
      scrollController.animateTo
      (
      scrollController.position.maxScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 100),
      ).
      then((value) => chatcontroller.clear());
              // });
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
  void clearchat() {
    chatcontroller.text = "";   
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