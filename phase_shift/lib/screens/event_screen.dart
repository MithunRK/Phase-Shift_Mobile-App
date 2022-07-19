import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodybite_app/screens/event_reg_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodybite_app/screens/event_reg_screen.dart';

final _firestore = FirebaseFirestore.instance;
String doc_id;

const dTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 25.0,
  fontWeight: FontWeight.w600,
);

class EventPage extends StatelessWidget {

  EventPage({this.name,this.abs,this.cod,this.contact,this.date,this.venue,this.dept});

  final bool isOpen = false;

  String name;
  String abs;
  String cod;
  String contact;
  String date;
  String venue;
  String dept;


  // void getEvent() async {
  //   await for (var snapshot in _firestore.collection(dept).snapshots()) {
  //     for (var event in snapshot.docs) {
  //       if (d_event == event['EventName']) {
  //         c=(int.parse(event['Count']))+1;
  //         doc_id = event.id.toString();
  //         print(c);
  //         print(cs);
  //         print(doc_id);
  //         break;
  //       }
  //     }
  //   }
  // }

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
            backgroundColor: Colors.black12.withOpacity(0.4),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }),
            ],
            title: Text("PHASE SHIFT"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Material(
                  color: Colors.grey.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    color: Colors.transparent,
                    margin: EdgeInsets.all(12.0),
                    // padding: EdgeInsets.all(8.0),
                    child: ExpansionTile(
                      backgroundColor: Colors.transparent,
                      initiallyExpanded: true,
                      childrenPadding: EdgeInsets.all(12.0),
                      trailing: Icon(
                        FontAwesomeIcons.eye,
                        color: Colors.black,
                      ),
                      title: Text(
                        name,
                        style: TextStyle(
                          color: Color(0xE1FFD4AC),
                          fontSize: 35.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      children: [
                        Text(
                          abs,
                          style: TextStyle(
                              color: Colors.grey.shade200,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Text("Event Co-ordinator : " + cod, style: dTextStyle),
              Text("Contact : " + contact, style: dTextStyle),
              Text(
                "Event Date : " + date,
                style: dTextStyle,
              ),
              Text("Venue : " + venue, style: dTextStyle),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Material(
                  color: Colors.blue.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    margin: EdgeInsets.all(1.0),
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EventRegPage(d_event: name, dept: dept,))),
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            "Register",
                            style: dTextStyle.copyWith(color: Colors.white),
                          ),
                        ),
                        height: 40.0,
                        margin: EdgeInsets.all(12.0),
                      ),
                    ),
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

