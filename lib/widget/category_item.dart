
import 'package:flutter/material.dart';

import '../utils.dart';

class CategoryItem extends StatelessWidget{
  CategoryItem(this.name,this.image);
  String name;
  String image;
  @override
  Widget build(BuildContext context){
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return  Container(
      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
      width: 70*fem,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 6*fem),
            width: double.infinity,
            height: 60*fem,
            child: Stack(
              children: [
                Positioned(
                  left: 3*fem,
                  top: 3*fem,
                  child: Align(
                    child: SizedBox(
                      width: 54*fem,
                      height: 54*fem,
                      child: Container(
                        decoration: BoxDecoration (
                          borderRadius: BorderRadius.circular(27*fem),
                          image: DecorationImage (
                            fit: BoxFit.cover,
                            image: NetworkImage (image
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0*fem,
                  top: 0*fem,
                  child: Align(
                    child: SizedBox(
                      width: 60*fem,
                      height: 60*fem,
                      child: Image.asset(
                        'assets/page-1/images/ellipse-BLL.png',
                        width: 60*fem,
                        height: 60*fem,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              width: double.infinity,
              child: Text(name,
                textAlign: TextAlign.center,
                style: SafeGoogleFont (
                  'Lato',
                  fontSize: 14*ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.2*ffem/fem,
                  color: Color(0xff000000),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}