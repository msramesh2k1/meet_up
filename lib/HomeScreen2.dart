// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:meetup/Helper/userdetails.dart';
// import 'package:meetup/Widgets/widgethelper.dart';
// import 'package:tcard/tcard.dart';


// class HomeScreen2 extends StatefulWidget {
//   @override
//   _HomeScreen2State createState() => _HomeScreen2State();
// }

// class _HomeScreen2State extends State<HomeScreen2> {
//   TCardController _controller = TCardController();
 
  
//   List<String> images = [];
  
// setuser() {


//       FirebaseFirestore.instance.collection("users")
//       .get()
//       .then((value) {
//         value.docs.forEach((element) {
        
//           setState(() {
//             images.add(element.data()['image']);
//             // images.add(element.data()['image']);
//           });
//         });
//       });
//       return null;
//     }
//   @override
//   void initState() {
 
//     // TODO: implement initState

//     super.initState();
    
//     setuser();
  
//   }

//   @override
//   Widget build(BuildContext context) {
 
//  List<Widget> cards = [];
    
//     // _controller.reset();
//     if(images.length == 0)
//     {
      
      
      
//       print(images.length);
//       print("ks");
     
//     }else{
//        images.forEach((element) {
//      cards.add(
       
//        Container(
//   // child: WidgetHelper.text(images[index],10, Colors.green),
//       decoration: BoxDecoration(
//   // image: DecorationImage(image: NetworkImage(images[index])),
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(16.0),
//             boxShadow: [
//               BoxShadow(
//                 offset: Offset(0, 17),
//                 blurRadius: 23.0,
//                 spreadRadius: -13.0,
//                 color: Colors.black54,
//               )
//             ],
//           ),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(16.0),
//             child: Image.network(
//               element,
//               fit: BoxFit.cover,
//             ),
//           ),
//         )

    
//      );
//     });

//     }
  
   

   
//     return Scaffold(
//       body: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             images.length == 0 ? CircularProgressIndicator():
//             TCard(
//               delaySlideFor: 100,
//               cards: 
          
//                        cards,
//               size: Size(360, 480),
//               controller: _controller,
//               onForward: (index, info) {
//                 print(index);
//               },
//               onBack: (index, info) {
//                 print(index);
//               },
//               onEnd: () {
//                 print('end');
//               },
//             ),
//             SizedBox(
//               height: 40,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 OutlineButton(
//                   onPressed: () {
//                     print(_controller);
//                     _controller.back();
//                   },
//                   child: Text('Back'),
//                 ),
//                 OutlineButton(
//                   onPressed: () {
//                     _controller.reset();
//                   },
//                   child: Text('Reset'),
//                 ),
//                 OutlineButton(
//                   onPressed: () {
//                     _controller.forward();
//                   },
//                   child: Text('Forward'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
