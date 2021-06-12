import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meetup/Helper/Colors.dart';
import 'package:tcard/tcard.dart';
import 'package:animated_icon_button/animated_icon_button.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TCardController _controller = TCardController();
  List<String> images = [];
  setuser() {
    FirebaseFirestore.instance.collection("users").get().then((value) {
      value.docs.forEach((element) {
        setState(() {
          images.add(element.data()['image']);
        });
      });
    });
    return null;
  }

  @override
  void initState() {
    super.initState();
    setuser();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> cards = [];

    images.forEach((element) {
      cards.add(Container(
        decoration: BoxDecoration(
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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.network(
            element,
            fit: BoxFit.cover,
          ),
        ),
      ));
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgcolor,
        title: Row(
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
                  IconButton(
                      icon: Icon(
                        Icons.whatshot,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(
                        Icons.auto_awesome,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(
                        Icons.send_rounded,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                        IconButton(
                      icon: Icon(
                        Icons.group,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      onPressed: () {})
                ],
              ),automaticallyImplyLeading: false,),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: bgcolor,
        child: PageView(
          children: [
             Column(
            children: [
             
              SizedBox(height: 20,),
              Container(
                // color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    images.length == 0
                        ? CircularProgressIndicator()
                        : TCard(
                            delaySlideFor: 100,
                            cards: cards,
                            size: Size(MediaQuery.of(context).size.width,
                             MediaQuery.of(context).size.height - 200),
                            controller: _controller,
                            onForward: (index, info) {
                              print(index);
                            },
                            onBack: (index, info) {
                              print(index);
                            },
                            onEnd: () {
                              print('end');
                            },
                          ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left:20.0,right: 20,bottom: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
  color: Colors.white12,
                    ),
                    height: 100,
                  
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(height: 28, width: 45, child: LottieBuilder.network(
                            // "https://assets9.lottiefiles.com/packages/lf20_SyT0Zf.json"
                            // "https://assets9.lottiefiles.com/packages/lf20_lg0nwjau.json"
                            "https://assets9.lottiefiles.com/packages/lf20_0qndevzx.json")),
                        Container(height: 35, width:45, child: LottieBuilder.network(
                            // "https://assets9.lottiefiles.com/packages/lf20_SyT0Zf.json"
                            // "https://assets9.lottiefiles.com/packages/lf20_lg0nwjau.json"
                            "https://assets6.lottiefiles.com/packages/lf20_i0zh5psb.json")),
                        Container(height: 30, width: 45, child: LottieBuilder.network(
                            // "https://assets9.lottiefiles.com/packages/lf20_SyT0Zf.json"
                            // "https://assets9.lottiefiles.com/packages/lf20_lg0nwjau.json"
                            "https://assets4.lottiefiles.com/packages/lf20_bQy33T.json")),
                        Container(height: 60, width: 45, child: LottieBuilder.network(
                            // "https://assets9.lottiefiles.com/packages/lf20_SyT0Zf.json"
                            // "https://assets9.lottiefiles.com/packages/lf20_lg0nwjau.json"
                            "https://assets1.lottiefiles.com/packages/lf20_sCS0pB.json")),
                        Container(
                            height: 60,
                            width: 45,
                            child: LottieBuilder.network(
                                "https://assets7.lottiefiles.com/private_files/lf30_7wnpoppl.json")),

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


          ],
                ),
      ),
    );
  }
 
}
