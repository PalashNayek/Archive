import 'package:flutter/material.dart';

import '../utils.dart';

class InterestWidgetItem extends StatelessWidget
{
  InterestWidgetItem(this.name,this.icon);
  String name;
  String icon;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double baseWidth = 390;
    double fem = MediaQuery
        .of(context)
        .size
        .width / baseWidth;
    double ffem = fem * 0.97;
    return    Container(
      padding: EdgeInsets.fromLTRB(9*fem, 7*fem, 3*fem, 4*fem),
      width: 111*fem,
      height: 40*fem,
      decoration: BoxDecoration (
        border: Border.all(color: Color(0xffdbdbdb)),
        color: Color(0x3dd9d9d9),
        borderRadius: BorderRadius.circular(5*fem),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // epp (60:760)
            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
            width: 34*fem,
            height: 34*fem,
            child: Image.asset(icon,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            // cricketaCg (60:759)
            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
            child: Text(name,
              style: SafeGoogleFont (
                'Lato',
                fontSize: 14*ffem,
                fontWeight: FontWeight.w700,
                height: 1.2*ffem/fem,
                color: Color(0xff626262),
              ),
            ),
          ),
        ],
      ),
    );
  }
}