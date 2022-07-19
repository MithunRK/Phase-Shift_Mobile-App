import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodybite_app/pallete.dart';

final _firestore = FirebaseFirestore.instance;

class DrawerCard extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  DrawerCard({this.email, this.name, this.sym});

  String email;
  String name;
  String sym;

  void getEvent() async {
    await for (var snapshot
    in _firestore.collection('Eventregister').snapshots()) {
      for (var event in snapshot.docs) {
        print(event.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(name),
            accountEmail: Text(email),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Text(
                sym.toUpperCase(),
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.event),
            title: Text("Event List"),
            onTap: () {
              getEvent();
            },
          ),
          UserEventList(email:email),
          // ListTile(
          //   leading: Icon(Icons.home), title: Text("Home"),
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          // ),
          // ListTile(
          //   leading: Icon(Icons.settings), title: Text("Settings"),
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          // ),
          // ListTile(
          //   leading: Icon(Icons.contacts), title: Text("Contact Us"),
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          // ),
          ListTile(
            leading: Icon(FontAwesomeIcons.poll),
            title: Text("Results"),
            onTap: () {
              if(email == 'admin@gmail.com'){
                Navigator.pushNamed(context, 'AdminResultPage');
              }else{
                Navigator.pushNamed(context, 'ResultPage');
              }
            },
          ),

          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Log out"),
    onTap: () {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Do you really want to exit?",
                style: kBodyText,),
              actions: [
                FlatButton(onPressed: () => {Navigator.pop(context),},
                    child: Text("No", style: kBodyText,)),
                FlatButton(
                  onPressed: () =>
                  {
                    _auth.signOut(),
                    Navigator.pop(context),
                    Navigator.pop(context),
                    Navigator.pop(context),
                  },
                  child: Text("Yes",
                    style: kBodyText,),
                ),
              ],
              elevation: 24.0,
              backgroundColor: Colors.blueAccent.shade200,
            );
          }
      );
    }
          ),
        ],
      ),
    );
  }
}

class UserEventList extends StatelessWidget {
  UserEventList({this.email});
  String email;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('Eventregister').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final events = snapshot.data.docs;
          List<UserEvent> messagesWidgets = [];
          for (var event in events) {
            final m = event['email'];
            if (m == email){
              final eName = event['event'];
              messagesWidgets.add(
                UserEvent(
                  en: eName,
                ),
              );
            }

          }
          return Column(children: [
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              children: messagesWidgets,
            ),
          ]);
        } else {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlue,
            ),
          );
        }
      },
    );
  }
}

class UserEvent extends StatelessWidget {
  UserEvent({this.en});
  String en;

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: Icon(Icons.chevron_right),
      title: Text(en),
      onTap: () {
      },
    );
  }
}

// Padding(
// padding: EdgeInsets.all(10.0),
// child: Column(
// children: [
// Material(
// elevation: 5.0,
// borderRadius: BorderRadius.only(
// topRight:  Radius.circular(0),
// topLeft: Radius.circular(30.0),
// bottomLeft: Radius.circular(30.0),
// bottomRight: Radius.circular(30.0)),
// color: Colors.lightBlueAccent,
// child: Padding(
// padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
// child: Text(
// em,
// style: TextStyle(
// color:Colors.black54,
// fontSize: 15.0,
// ),
// ),
// ),
// ),
// ],
// ),
// );
