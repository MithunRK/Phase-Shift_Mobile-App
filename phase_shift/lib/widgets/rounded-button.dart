import 'package:flutter/material.dart';
import 'package:foodybite_app/pallete.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({
    @required this.buttonName,
    @required this.onPressed
  }) ;

  final String buttonName;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kBlue,
      ),
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          buttonName,
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
