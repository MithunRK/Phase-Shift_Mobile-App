import 'package:flutter/material.dart';
import 'package:foodybite_app/attach/constant.dart';

class AboutUs extends StatefulWidget {

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {

  bool _expanded = false;
  //var _test = "Full Screen";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              color: Colors.blue,
              child: ExpansionPanelList(
                animationDuration: Duration(milliseconds: 2000),
                children: [
                  ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: Text('About Us', style: kAboutStyle,),
                      );
                    },
                    body:ListTile(
                      title: Text('Phase Shift is an annual tech symposium of BMS College Of Engineering and is one of the largest of its kind in South India. It encourages budding engineering students to exhibit their talents and demonstrate skills through competitions and workshops. It aims to coalesce ideas from industry in order to achieve high level of skill to help the students emerge as globally competent professionals. Participation of many industry experts and professionals creates a congenial atmosphere that knits learning and fun. By embracing technology, Phase Shift organises a plethora of events collaborated with industries that provides a neat paradigm to encourage technological advances through seminars, workshops, competitions and multidisciplinary events. By doing so, the sponsors get to influence people and work miracles. This not only helps to spread the ideology behind each event but also helps the sponsors get more publicity with our unique strategy for the same. They are assured of a huge benefit from the exposure to a large and diverse crowd that Phase Shift attracts.',
                        style: kTextStyle,),
                    ),
                    isExpanded: _expanded,
                    canTapOnHeader: true,
                  ),
                ],
                dividerColor: Colors.grey,
                expansionCallback: (panelIndex, isExpanded) {
                  _expanded = !_expanded;
                  setState(() {

                  });
                },

              ),
            ),
          ]
      ),
    );
  }
}
