import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:meetup/Helper/Colors.dart';
import 'package:meetup/Helper/helper.dart';
import 'package:meetup/interestselector.dart';

import 'HomeScreen.dart';
import 'Widgets/widgethelper.dart';

class subinterest extends StatefulWidget {
  const subinterest({key}) : super(key: key);

  @override
  _subinterestState createState() => _subinterestState();
}

class _subinterestState extends State<subinterest> {

  
  PageController controller = PageController();
   List <String> interestlist = [];
   List <String> subinterestlist = [];


  @override
  void initState() {

    super.initState();
    
    setState(() {
      interestlist = MeetUp.prefs.getStringList("interest");
        interestlist.forEach((element) {
      userint.add( Container(
        height: 100,
        width: 100,
        color: Colors.transparent,
        child: Column(
          children: [
            SizedBox(height: 15,),
            new Center(
              child: WidgetHelper.text(element,20,Colors.white),
            ),
            SizedBox(height: 10,),
            Container(
              height: 300,
              width:  300,
              // color: Colors.white,
              child: StreamBuilder(
                stream: MeetUp.firestore.collection("category").where("category",isEqualTo: element)
                .snapshots(),
                builder: (context,snapshots){
                  if(snapshots.connectionState == ConnectionState.waiting){
                    return Container(
                      height: 20,
                      width: 20,
                      
                      child:CircularProgressIndicator(backgroundColor: Colors.white,));
                  }
                return

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: StaggeredGridView.countBuilder(
  crossAxisCount: 3,
  itemCount: snapshots.data.docs.length,
  itemBuilder: (BuildContext context, int index) => GestureDetector(
    onTap: (){
      setState(() {

         subinterestlist.contains(snapshots.data.docs[index]['name']) ? print("Yes It is There")
: subinterestlist.add(snapshots.data.docs[index]['name']); 
      });
      print(subinterestlist);
     
    },
    child: CircleAvatar(
      backgroundColor: subinterestlist.contains(snapshots.data.docs[index]['name']) 
      ? Colors.white :Colors.white30,
      child: new Center(
        child: WidgetHelper.text(snapshots.data.docs[index]['name'], 14, Colors.white)
      ),
    ),
  ),
  staggeredTileBuilder: (int index) =>
      new StaggeredTile.count(1, index.isEven ? 2 : 1),
  mainAxisSpacing: 5.0,
  crossAxisSpacing: 4.0,
),
                );
                
                
                
                
                
                //  ListView.builder(
                //   itemCount: snapshots.data.docs.length,
                //   itemBuilder: (BuildContext context , int index){
                //   return Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Container(
                //       color: Colors.black,
                //       height: 40,
                //       width: 80,

                //     ),
                //   );
                // });
              }),
            )
          ],
        ),
      ),);
      
    });
  
      
    });   

  }
  

  int curr = 1;

  List<Widget> userint = [
     
    ];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: bgcolor,
      
      appBar: AppBar(
        leadingWidth: 20,
        title:  WidgetHelper.text(
                  "Give More About Your Interest", 18, Colors.white),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: bgcolor,),
      body:  Center(
        
        child: Container(
          color: bgcolor,
          child: Stack(
            children: [
             
               Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                
                gradient: LinearGradient(colors: 
                [kPrimaryColor,kbgPrimaryColor])
              ),
              height: MediaQuery.of(context).size.height - 500,
              width: MediaQuery.of(context).size.width- 100,
                   
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: controller,
                children:
                userint,
             
            onPageChanged: (num){
            setState(() {
              print(num);
              curr=num;
            });
                  },
          
              ),
            ),
             Positioned(
                left: MediaQuery.of(context).size.width / 2,
                top:350,
                child: 
              GestureDetector(
                onTap: (){
                  print("djk");
                  if (curr == MeetUp.prefs.getStringList("interest").length-1){
                 Navigator.push(context, MaterialPageRoute(builder: (b)=> HomeScreen()));
                  }else{
                    controller.jumpToPage(curr+1);
  //  controller.animateToPage(curr+1, duration: Duration(milliseconds: 10),
  //                  curve: Curves.slowMiddle);
                  }
               
  
          },
                child: CircleAvatar(
                  child: Icon(Icons.arrow_forward_ios,color: Colors.black,),
              radius: 40,backgroundColor: Colors.white,
                ),
              )),
            ],
           
          ),
          height: 500,
          ),
      ),
          );
  }
}

// Container(
//         color: bgcolor,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [   
//             Container(
//               height: MediaQuery.of(context).size.height - 95,
//               child: ListView.builder(
//                   itemCount: userinterest.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                        decoration: BoxDecoration(
//                          color: Colors.white12,
//                          borderRadius: BorderRadius.circular(4)
//                        ),
//                         height: 180,
//                         width: 100,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                              Row(
//                                children: [
//                                  Container(
//                                   //  color: Colors.white12,
//                                    child: Padding(
//                                      padding: const EdgeInsets.only(left:8.0),
//                                      child: CircleAvatar
//                                      (
//                                        radius: 40,
//                                        backgroundColor: Colors.white,
//                                        child: WidgetHelper.text(userinterest[index], 18,bgcolor)),
//                                    ),
//                                  ),
//                                  SizedBox(width:1,),
//                                  Expanded(child: 
//                                  Padding(
//                                    padding: const EdgeInsets.all(8.0),
//                                    child: Container(
//                                      child: GridView.builder(
//                                        itemCount: 2,
//                                        gridDelegate: 
//                                        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemBuilder: (BuildContext context , int index){
//                                          return Padding(
//                                            padding: const EdgeInsets.all(8.0),
//                                            child: Container(color: Colors.white,height: 10,width: 100,),
//                                          );
//                                        }),
//                                      height: 163,
//                                      color: Colors.white12,),
//                                  ))
//                                ],
//                              ),
//                           ],
//                         ),
//                       ),
//                     );
//                   }),
//             ),
//             //       Container(

//             //         height: 700,

//             //         child: StreamBuilder<QuerySnapshot>(

//             //           stream: MeetUp.firestore.collection("category").snapshots(),

//             //           builder: (context , snapshots){

//             //                       if (snapshots.hasError) {

//             //                 return Text('Something went wrong');

//             //                 }

//             //               if (snapshots.connectionState == ConnectionState.waiting) {

//             //                 return Text("Loading");

//             //                 }

//             //                             else{

//             // return ListView.builder(

//             //   scrollDirection: Axis.vertical,

//             //             itemCount: snapshots.data.docs.length,

//             //             itemBuilder: (BuildContext context,int index){

//             //             return Padding(

//             //               padding: const EdgeInsets.all(8.0),

//             //               child: Container(height: 10,width: 100,color: Colors.white60,)

//             //             );

//             //           });

//             //                             }

//             //         }),

//             //       )
//           ],
//         ),
//       ),
