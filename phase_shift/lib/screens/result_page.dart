import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodybite_app/screens/event_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

final _firestore = FirebaseFirestore.instance;

class ResultPage extends StatefulWidget {
  static String id = 'result_screen';

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) => LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.center,
        colors: [Colors.black, Colors.transparent],
      ).createShader(rect),
      blendMode: BlendMode.colorDodge,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
            image: AssetImage(
              'assets/images/reg.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
            backgroundColor: Colors.black12.withOpacity(0.4),
            title: const Text('PHASE SHIFT'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 10,
                width: 100, // constrain height
                child: ListView(
                  shrinkWrap: true,
                  // scrollDirection: Axis.horizontal,
                  scrollDirection: Axis.vertical,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.all(10),
                child: Text(
                  "Results",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              ResultsStream(),
            ],
          ),
        ),
      ),
    );
  }
}
class ResultsStream extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection("Result").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final results = snapshot.data.docs;
          List<ListResults> resultsWidgets = [];
          for (var result in results) {
            final rEvent = result['eventname'];
            final rDept = result['department'];
            final rWinner = result['winner'];

            resultsWidgets.add(
                ListResults(
                  dept: rDept,
                  event: rEvent,
                  winner: rWinner,
                ),
            );
          }
          return Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              children: resultsWidgets,
            ),
          );
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

class ListResults extends StatelessWidget {
  ListResults({this.dept, this.event, this.winner});

  String event;
  String dept;
  String winner;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(6.0),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 6.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          height: 180.0,
          child: Column(
            children: [
              ListTile(
                leading: Icon(
                  Icons.event,
                  color: Colors.blueAccent.shade200,
                  size: 30.0,
                ),
                title: Text(
                  event,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade400,
                    fontSize: 30.0,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  FontAwesomeIcons.graduationCap,
                  size: 20,
                  color: Colors.green.shade400,
                ),
                title: Text(
                  dept,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.brown.shade300,
                    fontSize: 22.0,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  FontAwesomeIcons.trophy,
                  size: 20,
                  color: Colors.green.shade400,
                ),
                title: Text(
                  winner,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.brown.shade300,
                    fontSize: 22.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

