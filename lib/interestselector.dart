import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meetup/Helper/Colors.dart';
import 'package:meetup/Helper/helper.dart';
import 'package:meetup/HomeScreen.dart';
import 'package:meetup/Widgets/widgethelper.dart';
import 'package:meetup/onboardScreen.dart';
import 'package:meetup/subinterestselector.dart';

import 'HomeScreen2.dart';



class interest extends StatefulWidget {
  const interest({key}) : super(key: key);

  @override
  _interestState createState() => _interestState();
}

class _interestState extends State<interest> {
  List<String> userinterest =[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     print(MeetUp.prefs.getStringList("interest"));
    print(userinterest);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: bgcolor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
         Padding(
           padding: const EdgeInsets.only(left: 20,bottom: 25),
           child: WidgetHelper.text("Choose Your Interest ...", 18,Colors.white),
         ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height -90,
            child: Stack(
              children: [
                    Positioned(
                   left: 150,
                   top: 200,
                   child: CircleAvatar(
                   
                     
        radius: 60,
        child: Container(
       child: GestureDetector(
         onTap: (){
           setState(() {
         
              userinterest.contains("Anime") ? userinterest.remove("Anime") :
         
             userinterest.add("Anime");
       
           });
          
         },
         child: CircleAvatar(
           
           radius: 60,
                    child: WidgetHelper.text("Anime", 20, Colors.white),
                    backgroundColor: userinterest.contains("Anime") ? Colors.white54 :
                    Colors.transparent
                ),
       ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                kPrimaryColor.withOpacity(0.6),kbgPrimaryColor.withOpacity(0.6)]
            ),
          ),
        ),
      ),
                 ),
                 Positioned(
                   left: 200,
                   child: CircleAvatar(
        radius: 50,
        child: Container(
    child:      GestureDetector(
       onTap: (){
           setState(() {
              userinterest.contains("Books") ? userinterest.remove("Books") :
         
             userinterest.add("Books");
       
           });
          
         },
      child: CircleAvatar(
           radius: 50,
                    child: WidgetHelper.text("Books", 20, Colors.white),
                    backgroundColor:userinterest.contains("Books") ? Colors.white54 :
                      Colors.transparent
                ),
    ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                kPrimaryColor.withOpacity(0.6),kbgPrimaryColor.withOpacity(0.6)]
            ),
          ),
        ),
      ),
                 ),
                     Positioned(
                   left: 300,
                   top: 100,
                  
                   child: CircleAvatar(
        radius: 50,
        child: Container(
          child: GestureDetector(
             onTap: (){
           setState(() {
              userinterest.contains("Foods") ? userinterest.remove("Foods") :
         
             userinterest.add("Foods");
       
           });
          
         },
            child: CircleAvatar(
                   radius: 50,
                    child: WidgetHelper.text("Foods", 20, Colors.white),
                    backgroundColor: userinterest.contains("Foods") ? Colors.white54 :
                      Colors.transparent
                ),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                kPrimaryColor.withOpacity(0.6),kbgPrimaryColor.withOpacity(0.6)]
            ),
          ),
        ),
      ),
                 ),
 Positioned(
                   left: 240,
                   top: 370,
                  
                   child:CircleAvatar(
        radius: 90,
        child: Container(
          child: GestureDetector(
             onTap: (){
           setState(() {
              userinterest.contains("Movies") ? userinterest.remove("Movies") :
         
             userinterest.add("Movies");
       
           });
          
         },
            child: CircleAvatar(
                   radius: 90,
                    child: WidgetHelper.text("Movies", 20, Colors.white),
                    backgroundColor:userinterest.contains("Movies") ? Colors.white54 :
                      Colors.transparent
                ),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  
              colors: [
                
                kPrimaryColor.withOpacity(0.6),kbgPrimaryColor.withOpacity(0.6)]
            ),
          ),
        ),
      ),
                 ),

                 Positioned(
                   left: 20,
                   top: 340,
                  
                   child: CircleAvatar(
        radius: 60,
        child: Container(
        child:  GestureDetector(
           onTap: (){
           setState(() {
              userinterest.contains("Travel") ? userinterest.remove("Travel") :
         
             userinterest.add("Travel");
       
           });
          
         },
          child: CircleAvatar(
           radius: 60,
                    child: WidgetHelper.text("Travel", 20, Colors.white),
                    backgroundColor: userinterest.contains("Travel") ? Colors.white54 :
                      Colors.transparent
                ),
        ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
              colors: [
                kPrimaryColor.withOpacity(0.6),kbgPrimaryColor.withOpacity(0.6)]
            ),
          ),
        ),
      ),
                 ),
                  Positioned(
                   left: 20,
                   top: 540,
                  
                   child: CircleAvatar(
        radius: 100,
        child: Container(
          child: GestureDetector(
             onTap: (){
           setState(() {
              userinterest.contains("Music") ? userinterest.remove("Music") :
         
             userinterest.add("Music");
       
           });
          
         },
            child: CircleAvatar(
                   radius: 100,
                    child: WidgetHelper.text("Music", 20, Colors.white),
                    backgroundColor:userinterest.contains("Music") ? Colors.white54 :
                      Colors.transparent
                ),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                  begin: Alignment.topCenter,
              colors: [
                kPrimaryColor.withOpacity(0.6),kbgPrimaryColor.withOpacity(0.6)]
            ),
          ),
        ),
      ),
                 ),
                  Positioned(
                   left: 290,
                   top: 670,                  
                   child: GestureDetector(
                     onTap: (){  
                      //  print(userinterest);
                      Navigator.push(context,MaterialPageRoute(builder: (b)=>Home(
                        // interestlist: userinterest,
                       
                        
                        )));
                        MeetUp.prefs.setStringList("interest",userinterest);
                       
                      //  MeetUp.prefs.getStringList("interest");
                     },
                     child: CircleAvatar(
                       child: Icon(Icons.arrow_forward_ios,color: Colors.black,),
                      radius: 45,
                      backgroundColor: Colors.white,
                                   ),
                   ),
                 ),

                  Padding(
           padding: const EdgeInsets.all(8.0),
           child: Positioned(
           child: CircleAvatar(
        radius: 80,
        child: Container(
          child: GestureDetector(
             onTap: (){
           setState(() {
              userinterest.contains("Sports") ? userinterest.remove("Sports") :
         
             userinterest.add("Sports");
       
           });
          
         },
            child: CircleAvatar(
                   radius: 80,
                    child: WidgetHelper.text("Sports", 20, Colors.white),
                    backgroundColor: userinterest.contains("Sports") ? Colors.white54 :
                      Colors.transparent
                ),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
          kbgPrimaryColor.withOpacity(0.6),    kPrimaryColor.withOpacity(0.6)
                ]
            ),
          ),
        ),
      ),
                 ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

