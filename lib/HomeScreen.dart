import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:lottie/lottie.dart';
import 'package:meetup/Helper/Colors.dart';
import 'package:meetup/swipe.dart';
import 'package:provider/provider.dart';

import 'Widgets/widgethelper.dart';

class HomeScreen extends StatefulWidget {
  final List interestlist;
  const HomeScreen({key, this.interestlist}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{
 



 
 
 
List<Card> cards = [];
  List<dynamic> imgurl = [];
  List<String> username = [];
  String name = "";
  


  @override
  Widget build(BuildContext context) {
     CardController controller; 
     
    
    return Scaffold(
      backgroundColor: bgcolor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          Column(
            children: [
              SizedBox(
                width: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: Lottie.network(

                        //  "https://assets3.lottiefiles.com/packages/lf20_hiwnf0xp.json"
                        "https://assets3.lottiefiles.com/packages/lf20_PAugdq.json"),
                  ),
                  Center(
                      child: WidgetHelper.text("Meet-Up", 28, Colors.white70)),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                // color: Colors.white,
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.interestlist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.all(5),
                        child: CircleAvatar(
                          radius: 30,
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  name = widget.interestlist[index];
                                });
                              },
                              child: CircleAvatar(
                                  radius: 50,
                                  child: WidgetHelper.text(
                                      widget.interestlist[index],
                                      18,
                                      Colors.white),
                                  backgroundColor: Colors.transparent),
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(colors: [
                                kPrimaryColor.withOpacity(0.6),
                                kbgPrimaryColor.withOpacity(0.6)
                              ]),
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              WidgetHelper.text(name, 20, Colors.white),
            ],
          ),
          SizedBox(
            height: 23,
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection("users").snapshots(),
            builder: (context,snapshots){
              if (snapshots.connectionState == ConnectionState.waiting){
                return CircularProgressIndicator(backgroundColor: Colors.red,);
              }
            return  Container(
            child: Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.7,
              child: TinderSwapCard(
                  swipeUp: true,
                  swipeDown: true,
                  orientation: AmassOrientation.BOTTOM,
                  totalNum: snapshots.data.docs.length,
                  stackNum: 3,
                  swipeEdge: 4.0,
                  maxWidth: MediaQuery.of(context).size.width * 0.9,
                  maxHeight: MediaQuery.of(context).size.width *0.9,
                  minWidth: MediaQuery.of(context).size.width * 0.8,
                  minHeight: MediaQuery.of(context).size.width * 0.8,
                  cardBuilder: (context, index) => Card(  
                               child: Image.network('${snapshots.data.docs[index]["image"]}',fit: BoxFit.cover,),
                      ),
                  cardController: controller = CardController(),
                  swipeUpdateCallback:
                      (DragUpdateDetails details, Alignment align) {
                    /// Get swiping card's alignment
                    if (align.x < 0) {
                      //Card is LEFT swiping
                    } else if (align.x > 0) {
                      //Card is RIGHT swiping
                    }
                  },
                  swipeCompleteCallback:
                      (CardSwipeOrientation orientation, int index) {
                    /// Get orientation & index of swiped card!
                  },
              ),
          ),
            decoration: BoxDecoration(
                color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
            width: MediaQuery.of(context).size.width - 30,
            height: MediaQuery.of(context).size.height - 300,
          );}
          )
            
          
        ],
      ),
    );
  }
}

// class Card extends StatelessWidget {
//   // Made to distinguish cards
//   // Add your own applicable data here
//   final Color color;
//   final String imgurl;
//   Card(this.color, this.imgurl);
//   @override
//   Widget build(BuildContext context) {
//     return Swipable(
//       child: Container(
//         decoration: BoxDecoration(
//           image:
//               DecorationImage(image: NetworkImage(imgurl), fit: BoxFit.cover),
//           borderRadius: BorderRadius.circular(1.0),
//           color: color,
//         ),
//         child: Center(
//           child: Column(
//             children: [WidgetHelper.text("jslh", 25, Colors.white)],
//           ),
//         ),
//       ),
//     );
//   }
// }
