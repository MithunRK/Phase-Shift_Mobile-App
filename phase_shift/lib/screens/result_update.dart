import 'package:flutter/material.dart';
import 'package:foodybite_app/pallete.dart';
import 'package:foodybite_app/widgets/rounded-button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodybite_app/screens/Success.dart';

final _firestore = FirebaseFirestore.instance;
String doc_id;

class ResultUpdatePage extends StatelessWidget {

  //EventRegPage({this.event});

  String ename;
  String tname;
  String sem;
  String dept;

  void getEvent() async {
    await for (var snapshot in _firestore.collection(dept).snapshots()){
      for (var event in snapshot.docs){
        if (ename == event['EventName']){
          doc_id = event.id.toString();
          print(doc_id);
          break;
        }
      }
    }
  }


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
                    SizedBox(
                      height: 50.0,
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
                              hintText: "Event Name",
                              hintStyle: kBodyText,
                            ),
                            style: kBodyText,
                            onChanged: (value) {
                              ename = value;
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
                              hintText: "Winner",
                              hintStyle: kBodyText,
                            ),
                            style: kBodyText,
                            onChanged: (value) {
                              tname = value;
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
                              hintText: "Department",
                              hintStyle: kBodyText,
                            ),
                            style: kBodyText,
                            onChanged: (value) {
                              dept = value;
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
                              hintText: "Sem",
                              hintStyle: kBodyText,
                            ),
                            style: kBodyText,
                            onChanged: (value) {
                              sem = value;
                            },
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 25,
                    ),
                    RoundedButton(
                        buttonName: 'Upload',
                        onPressed: () {
                         if(ename == null || tname == null || sem == null || dept == null){
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
                           _firestore.collection('Result').add({
                             'eventname': ename,
                             'winner': tname,
                             'sem': sem,
                             'department': dept,
                           });
                           getEvent();
                           _firestore.collection(dept).doc(doc_id).update({'Result': 'T'});
                           Navigator.push(context, MaterialPageRoute(builder: (context) => SuccessPage(dialog: "Result Uploaded Successfully :)",)));
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