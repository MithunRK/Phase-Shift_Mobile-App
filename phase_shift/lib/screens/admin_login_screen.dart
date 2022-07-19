import 'package:flutter/material.dart';
import 'package:foodybite_app/pallete.dart';
import 'package:foodybite_app/widgets/background-image.dart';
import 'package:foodybite_app/widgets/rounded-button.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AdminLoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _AdminLoginScreenState createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {

  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(
          image: 'assets/images/admin.jpg',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: kWhite,
              ),
            ),
          ),
          body: Column(
            children: [
              Flexible(
                child: Center(
                  child: Text(
                    'ADMIN',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
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
                          obscureText: true,
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
                    buttonName: 'Login',
                    onPressed: () async {
                      try{
                        if(email == null || password == null){
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Email or password cannot be null",
                                    style: kBodyText,),
                                  actions: [
                                    FlatButton(onPressed: () => {Navigator.pop(context),}, child: Text("Ok",style: kBodyText,)),
                                  ],
                                  elevation: 24.0,
                                  backgroundColor: Colors.blueAccent.shade200,
                                );
                              }
                          );
                        }
                        else if (email != "admin@gmail.com"){
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Only admin can login!!!",
                                    style: kBodyText,),
                                  actions: [
                                    FlatButton(onPressed: () => {Navigator.pop(context),}, child: Text("Ok",style: kBodyText,)),
                                  ],
                                  elevation: 24.0,
                                  backgroundColor: Colors.blueAccent.shade200,
                                );
                              }
                          );
                        }
                        else{
                          final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                          if(user != null){
                            Navigator.pushNamed(context, 'AdminSliderPage');
                          }
                        }
                      }catch(e){
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
            ],
          ),
        )
      ],
    );
  }
}