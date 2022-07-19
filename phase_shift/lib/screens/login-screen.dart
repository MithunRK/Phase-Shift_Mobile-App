import 'package:flutter/material.dart';
import 'package:foodybite_app/pallete.dart';
import 'package:foodybite_app/screens/event_screen.dart';
import 'package:foodybite_app/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(
          image: 'assets/images/log.jpg',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Flexible(
                child: Center(
                  child: Text(
                    'PHASE SHIFT',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
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
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
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
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, 'AdminLoginScreen'),
                    child: Text(
                      'Admin-Login',
                      style: kBodyText,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  RoundedButton(
                    buttonName: 'Login',
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
                            final user = await _auth.signInWithEmailAndPassword(
                                email: email, password: password);
                            if (user != null) {
                              Navigator.pushNamed(context, 'SliderPage');
                            }
                          }
                        }
                      } catch (e) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  e.toString().split("]")[1],
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
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'CreateNewAccount'),
                child: Container(
                  child: Text(
                    'Create New Account',
                    style: kBodyText,
                  ),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(width: 1, color: kWhite))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
