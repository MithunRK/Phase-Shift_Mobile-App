import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodybite_app/screens/event_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';



final _firestore = FirebaseFirestore.instance;
User lUser;
num c;
Map<String, int> map= {'abc': 0};

void getCount(String eName){
  map.forEach((key, value) {
    if(eName==key) {
      // print(value);
      c=value;
    }
  });
}


class DepartmentPage extends StatefulWidget {
  static String id = 'department_screen';

  DepartmentPage({@required this.dept, this.deptName});
  String dept;
  String deptName;


  @override
  State<DepartmentPage> createState() => _DepartmentPageState();
}

class _DepartmentPageState extends State<DepartmentPage> {
  final _auth = FirebaseAuth.instance;
  bool isAdmin = false;

  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        lUser = user;
        print(lUser.email);
        if(lUser.email == 'admin@gmail.com'){
          isAdmin = true;
        }
      }
    } catch (e) {
      print(e);
    }
  }

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
                  widget.deptName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Text(
                  '***** Events Hosted by Our department are *****',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              EventsStream(dept: widget.dept),
            ],
          ),
        ),
      ),
    );
  }
}

class EventsStream extends StatelessWidget {

  EventsStream({@required this.dept});
  String dept;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection(dept).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final events = snapshot.data.docs;
          List<ListEvent> messagesWidgets = [];
          for (var event in events) {
            final eventName = event['EventName'];
            final eventDis = event['Description'];
            final eventAbs = event['Abstraction'];
            final eventCod = event['Co-ordinator'];
            final eventDate = event['Date'];
            final eventVenue = event['Venue'];
            final eventContact = event['Contact'];
            final eventResult = event['Result'];
            final eCount = event['Count'];

            map[eventName] = int.parse(eCount);
            //print(map);

            if (eventResult != "T"){
              messagesWidgets.add(
                ListEvent(
                  name: eventName,
                  dis: eventDis,
                  abs: eventAbs,
                  cod: eventCod,
                  date: eventDate,
                  venue: eventVenue,
                  contact: eventContact,
                  dept: dept,
                ),
              );
            }
          }
          return Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              children: messagesWidgets,
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

class ListEvent extends StatelessWidget {
  ListEvent(
      {this.name,
        this.dis,
        this.abs,
        this.cod,
        this.contact,
        this.date,
        this.venue,
        this.dept,});

  String name;
  String dis;
  String abs;
  String cod;
  String contact;
  String date;
  String venue;
  String dept;


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(3.0),
        child: Material(
          color: Colors.grey.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            color: Colors.transparent,
            margin: EdgeInsets.all(12.0),
            child: ExpansionTile(
              initiallyExpanded: false,
              childrenPadding: EdgeInsets.all(12.0),
              trailing: Icon(
                FontAwesomeIcons.eye,
                color: Colors.black,
              ),
              backgroundColor: Colors.transparent,
              title: Text(
                name,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Text(
                  dis,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Material(
                    elevation: 5.0,
                    color: Colors.blue.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(15.0),
                    child: MaterialButton(
                      onPressed: () {
                        getCount(name);
                        if(c >= 2){
                          Alert(
                            context: context,
                            type: AlertType.error,
                            title: "Registration Full",
                            desc: "Sorry, registration for this event is closed :(",
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "OK",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () => Navigator.pop(context),
                                width: 120,
                              )
                            ],
                          ).show();
                        }
                        else{
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EventPage(
                                name: name,
                                abs: abs,
                                cod: cod,
                                contact: contact,
                                date: date,
                                venue: venue,
                                dept: dept,
                              ),
                            ),
                          );
                        }
                      },
                      minWidth: 80.0,
                      height: 42.0,
                      child: Text(
                        "View",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
