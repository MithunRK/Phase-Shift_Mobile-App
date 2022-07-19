import 'package:flutter/material.dart';
import 'package:foodybite_app/pallete.dart';
import 'package:foodybite_app/widgets/rounded-button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodybite_app/screens/Success.dart';

final _firestore = FirebaseFirestore.instance;

class AdminAddPage extends StatefulWidget {

  static String id = 'event_reg';

  AdminAddPage({this.dept,this.deptName});
  String deptName;
  String dept;


  @override
  _AdminAddPageState createState() => _AdminAddPageState();
}

class _AdminAddPageState extends State<AdminAddPage> {
  String Abstraction;
  String Coordinator;
  String Contact;
  String Date;
  String Description;
  String EventName;
  String Venue;
  String res="F";
  String ct="1";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ShaderMask(
      shaderCallback: (rect) => LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.center,
        colors: [Colors.black, Colors.transparent],
      ).createShader(rect),
      blendMode: BlendMode.color,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
            image: AssetImage(
              'assets/images/for.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.black12.withOpacity(0.4),
            centerTitle: true,
            title: Text("PHASE SHIFT"),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        widget.deptName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey[500].withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "EventName",
                              hintStyle: kBodyText,
                            ),
                            style: kBodyText,
                            onChanged: (value) {
                              EventName = value;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey[500].withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Description",
                              hintStyle: kBodyText,
                            ),
                            style: kBodyText,
                            onChanged: (value) {
                              Description = value;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey[500].withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Abstraction",
                              hintStyle: kBodyText,
                            ),
                            style: kBodyText,
                            onChanged: (value) {
                              Abstraction = value;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey[500].withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Co-ordinator",
                              hintStyle: kBodyText,
                            ),
                            style: kBodyText,
                            onChanged: (value) {
                              Coordinator = value;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey[500].withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Contact",
                              hintStyle: kBodyText,
                            ),
                            style: kBodyText,
                            onChanged: (value) {
                              Contact = value;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey[500].withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Date",
                              hintStyle: kBodyText,
                            ),
                            style: kBodyText,
                            onChanged: (value) {
                              Date = value;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey[500].withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Venue",
                              hintStyle: kBodyText,
                            ),
                            style: kBodyText,
                            onChanged: (value) {
                              Venue = value;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey[500].withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: res,
                              hintStyle: kBodyText.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            style: kBodyText,
                            onChanged: (value) {
                              res=value;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey[500].withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: ct,
                              hintStyle: kBodyText.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            style: kBodyText,
                            onChanged: (value) {
                              ct=value;
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    RoundedButton(
                        buttonName: 'Register',
                        onPressed: () {
                          if(EventName == null || Description == null || Abstraction == null || Coordinator == null || Contact == null || Date == null || Venue == null){
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      "All fields are mandatory, please fill!!",
                                      style: kBodyText,
                                    ),
                                    actions: [
                                      FlatButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                          },
                                          child: Text(
                                            "Ok",
                                            style: kBodyText,
                                          )),
                                    ],
                                    elevation: 24.0,
                                    backgroundColor: Colors.blueAccent.shade200,
                                  );
                                });
                          }
                          else{
                            _firestore.collection(widget.dept).add({
                              'EventName': EventName,
                              'Description': Description,
                              'Abstraction': Abstraction,
                              'Co-ordinator': Coordinator,
                              'Contact': Contact,
                              'Date': Date,
                              'Venue': Venue,
                              'Result': res,
                              'Count': ct,
                            });
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SuccessPage(dialog: "Event    Added     Successfully :)",)));
                          }
                        }),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}