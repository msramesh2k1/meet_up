// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_swipable/flutter_swipable.dart';
// import 'package:meetup/Widgets/widgethelper.dart';

// // Link to DB
// final List data = [
//   {
//     'color': Colors.red,
//   },
//   {
//     'color': Colors.green,
//   },
//   {
//     'color': Colors.blue,
//   }
// ];

// class Tinder extends StatefulWidget {
//   @override
//   _TinderState createState() => _TinderState();
// }

// class _TinderState extends State<Tinder> {
//   List<Card> cards = [];
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     setState(() {
//       FirebaseFirestore.instance.collection("users").get().then((value) {
//         value.docs.forEach((element) {
//           cards.add(Card(Colors.red, element.data()['image']));
//         });
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Stack of cards that can be swiped. Set width, height, etc here.
//     return Container(
//       width: MediaQuery.of(context).size.width * 0.9,
//       height: MediaQuery.of(context).size.height * 0.7,
//       // Important to keep as a stack to have overlay of cards.
//       child: Stack(
//         children: cards,
//       ),
//     );
//   }
// }

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
        
//         child: Center(
//           child: Column(
//             children: [WidgetHelper.text("jslh", 25, Colors.white)],
//           ),
//         ),
//         decoration: BoxDecoration(
//           image: DecorationImage(image: NetworkImage(imgurl)),
//           borderRadius: BorderRadius.circular(1.0),
//           color: color,
//         ),
//       ),
//     );
//   }
// }
