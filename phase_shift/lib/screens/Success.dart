import 'package:flutter/material.dart';

const dTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 25.0,
  fontWeight: FontWeight.w600,
);

class SuccessPage extends StatelessWidget {

  SuccessPage({this.dialog});

  final bool isOpen = false;

  String dialog;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) => LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.center,
        colors: [Colors.black, Colors.transparent],
      ).createShader(rect),
      blendMode: BlendMode.colorDodge,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
            image: AssetImage(
              'assets/images/success.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.black12.withOpacity(0.4),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }),
            ],
            title: Text("PHASE SHIFT"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(left: 60.0),
                child: Text(
                  dialog,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Material(
                    color: Colors.blue.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      margin: EdgeInsets.all(1.0),
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.pop(context),
                          Navigator.pop(context),
                          Navigator.pop(context)
                        },
                        child: Container(
                          child: Center(
                            child: Text(
                              "Go-Back",
                              style: dTextStyle.copyWith(color: Colors.white),
                            ),
                          ),
                          height: 30.0,
                          width: 180.0,
                          margin: EdgeInsets.all(12.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

