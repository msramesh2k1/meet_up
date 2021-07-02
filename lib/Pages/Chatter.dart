import 'package:flutter/material.dart';
import 'package:meetup/Helper/helper.dart';

class chatScreen extends StatefulWidget {
   final Map query;
  final String receivername;
  final String receiverimage;
  final String receiveruid;

  const chatScreen({ key, this.query, this.receivername, this.receiverimage, this.receiveruid }) : super(key: key);

  @override
  _chatScreenState createState() => _chatScreenState();
}

class _chatScreenState extends State<chatScreen> {

  @override
  void initState(){
    super.initState();
    print("TESTING CHAT SCREEN");
    print("MAP"+widget.query.toString());
    print("UID"+widget.receiveruid);
    print("NAME"+widget.receivername);
    print("IMG"+widget.receiverimage);
    print("MY"+MeetUp.prefs.getString("name"));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}