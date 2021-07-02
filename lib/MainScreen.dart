import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:meetup/Helper/Colors.dart';
import 'package:meetup/Helper/helper.dart';
import 'package:tcard/tcard.dart';
import 'ChatRoom.dart';
import 'DetailerScreen.dart';
import 'Widgets/widgethelper.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TCardController _controller = TCardController();
  PageController controller = PageController();
  List<Widget> usercard = [];
  List<Widget> chatcard = [];
  bool liked = false;
  String chatid;
  String userid;

  //9894672659
  //909878753
  @override
  void initState() {
    print("HashCode" + MeetUp.prefs.getString("uid").hashCode.toString());
    super.initState();
    print(MeetUp.prefs.getString("uid"));
    setState(() {});
    final query = FirebaseFirestore.instance
        .collection("users")
        .where("uid", isNotEqualTo: MeetUp.prefs.getString("uid").toString())
        // .where("interest",arrayContainsAny: ["Movies","Travel"])
        .snapshots();
    query.forEach((element) {
      element.docs.forEach((element) {
        setState(() {});
        chatcard.add(Container(
          color: Colors.white10,
          height: 80,
          child: Row(
            children: [CircleAvatar()],
          ),
        ));
        usercard.add(Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 4),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: WidgetHelper.text(
                                element["name"], 18, Colors.black),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.white,
                                  builder: (context) => Container(
                                    height: MediaQuery.of(context).size.height -
                                        100,
                                    decoration: new BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: new BorderRadius.only(
                                        topLeft: const Radius.circular(25.0),
                                        topRight: const Radius.circular(25.0),
                                      ),
                                    ),
                                    child: Center(
                                      child: DetailerScreen(
                                        uid: element.data()['uid'],
                                      ),
                                    ),
                                  ),
                                );
                                // showBottomSheet(
                                //   context: context, builder: (BuildContext context){
                                //   return Container(height: 900,color: Colors.white
                                //   ,child: DetailerScreen(uid:element.data()['uid']),
                                //   );
                                // });
                                // showModalBottomSheet(context: context, builder: (b){
                                //   return DetailScreen();
                                // });
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (b) =>
                                //             DetailerScreen(uid: element.data()['uid'])));
                              },
                              child: Icon(
                                Icons.info,
                                color: Colors.black,
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 4),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: WidgetHelper.text(
                                element
                                    .data()['interest']
                                    .toString()
                                    .replaceAll("[", "")
                                    .replaceAll("]", ""),
                                18,
                                Colors.black),
                          ),
                          SizedBox(
                            width: 5,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 4),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.location_on,
                            color: Colors.black,
                            size: 18,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: WidgetHelper.text(
                                element.data()['area'], 18, Colors.black),
                          ),
                          SizedBox(
                            width: 5,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      _controller.reset();
                    },
                    child: Container(
                        height: 28,
                        width: 45,
                        child: LottieBuilder.network(
                          // "https://assets9.lottiefiles.com/packages/lf20_SyT0Zf.json"
                          // "https://assets9.lottiefiles.com/packages/lf20_lg0nwjau.json"
                          "https://assets9.lottiefiles.com/packages/lf20_0qndevzx.json",
                          animate: false,
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      _controller.back();
                    },
                    child: Container(height: 35, width: 45, child: LottieBuilder.network(
                        // "https://assets9.lottiefiles.com/packages/lf20_SyT0Zf.json"
                        // "https://assets9.lottiefiles.com/packages/lf20_lg0nwjau.json"
                        "https://assets6.lottiefiles.com/packages/lf20_i0zh5psb.json")),
                  ),
                  GestureDetector(
                    onTap: () {
                      FirebaseFirestore.instance
                          .collection("liked")
                          .doc(MeetUp.prefs.getString("uid") +
                              "_" +
                              element.data()["uid"])
                          .set({
                        "liketo": element.data()['name'],
                        "likedbyuid": MeetUp.prefs.getString("uid"),
                        "likedby": MeetUp.prefs.getString("name"),
                        "likedtouid": element.data()['uid'],
                        "state": "SuperLiked",
                        "likedbyimg": MeetUp.prefs.getString("img"),
                        "likedtoimg": element.data()['image'],
                        //SUPERLIKED
                      });
                      _controller.forward();
                      setState(() {
                        liked = true;
                      });
                      Timer(Duration(milliseconds: 700), () {
                        setState(() {
                          liked = false;
                        });
                      });
                    },
                    child: Container(height: 30, width: 45, child: LottieBuilder.network(
                        // "https://assets9.lottiefiles.com/packages/lf20_SyT0Zf.json"
                        // "https://assets9.lottiefiles.com/packages/lf20_lg0nwjau.json"
                        "https://assets4.lottiefiles.com/packages/lf20_bQy33T.json")),
                  ),
                  GestureDetector(
                    onTap: () {
                      FirebaseFirestore.instance
                          .collection("liked")
                          .doc(MeetUp.prefs.getString("uid") +
                              "_" +
                              element.data()["uid"])
                          .set({
                        "liketo": element.data()['name'],
                        "likedbyuid": MeetUp.prefs.getString("uid"),
                        "likedby": MeetUp.prefs.getString("name"),
                        "likedtouid": element.data()['uid'],
                        "state": "Liked",
                        "likedbyimg": MeetUp.prefs.getString("img"),
                        "likedtoimg": element.data()['image'],
                      });
                      _controller.forward();
                      setState(() {
                        liked = true;
                      });
                      Timer(Duration(milliseconds: 700), () {
                        setState(() {
                          liked = false;
                        });
                      });
                    },
                    child: Container(
                        height: 60,
                        width: 45,
                        child: LottieBuilder.network(
                            "https://assets1.lottiefiles.com/packages/lf20_sCS0pB.json")),
                  ),
                  GestureDetector(
                    onTap: () {
                      List friends = element.data()['friends'];
                      print(friends);
                      print(MeetUp.prefs.getString("name"));

                      if (friends.contains(MeetUp.prefs.getString("name"))) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (b) => chat(
                                      receiveruid: element.data()['uid'],
                                      query: element.data(),
                                      receiverimage: element.data()['image'],
                                      receivername: element.data()['name'],
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
                                        element.data()['uid'].hashCode) {
                                      chatid = MeetUp.prefs
                                              .getString("name")
                                              .toLowerCase() +
                                          "_" +
                                          element
                                              .data()['name']
                                              .toString()
                                              .toLowerCase();
                                    } else {
                                      chatid = element
                                              .data()['name']
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
                                      "uid": MeetUp.prefs.getString("uid"),
                                      "status": "Waiting",
                                      "name": MeetUp.prefs.getString("name").toLowerCase(),
                                      "receivername": element.data()['name'].toLowerCase(),
                                      "img": MeetUp.prefs.getString("img"),
                                      "receiverimg": element.data()['image'],
                                      "receiveruid":element.data()['uid'],
                                      "users": [
                                        MeetUp.prefs
                                            .getString("name")
                                            .toLowerCase(),
                                        element.data()['name'].toLowerCase()
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
                        height: 60,
                        width: 45,
                        child: LottieBuilder.network(
                            "https://assets7.lottiefiles.com/private_files/lf30_7wnpoppl.json")),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(element.data()['image']),
                fit: BoxFit.cover),
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23.0,
                spreadRadius: -13.0,
                color: Colors.white,
              )
            ],
          ),
        ));
      });
    });
  }

// setchatid(){
//    userid =  MeetUp.prefs.getString("uid") ?? "";
//    if(userid.hashCode <= widget.receiveruid.hashCode){

//      chatid = MeetUp.prefs.getString("name").toLowerCase()+"_"+widget.receivername.toString().toLowerCase();
//    }else{
//      chatid = widget.receivername.toString().toLowerCase()+"_"+MeetUp.prefs.getString("name").toLowerCase();
//    }
//      }
  @override
  Widget build(BuildContext context) {
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
                filter: ImageFilter.blur(sigmaY: 2, sigmaX: 2),
                child: Column(children: [
                  SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                              onTap: () {
                                controller.jumpToPage(0);
                              },
                              child: LottieBuilder.network(
                                "https://assets5.lottiefiles.com/packages/lf20_vT2Gkd.json",
                                height: 50,
                              )),
                          GestureDetector(
                              onTap: () {
                                controller.jumpToPage(1);
                              },
                              child: LottieBuilder.network(
                                "https://assets1.lottiefiles.com/packages/lf20_frjmnxf7.json",
                                height: 38,
                              )),
                          liked
                              ? LottieBuilder.network(
                                  "https://assets10.lottiefiles.com/packages/lf20_2THqE1.json")
                              : SizedBox(),
                          GestureDetector(
                              onTap: () {
                                controller.jumpToPage(2);
                              },
                              child: LottieBuilder.network(
                                  "https://assets7.lottiefiles.com/packages/lf20_uk8Lwf.json",
                                  height: 80)),
                          GestureDetector(
                              onTap: () {
                                controller.jumpToPage(3);
                              },
                              child: Column(
                                children: [
                                  LottieBuilder.network(
                                    "https://assets2.lottiefiles.com/private_files/lf30_g92gq01w.json",
                                    height: 50,
                                  ),
                                  SizedBox(
                                    height: 6,
                                  )
                                ],
                              ))
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white30,
                          borderRadius: BorderRadius.circular(16)),
                      height: 60,
                    ),
                  ),
                  Expanded(
                    child: PageView(
                      controller: controller,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection("users")
                                .where("uid",
                                    isNotEqualTo: MeetUp.prefs.getString("uid"))
                                .snapshots(),
                            builder: (context, snapshots) {
                              if (!snapshots.hasData) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: kbgPrimaryColor,
                                    valueColor:
                                        new AlwaysStoppedAnimation<Color>(
                                            kPrimaryColor),
                                  ),
                                );
                              }
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Flexible(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      child: TCard(
                                          size: Size(
                                              MediaQuery.of(context).size.width,
                                              MediaQuery.of(context)
                                                  .size
                                                  .height),
                                          controller: _controller,
                                          cards: usercard),
                                    ),
                                  ),
                                ],
                              );
                            }),
                        Container(
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            // image: DecorationImage(
                            //     image: NetworkImage(
                            //         "https://images.pexels.com/photos/963436/pexels-photo-963436.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
                            //     fit: BoxFit.fitWidth,
                            //     colorFilter:
                            //         ColorFilter.mode(Colors.black, BlendMode.colorDodge)),
                            color: Colors.transparent,
                          ),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection("liked")
                                    .where("liketo",
                                        isEqualTo:
                                            MeetUp.prefs.getString("name"))
                                    .snapshots(),
                                builder: (context, snapshots) {
                                  if (!snapshots.hasData) {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        backgroundColor: kbgPrimaryColor,
                                        valueColor:
                                            new AlwaysStoppedAnimation<Color>(
                                                kPrimaryColor),
                                      ),
                                    );
                                  }
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      WidgetHelper.text(
                                          "Notification", 20, Colors.white),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        // decoration: BoxDecoration(
                                        color: Colors.white30,
                                        //     borderRadius:
                                        //         BorderRadius.circular(10)),
                                        height:
                                            MediaQuery.of(context).size.height -
                                                177,
                                        child: ListView.builder(
                                            itemCount:
                                                snapshots.data.docs.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 0, left: 4, right: 4),
                                                child: GestureDetector(
                                                  onTap: () {},
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.white70,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      14)),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          snapshots.data.docs[
                                                                          index]
                                                                      [
                                                                      'state'] ==
                                                                  "SuperLiked"
                                                              ? LottieBuilder
                                                                  .network(
                                                                  "https://assets4.lottiefiles.com/packages/lf20_bQy33T.json",
                                                                  height: 30,
                                                                )
                                                              : LottieBuilder
                                                                  .network(
                                                                      "https://assets1.lottiefiles.com/packages/lf20_sCS0pB.json"),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          CircleAvatar(
                                                            backgroundColor:
                                                                Colors.white,
                                                            backgroundImage:
                                                                NetworkImage(snapshots
                                                                            .data
                                                                            .docs[
                                                                        index][
                                                                    'likedbyimg']),
                                                            radius: 20,
                                                          ),
                                                          SizedBox(width: 20),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              WidgetHelper.text(
                                                                  snapshots
                                                                      .data
                                                                      .docs[
                                                                          index]
                                                                          [
                                                                          "likedby"]
                                                                      .toString(),
                                                                  13,
                                                                  Colors.black),
                                                              WidgetHelper.text(
                                                                  snapshots.data.docs[index]
                                                                              [
                                                                              'state'] ==
                                                                          "Liked"
                                                                      ? "  Liked Your Profile .. "
                                                                      : "    Superliked Your Profile     ",
                                                                  10,
                                                                  Colors
                                                                      .black54),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (b) =>
                                                                              DetailerScreen(uid: snapshots.data.docs[index]["uid"])));
                                                                  // query:FirebaseFirestore.instance.collection("users").doc("Z8BeArcF4HRJTqQP4hjQSCtZOt03").get()                                                  ,)));
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            8.0,
                                                                        vertical:
                                                                            3),
                                                                    child: Text(
                                                                      "View",
                                                                      style: GoogleFonts
                                                                          .josefinSans(
                                                                        textStyle: TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black,
                                                                            letterSpacing: 0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                      height: 50,
                                                      width: 100,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            // image: DecorationImage(
                            //     image: NetworkImage(
                            //         "https://images.pexels.com/photos/963436/pexels-photo-963436.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
                            //     fit: BoxFit.fitWidth,
                            //     colorFilter:
                            //         ColorFilter.mode(Colors.black, BlendMode.colorDodge)),
                            color: Colors.transparent,
                          ),
                          child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  WidgetHelper.text(
                                      "Conversation", 20, Colors.white),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height -
                                        177,
                                    child: PageView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        StreamBuilder(
                                            stream: FirebaseFirestore.instance
                                                .collection("chats")
                                                .where("users",
                                                    arrayContains: MeetUp.prefs
                                                        .getString("name")
                                                        .toLowerCase())
                                                .where("status",
                                                    isEqualTo: "Accepted")
                                                .snapshots(),
                                            builder: (context, snapshots) {
                                              if (!snapshots.hasData) {
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    backgroundColor:
                                                        kbgPrimaryColor,
                                                    valueColor:
                                                        new AlwaysStoppedAnimation<
                                                                Color>(
                                                            kPrimaryColor),
                                                  ),
                                                );
                                              }
                                              return Container(
                                                color: Colors.white30,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height -
                                                    180,
                                                child: ListView.builder(
                                                    itemCount: snapshots
                                                        .data.docs.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 4,
                                                                left: 4,
                                                                right: 4),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (b) =>
                                                                            chat(
                                                                              receiveruid:
                                                                               snapshots.data.docs[index]["uid"],
                                                                              receivername:
                                                                              snapshots.data.docs[index]['img'] 
                                                                               == MeetUp.prefs.getString("img")? 
                                                                      snapshots
                                                                          .data
                                                                          .docs[
                                                                              index]
                                                                              ["receivername"] : 
                                                                              snapshots.data.docs[index]['name']
                                                                          
                                                                          .toString(), 
                                                                              // snapshots.data.docs[index]['name'],
                                                                              receiverimage:
                                                                              snapshots.data.docs[index]['img'] 
                                                                               == MeetUp.prefs.getString("img")? 
                                                                      snapshots
                                                                          .data
                                                                          .docs[
                                                                              index]
                                                                              ["receiverimg"] : 
                                                                              snapshots.data.docs[index]['img']
                                                                          
                                                                          .toString(), 
                                                                              
                                                                              //  snapshots.data.docs[index]['img'],
                                                                            )));
                                                          },
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white70,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5)),
                                                              child: Row(
                                                                children: [
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),

                                                               
                                                                  CircleAvatar(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .white,
                                                                    backgroundImage:
                                                                        NetworkImage(
                                                                             snapshots.data.docs[index]['img'] == MeetUp.prefs.getString("img") ? 
                                                                          snapshots
                                                                            .data
                                                                            .docs[index]['receiverimg'] :  snapshots.data.docs[index]['img'] ),
                                                                    radius: 20,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 40,
                                                                  ),
                                                                  
                                                                  WidgetHelper.text(
                                                                     snapshots.data.docs[index]['img']  == MeetUp.prefs.getString("img")? 
                                                                      snapshots
                                                                          .data
                                                                          .docs[
                                                                              index]
                                                                              ["receivername"] : 
                                                                              snapshots.data.docs[index]['name']
                                                                          
                                                                          .toString(),
                                                                      25,
                                                                      Colors
                                                                          .black)
                                                                ],
                                                              ),
                                                              height: 70,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                              );
                                            }),
                                        Container(
                                          color: Colors.white30,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height -
                                              180,
                                          child: StreamBuilder(
                                            stream: FirebaseFirestore.instance
                                                .collection("chats")
                                                .where("receivername",
                                                    isEqualTo: MeetUp.prefs
                                                        .getString("name")
                                                        .toLowerCase())
                                                .where("status",
                                                    isEqualTo: "Waiting")
                                                .snapshots(),
                                            builder: (context, snapshot) {
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    backgroundColor:
                                                        kbgPrimaryColor,
                                                    valueColor:
                                                        new AlwaysStoppedAnimation<
                                                                Color>(
                                                            kPrimaryColor),
                                                  ),
                                                );
                                              }
                                              return ListView.builder(
                                                  itemCount:
                                                      snapshot.data.docs.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 4,
                                                              left: 4,
                                                              right: 4),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          // Navigator.push(
                                                          //     context,
                                                          //     MaterialPageRoute(
                                                          //         builder:
                                                          //             (b) =>
                                                          //                 chat(
                                                          //                   receiveruid: snapshot.data.docs[index]["uid"],
                                                          //                   receivername: snapshot.data.docs[index]['users'][1],
                                                          //                   receiverimage: snapshot.data.docs[index]['receiverimg'],
                                                          //                 )));
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .white70,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                            child: Row(
                                                              children: [
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                CircleAvatar(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white,
                                                                  backgroundImage:
                                                                      NetworkImage(snapshot
                                                                          .data
                                                                          .docs[index]['img']),
                                                                  radius: 20,
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                WidgetHelper.text(
                                                                    snapshot
                                                                            .data
                                                                            .docs[index]['users'][
                                                                                0]
                                                                            .toString() +
                                                                        "  Requested for Message",
                                                                    15,
                                                                    Colors
                                                                        .black),
                                                                SizedBox(
                                                                  width: 20,
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    List
                                                                        namelist =
                                                                        [
                                                                      snapshot
                                                                          .data
                                                                          .docs[index]['name']
                                                                    ];
                                                                    FirebaseFirestore
                                                                        .instance
                                                                        .collection(
                                                                            "users")
                                                                        .doc(snapshot.data.docs[index]
                                                                            [
                                                                            'uid'])
                                                                        .update({
                                                                      "friends":
                                                                          FieldValue.arrayUnion(
                                                                              namelist)
                                                                    });

                                                                    String
                                                                        chatid;
                                                                    String
                                                                        userid;
                                                                    print(
                                                                        "HLo");

                                                                    userid = MeetUp
                                                                            .prefs
                                                                            .getString("uid") ??
                                                                        "";
                                                                        print(MeetUp.prefs.getString("uid"));
                                                                        print(snapshot.data.docs[index]['uid']);
                                                                        print("USERID"+userid.hashCode.toString());
                                                                        print("XID"+snapshot
                                                                            .data
                                                                            .docs[index]['uid']
                                                                            .hashCode.toString());
                                                                    if (userid
                                                                            .hashCode <=
                                                                        snapshot
                                                                            .data
                                                                            .docs[index]['uid']
                                                                            .hashCode) {
                                                                      chatid = MeetUp
                                                                              .prefs
                                                                              .getString(
                                                                                  "name")
                                                                              .toLowerCase() +
                                                                          "_" +
                                                                          snapshot
                                                                              .data
                                                                              .docs[index]['name']
                                                                              .toString()
                                                                              .toLowerCase();
                                                                    } else {
                                                                      chatid = snapshot
                                                                              .data
                                                                              .docs[index][
                                                                                  'name']
                                                                              .toString()
                                                                              .toLowerCase() +
                                                                          "_" +
                                                                          MeetUp
                                                                              .prefs
                                                                              .getString("name")
                                                                              .toLowerCase();
                                                                    }
                                                                    FirebaseFirestore
                                                                        .instance
                                                                        .collection(
                                                                            "chats")
                                                                        .doc(
                                                                            chatid)
                                                                        .update({
                                                                      "status":
                                                                          "Accepted"
                                                                    });
                                                                    print(
                                                                        chatid);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    child: Center(
                                                                        child: WidgetHelper.text(
                                                                            'Accept',
                                                                            12,
                                                                            Colors.black)),
                                                                    height: 30,
                                                                    width: 90,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.circular(5)),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 8,
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        CircleAvatar(
                                                                  radius: 15,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .red,
                                                                  child: Center(
                                                                    child: Icon(
                                                                      Icons
                                                                          .delete_forever,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                )),
                                                              ],
                                                            ),
                                                            height: 70,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  });
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            // image: DecorationImage(
                            //     image: NetworkImage(
                            //         "https://images.pexels.com/photos/963436/pexels-photo-963436.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
                            //     fit: BoxFit.fitWidth,
                            //     colorFilter:
                            //         ColorFilter.mode(Colors.black, BlendMode.colorDodge)),
                            color: Colors.transparent,
                          ),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                WidgetHelper.text(
                                    "Profile Settings", 20, Colors.white),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(width: 20,),
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Colors.white),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: Container(
                                                  height: 130,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .circular(15),
                                                      color: Colors.white,
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              MeetUp
                                                                  .prefs
                                                                  .getString(
                                                                      "img")),
                                                          fit: BoxFit.cover)),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Container(
                                                  height: 130,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child:
                                                            WidgetHelper.text(
                                                                MeetUp.prefs
                                                                    .getString(
                                                                        "name"),
                                                                15,
                                                                Colors.black),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child:
                                                            WidgetHelper.text(
                                                                MeetUp.prefs
                                                                    .getString(
                                                                        "uid"),
                                                                15,
                                                                Colors.black),
                                                      )
                                                    ],
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    // color: Colors.white
                                                  )),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    height: MediaQuery.of(context).size.height -
                                        180,
                                    decoration:
                                        BoxDecoration(color: Colors.white30))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]))));
  }
}
