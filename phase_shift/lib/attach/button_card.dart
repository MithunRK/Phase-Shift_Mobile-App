import 'package:flutter/material.dart';
import 'constant.dart';

class ButtonContainer extends StatelessWidget {
  String dept;
  Function() onPressed;
  ButtonContainer({@required this.dept, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 100.0,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: ElevatedButton(
        onPressed: onPressed,
        /*color: Colors.white30,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),*/
        style: ElevatedButton.styleFrom(
            primary: Colors.white30,
            fixedSize: const Size(300, 100),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18))),
        child: Text(
          '$dept',
          style: kDeptStyle,
        ),
      ),
    );
  }
}
