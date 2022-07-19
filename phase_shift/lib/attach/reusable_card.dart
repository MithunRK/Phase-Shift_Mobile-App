import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  int imgNumber;
  ReusableCard({@required this.imgNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: AssetImage('assets/presentation$imgNumber.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
