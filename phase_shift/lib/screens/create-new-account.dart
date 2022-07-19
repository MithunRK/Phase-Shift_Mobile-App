import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodybite_app/pallete.dart';
import 'package:foodybite_app/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';


class CreateNewAccount extends StatefulWidget {
  static String id = 'createnewaccount_screen';

  @override
  _CreateNewAccountState createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {

  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(image: 'assets/images/act_reg.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.1,
                ),
                Stack(
                  children: [
                    Center(
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: CircleAvatar(
                            radius: size.width * 0.14,
                            backgroundColor: Colors.grey[400].withOpacity(
                              0.4,
                            ),
                            child: Icon(
                              FontAwesomeIcons.user,
                              color: kWhite,
                              size: size.width * 0.1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.08,
                      left: size.width * 0.56,
                      child: Container(
                        height: size.width * 0.1,
                        width: size.width * 0.1,
                        decoration: BoxDecoration(
                          color: kBlue,
                          shape: BoxShape.circle,
                          border: Border.all(color: kWhite, width: 2),
                        ),
                        child: Icon(
                          FontAwesomeIcons.arrowUp,
                          color: kWhite,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.width * 0.1,
                ),
                Column(
                  children: [
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
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),

                              ),
                              hintText: "Email",
                              hintStyle: kBodyText,
                            ),
                            style: kBodyText,
                            onChanged: (value) {
                              email = value;
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
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              ),
                              hintText: "Password",
                              hintStyle: kBodyText,
                            ),
                            style: kBodyText,
                            onChanged: (value) {
                              password = value;
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
                      onPressed: () async {
                        try {
                          if (email == null || password == null) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      "Email or password cannot be null",
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
                          } else {
                            if (email.split("@")[1] != "bmsce.ac.in") {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        "Only BMSCE email is allowed!!!",
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
                            } else {
                              final newUser = await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);
                              if (newUser != null) {
                                Navigator.pushNamed(context, '/');
                              }
                            }
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: kBodyText,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: Text(
                            'Login',
                            style: kBodyText.copyWith(
                                color: kBlue, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

