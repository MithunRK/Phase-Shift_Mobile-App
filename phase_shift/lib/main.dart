import 'package:flutter/material.dart';
import 'package:foodybite_app/screens/event_screen.dart';
import 'package:foodybite_app/screens/result_update.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:foodybite_app/screens/event_reg_screen.dart';
import 'package:foodybite_app/screens/admin_slider.dart';
import 'package:foodybite_app/screens/result_page.dart';
import 'package:foodybite_app/screens/admin_result_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Phase Shift',
      theme: ThemeData(
        textTheme:
            GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        'AdminLoginScreen': (context) => AdminLoginScreen(),
        'AdminSliderPage': (context) => AdminSliderPage(),
        'CreateNewAccount': (context) => CreateNewAccount(),
        'EventPage': (context) => EventPage(),
        'SliderPage': (context) => SliderPage(),
        'DepartmentPage': (context) => DepartmentPage(),
        'EventRegPage': (context) => EventRegPage(),
        'ResultUpdatePage': (context) => ResultUpdatePage(),
        'ResultPage': (context) => ResultPage(),
        'AdminResultPage': (context) => AdminResultPage(),
      },
    );
  }
}
