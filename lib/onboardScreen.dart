import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meetup/Helper/Colors.dart';
import 'package:meetup/Widgets/widgethelper.dart';
import 'package:meetup/chatScreen.dart';
import 'package:tcard/tcard.dart';
import 'package:animated_icon_button/animated_icon_button.dart';

import 'ChatRoom.dart';

class Home extends StatefulWidget {

  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String id;
  int counter=0;
  String idname;
  String idurl;
  var details = {};
  TCardController _controller = TCardController();
  List<String> images = [];
  List<String> names = [];
  bool liked = false;
  setuser() {
    FirebaseFirestore.instance.collection("users").get().then((value) {
      setState(() {

            id = value.docs[0]['uid'];
            idname = value.docs[0]['name'];
            idurl = value.docs[0]['image'];
            });
      value.docs.forEach((element) {
        setState(() {
          
          details.addAll({element.data()['name']: element.data()['image']});
          images.add(element.data()['image']);
          names.add(element.data()['name']);
        });
      });
    });
    print(names);
    return null;
  }

  @override
  void initState() {
    super.initState();
    setuser();

  }

  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    List<Widget> cards = [];
    print(details);
  

// print(names);
// details.forEach((key, value) {

// });
    images.forEach((element) {
      cards.add(StreamBuilder(
          stream: FirebaseFirestore.instance.collection("users").snapshots(),
          builder: (context, snapshots) {
            return Container(
              alignment: Alignment.bottomLeft,

              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(element), fit: BoxFit.cover),
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 17),
                    blurRadius: 23.0,
                    spreadRadius: -13.0,
                    color: Colors.black54,
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(colors: [Colors.white54,Colors.transparent],begin: Alignment.centerLeft,end: Alignment.centerRight)
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 10,),
                            WidgetHelper.text(
                                snapshots.data.docs[images.indexOf(element)]['name'],
                                25,
                                Colors.white),
                          ],
                        ),
                    ),
                    ],
                    ),
                  SizedBox(height: 10,),
                  Row(
                      children: [
                        SizedBox(width: 10,)
,                        Container(
                             height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(colors: [Colors.white54,Colors.transparent],begin: Alignment.centerLeft,end: Alignment.centerRight)
                            ),
                          child: Row(
                          children: [
                            SizedBox(width: 10,),

                            WidgetHelper.text(
                                snapshots.data.docs[images.indexOf(element)]['interest'].toString().replaceAll("[","").replaceAll("]",""),
                                25,
                                Colors.white),
                          ],
                  ),
                        ),
                      ],
                    ),
                  SizedBox(height: 10,),
                       Row(
                         children: [
                           SizedBox(width: 10,),
                           Container(
                                height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(colors: [Colors.white54,Colors.transparent],begin: Alignment.centerLeft,end: Alignment.centerRight)
                            ),
                             child: Row(
                    children: [
                      SizedBox(width: 10,),
                      Icon(Icons.location_on,color: Colors.white,),
                      WidgetHelper.text(
                                snapshots.data.docs[images.indexOf(element)]['area'],
                                25,
                                Colors.white),
                    ],
                  ),
                           ),
                         ],
                       ),
                  SizedBox(height: 10,)
                  // WidgetHelper.text(snapshots.data.docs[images.indexOf(element)]['interest'].toString(),20, Colors.white)
                ],
              ),
              // child: ClipRRect(
              //   borderRadius: BorderRadius.circular(16.0),
              //   child: Image.network(

              //     element,

              //     fit: BoxFit.cover,
              //   ),
              // ),
            );
          }));
    });
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 60,
        elevation: 0,
        backgroundColor: bgcolor,
        title: Column(
          children: [
            SizedBox(
              height: 26,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //         AnimatedIconButton(
                // size: 100,
                //   onPressed: () {},
                //   duration: const Duration(milliseconds: 500),
                //   splashColor: Colors.transparent,
                //   icons: const <AnimatedIconItem>[
                //     AnimatedIconItem(
                //       icon: Icon(Icons.whatshot, color: Colors.white,size: 20,),
                //     ),
                //     AnimatedIconItem(
                //       icon: Icon(Icons.whatshot_outlined,color: Colors.red,size: 20,),
                //     ),
                //   ],
                // ),
                //
                Container(
                  // decoration: BoxDecoration(
                  //   color: Colors.white12,
                  //   borderRadius: BorderRadius.circular(20)
                  // ),
                  child: IconButton(
                      icon: Icon(
                        Icons.whatshot,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        controller.jumpToPage(0);
                      }),
                ),
                IconButton(
                    icon: Icon(
                      Icons.auto_awesome,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      controller.jumpToPage(2);
                    }),
                liked
                    ? Container(
                        height: 50,
                        width: 50,
                        child: Lottie.network(
                            "https://assets2.lottiefiles.com/datafiles/nZgj7wTd56UtH6m/data.json"))
                    : SizedBox(),
                IconButton(
                    icon: Icon(
                      Icons.send_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      controller.jumpToPage(3);
                    }),

                IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      controller.jumpToPage(5);
                    })
              ],
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: bgcolor,
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Stack(children: [
                  Container(
                    // color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        images.length == 0
                            ? CircularProgressIndicator()
                            : TCard(
                                onForward: (index, info) {
                                  setState(() {






                                  });
                                  print(index);
                                  print(info.direction);
                                  if (info.direction == SwipDirection.Right) {
                                    setState(() {
                                                                          counter = index;
                                                                        });
                                  //  Future<QuerySnapshot> query = FirebaseFirestore.instance.collection("users").get();
                                  //  print(query.then((value) => 
                                  //  print("HLO"+value.docs[index--]['name'])
                                  //  ));

                                    print('like');
                                  } else {
                                    print('dislike');
                                  }
                                },
                                onBack: (index, info) {
                                  print(index);
                                },
                                onEnd: () {
                                  print('end');
                                },
                                delaySlideFor: 500,
                                // slideSpeed: 0.2,
                                cards: cards,
                                size: Size(MediaQuery.of(context).size.width,
                                    MediaQuery.of(context).size.height - 200),
                                controller: _controller,
                                // onForward: (index, info) {
                                //   print(index);
                                // },
                                // onBack: (index, info) {
                                //   print(index);
                                // },
                                // onEnd: () {
                                //   print('end');
                                // },
                              ),
                      ],
                    ),
                  ),
                ]),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20, bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white12,
                      ),
                      height: 100,
                      child: Row(
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
                                    "https://assets9.lottiefiles.com/packages/lf20_0qndevzx.json")),
                          ),
                          GestureDetector(
                            onTap: () {
                              _controller.back();
                            },
                            child: Container(
                                height: 35,
                                width: 45,
                                child: LottieBuilder.network(
                                    // "https://assets9.lottiefiles.com/packages/lf20_SyT0Zf.json"
                                    // "https://assets9.lottiefiles.com/packages/lf20_lg0nwjau.json"
                                    "https://assets6.lottiefiles.com/packages/lf20_i0zh5psb.json")),
                          ),
                          Container(height: 30, width: 45, child: LottieBuilder.network(
                              // "https://assets9.lottiefiles.com/packages/lf20_SyT0Zf.json"
                              // "https://assets9.lottiefiles.com/packages/lf20_lg0nwjau.json"
                              "https://assets4.lottiefiles.com/packages/lf20_bQy33T.json")),
                          GestureDetector(
                            onTap: () {
                              print("Liked");
                              _controller.forward();
                              setState(() {
                                liked = true;
                              });
                              Timer(Duration(milliseconds: 500), () {
                                setState(() {
                                  liked = false;
                                });
                              });
                            },
                            child: Container(
                                height: 60,
                                width: 45,
                                child: LottieBuilder.network(
                                    // "https://assets9.lottiefiles.com/packages/lf20_SyT0Zf.json"
                                    // "https://assets9.lottiefiles.com/packages/lf20_lg0nwjau.json"
                                    "https://assets1.lottiefiles.com/packages/lf20_sCS0pB.json")),
                          ),
                          GestureDetector(
                            onTap: (){
                                                            Navigator.push(context, MaterialPageRoute(builder: (b)
                                                            =>
                                                         chat(
                              //                                 receivername: idname,
                                                             
                               
                              //  counter: counter,
                              //   query: FirebaseFirestore.instance.collection("users").get(),


                              ) ));
                            },
                            child: Container(
                                height: 60,
                                width: 45,
                                child: LottieBuilder.network(
                                    "https://assets7.lottiefiles.com/private_files/lf30_7wnpoppl.json")),
                          ),

                          // OutlineButton(
                          //   onPressed: () {
                          //     print(_controller);
                          //     _controller.back();
                          //   },
                          //   child: Text('Back'),
                          // ),
                          // OutlineButton(
                          //   onPressed: () {
                          //     _controller.reset();
                          //   },
                          //   child: Text('Reset'),
                          // ),
                          // OutlineButton(
                          //   onPressed: () {
                          //     _controller.forward();
                          //   },
                          //   child: Text('Forward'),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            shineing()
          ],
        ),
      ),
    );
  }

  Widget shineing() {
    return Container(
      color: Colors.white,
      height: 500,
    );
  }
}
