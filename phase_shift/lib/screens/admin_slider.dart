import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodybite_app/attach/aboutus.dart';
import 'package:foodybite_app/attach/carousal_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:foodybite_app/attach/button_card.dart';
import 'package:foodybite_app/attach/constant.dart';
import 'package:foodybite_app/attach/drawer_card.dart';
import 'package:foodybite_app/pallete.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'admin_department_page.dart';

User loggedInUser;

class AdminSliderPage extends StatefulWidget {
  static String id = 'slider_screen';

  @override
  _AdminSliderPageState createState() => _AdminSliderPageState();
}

class _AdminSliderPageState extends State<AdminSliderPage> {
  final _auth = FirebaseAuth.instance;

  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    String em = loggedInUser.email.toString();
    String name = em.split("@")[0];
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("PHASE SHIFT - ADMIN"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Do you really want to exit?",
                          style: kBodyText,),
                        actions: [
                          FlatButton(onPressed: () => {Navigator.pop(context),}, child: Text("No",style: kBodyText,)),
                          FlatButton(
                            onPressed: () => {
                              _auth.signOut(),
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
              }),
        ],
      ),
      drawer: DrawerCard(email: em, name: name, sym: name[0]),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AboutUs(),

            /*Expanded(
                child: CarousalSlider(),
            ),*/
            SizedBox(
              child: Text(
                'Gallery',
                style: kTextStyle1,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Center(
              child: CarouselSlider(
                  options: CarouselOptions(height: 250, autoPlay: true),
                  items: [
                    CarousalSlider(
                      imgPath: 'assets/images/presentation1.jpeg',
                    ),
                    CarousalSlider(
                      imgPath: 'assets/images/presentation2.jpeg',
                    ),
                    CarousalSlider(
                      imgPath: 'assets/images/presentation3.jpeg',
                    ),
                    CarousalSlider(
                      imgPath: 'assets/images/presentation4.jpeg',
                    ),
                    CarousalSlider(
                      imgPath: 'assets/images/presentation4.jpeg',
                    ),
                  ]),
            ),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              child: Text(
                'Departments',
                style: kTextStyle1,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ButtonContainer(
                    dept: 'CSE',
                    onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> AdminDepartmentPage( dept: 'CSE',deptName: "Computer Science & Engg",),));
                    },
                  ),
                ),
                Expanded(
                    child: ButtonContainer(
                      dept: 'ISE',
                      onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=> AdminDepartmentPage( dept: 'ISE',deptName: "Information Science & Engg",),));
                      },
                    )),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ButtonContainer(
                    dept: 'ECE',
                    onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> AdminDepartmentPage( dept: 'ECE',deptName: "Electronics Engg",),));
                    },
                  ),
                ),
                Expanded(
                  child: ButtonContainer(
                    dept: 'EEE',
                    onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> AdminDepartmentPage( dept: 'EEE',deptName: "Electrical Engg",),));
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ButtonContainer(
                    dept: 'ML',
                    onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context)=> AdminDepartmentPage( dept: 'ML',deptName: "Machine Learning Engg",),));},
                  ),
                ),
                Expanded(
                  child: ButtonContainer(
                    dept: 'ME',
                    onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> AdminDepartmentPage( dept: 'ME',deptName: "Mechanical Science & Engg",),));
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ButtonContainer(
                    dept: 'TC',
                    onPressed: (){},
                  ),
                ),
                Expanded(
                  child: ButtonContainer(
                    dept: 'CE',
                    onPressed: (){},
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
